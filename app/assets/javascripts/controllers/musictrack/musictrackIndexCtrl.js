'use strict';

// Bundles controller
RFSBundleDB.controller('MusicTracksIndexCtrl',  function($rootScope, $scope, $filter, $timeout, $q,
                                                        loadMusicTracks, ngTableParams) {

        $rootScope.highlight = 'musictrack';

        console.log("MusicTracks Index CONTROLLER");

        var data = loadMusicTracks;

        $scope.musictracks = data;

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

                $scope.musictracks = orderedData;

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

        $scope.uniqueAudioTracks = function(){
            var i,
                title,
                count=0,
                uniqueResults= {};

            for (i in $scope.musictracks) {
                title= $scope.musictracks[i].title;
                if (!uniqueResults[title]) {
                    uniqueResults[title]= [];
                    count++;
                }

                uniqueResults[title].push($scope.musictracks[i]);
            }
            return count;
        };
    }
);