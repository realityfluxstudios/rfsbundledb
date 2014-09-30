'use strict';

RFSBundleDB.controller('GamesIndexCtrl', function ($rootScope, $scope, $filter,
                                                   $timeout, loadGames, ngTableParams) {

    var data = loadGames;

    $scope.games = data;

    $rootScope.highlight = 'games';

    $scope.tableParams = new ngTableParams({
        page: 1,            // show first page
        count: 10,           // count per page
        sorting: {
            title: 'asc'     // initial sorting
        }
    }, {
        total: data.length, // length of data
        getData: function($defer, params) {
            // use build-in angular filter
            var filteredData = params.filter() ?
                $filter('filter')(data, params.filter()) :
                data;
            var orderedData = params.sorting() ?
                $filter('orderBy')(filteredData, params.orderBy()) :
                data;

            $scope.games = filteredData;

            params.total(orderedData.length); // set total for recalc pagination
            $defer.resolve(orderedData.slice((params.page() - 1) * params.count(), params.page() * params.count()));

        },
        counts: [10,25,50,100,500,1000]
    });

    // hacky but this is needed to reload the table after the json is retrieved.
    // because it is a local site there should be very minimal latency with the retrieval so 500 should work
    // might have to increase it to 1000 or 1500 once more data is in the db.
    // TODO: check on delay of $timeout
    $timeout(function(){
        $scope.tableParams.reload();
    }, 1000);

    $scope.keyCount = function () {
        var count = 0;
        for (var i = 0; i < $scope.games.length; i++) {
            var game = $scope.games[i];
            if (game.hasOwnProperty('gamekeys_count')) {
                count += game.gamekeys_count;
            }
        }
        return count;
    };
});