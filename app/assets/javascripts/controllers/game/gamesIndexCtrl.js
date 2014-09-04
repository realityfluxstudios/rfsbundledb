'use strict';

RFSBundleDB.controller('GamesIndexCtrl', function ($rootScope, $scope, $filter,
                                                   $resource, $timeout, loadGames, ngTableParams) {

    var data = loadGames;

    $rootScope.highlight = 'games';

    $scope.tableParams = new ngTableParams({
        page: 1,            // show first page
        count: 10           // count per page
    }, {
        sorting: {
            title: 'asc'     // initial sorting
        },
        total: data.length, // length of data
        getData: function($defer, params) {
            // use build-in angular filter
            var filteredData = params.filter() ?
                $filter('filter')(data, params.filter()) :
                data;
            var orderedData = params.sorting() ?
                $filter('orderBy')(filteredData, params.orderBy()) :
                data;

            params.total(orderedData.length); // set total for recalc pagination
            $defer.resolve(orderedData.slice((params.page() - 1) * params.count(), params.page() * params.count()));

        },
        counts: [5,10,25,50,100]
    });

    $scope.$watch('[tableParams.$params, tableParams.data]', function () {
        $scope.tableParams.reload();
    });

    $scope.keyCount = function () {
        var count = 0;
        for (var i = 0; i < $scope.filteredGames.length; i++) {
            var game = $scope.filteredGames[i];
            if (game.hasOwnProperty('gamekeys_count')) {
                count += game.gamekeys_count;
            }
        }
        return count;
    };


});