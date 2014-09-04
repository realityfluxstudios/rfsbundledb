'use strict';

// Bundles controller
RFSBundleDB.controller('BundlesIndexCtrl', function($rootScope, $scope, $filter,
                                                    $resource, $timeout, loadBundles, ngTableParams) {
        $rootScope.highlight = 'bundles';

        console.log("BUNDLES Index CONTROLLER");

        var data = loadBundles;

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

//        $scope.gamesCount = function(){
//            var count = 0;
//            for(var i=0; i < $scope.filtered.length; i++) {
//                var bundle = $scope.filtered[i];
//                if (bundle.hasOwnProperty('games_count')) {
//                    count += bundle.games_count;
//                }
//            }
//            return count;
//        };
//
//        $scope.androidGamesCount = function(){
//            var count = 0;
//            for(var i=0; i < $scope.filtered.length; i++) {
//                var bundle = $scope.filtered[i];
//                if (bundle.hasOwnProperty('androidgames_count')) {
//                    count += bundle.androidgames_count;
//                }
//            }
//            return count;
//        };
//
//        $scope.drmFreeGamesCount = function(){
//            var count = 0;
//            for(var i=0; i < $scope.filtered.length; i++) {
//                var bundle = $scope.filtered[i];
//                if (bundle.hasOwnProperty('drmfreegames_count')) {
//                    count += bundle.drmfreegames_count;
//                }
//            }
//            return count;
//        };
//
//        $scope.musicTracksCount = function(){
//            var count = 0;
//            for(var i=0; i < $scope.filtered.length; i++) {
//                var bundle = $scope.filtered[i];
//                if (bundle.hasOwnProperty('musictracks_count')) {
//                    count += bundle.musictracks_count;
//                }
//            }
//            return count;
//        }
    }
);