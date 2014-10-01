'use strict';

// Bundles controller
RFSBundleDB.controller('BundlesIndexCtrl', function($rootScope, $scope, $filter,
                                                    $timeout, loadBundles, ngTableParams) {
    console.log("BUNDLES Index CONTROLLER");

    $rootScope.highlight = 'bundles';

    var data = loadBundles;

    // so I can get extra info from the data and it be exposed on the view
    $scope.bundles = data;

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
                $filter('filter')(data, params.filter()) : data;
            var orderedData = params.sorting() ?
                $filter('orderBy')(filteredData, params.orderBy()) : data;

            $scope.bundles = filteredData;

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
    }, 2000);

    $scope.gamesCount = function(){
        var count = 0;
        for(var i=0; i < $scope.bundles.length; i++) {
            var bundle = $scope.bundles[i];
            if (bundle.hasOwnProperty('games_count')) {
                count += bundle.games_count;
            }
        }
        return count;
    };

    $scope.androidGamesCount = function(){
        var count = 0;
        for(var i=0; i < $scope.bundles.length; i++) {
            var bundle = $scope.bundles[i];
            if (bundle.hasOwnProperty('androidgames_count')) {
                count += bundle.androidgames_count;
            }
        }
        return count;
    };

    $scope.drmFreeGamesCount = function(){
        var count = 0;
        for(var i=0; i < $scope.bundles.length; i++) {
            var bundle = $scope.bundles[i];
            if (bundle.hasOwnProperty('drmfreegames_count')) {
                count += bundle.drmfreegames_count;
            }
        }
        return count;
    };

    $scope.musicTracksCount = function(){
        var count = 0;
        for(var i=0; i < $scope.bundles.length; i++) {
            var bundle = $scope.bundles[i];
            if (bundle.hasOwnProperty('musictracks_count')) {
                count += bundle.musictracks_count;
            }
        }
        return count;
    };

    $scope.ebooksCount = function(){
        var count = 0;
        for(var i=0; i < $scope.bundles.length; i++) {
            var bundle = $scope.bundles[i];
            if (bundle.hasOwnProperty('ebooks_count')) {
                count += bundle.ebooks_count;
            }
        }
        return count;
    };
    $scope.gameKeysCount = function(){
        var count = 0;
        for(var i=0; i < $scope.bundles.length; i++) {
            var bundle = $scope.bundles[i];
            if (bundle.hasOwnProperty('gamekeys_count')) {
                count += bundle.gamekeys_count;
            }
        }
        return count;
    };
});