'use strict';

// Bundles controller
RFSBundleDB.controller('DrmfreegameIndexCtrl',  function($rootScope, $scope, $filter, $timeout, $q,
                                                         loadDrmfreegames, ngTableParams) {

        $rootScope.highlight = 'drmfreegames';

        console.log("DRM Free Games Index CONTROLLER");

        var data = loadDrmfreegames;

        $scope.drmfreegames = data;

        $scope.groupby = 'title';

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

                $scope.drmfreegames = orderedData;

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

        $scope.uniqueDRMFree = function(){
            var i,
                title,
                count=0,
                uniqueResults= {};

            for (i in $scope.drmfreegames) {
                title= $scope.drmfreegames[i].title;
                if (!uniqueResults[title]) {
                    uniqueResults[title]= [];
                    count++;
                }

                uniqueResults[title].push($scope.drmfreegames[i]);
            }
            return count;
        };

        $scope.platformCounts = {
            windows: function(){
                var count = 0;
                var drmfreegame;
                for(var i=0; i < $scope.drmfreegames.length; i++){
                    drmfreegame = $scope.drmfreegames[i];
                    if(drmfreegame.platform.toLowerCase() === 'windows')
                        count++;
                }
                return count;
            },

            mac: function(){
                var count = 0;
                var drmfreegame;
                for(var i=0; i < $scope.drmfreegames.length; i++){
                    drmfreegame = $scope.drmfreegames[i];
                    if(drmfreegame.platform.toLowerCase() === 'mac')
                        count++;
                }
                return count;
            },
            linux: function(){
                var count = 0;
                var drmfreegame;
                for(var i=0; i < $scope.drmfreegames.length; i++){
                    drmfreegame = $scope.drmfreegames[i];
                    if(drmfreegame.platform.toLowerCase() === 'linux')
                        count++;
                }
                return count;
            }
        };

        $scope.$watch('groupby', function(value){
            $scope.tableParams.settings().groupBy = value;
            console.log('Scope Value', $scope.groupby);
            console.log('Watch value', this.last);
            console.log('new table',$scope.tableParams);
            $scope.tableParams.reload();
        });
    }
);