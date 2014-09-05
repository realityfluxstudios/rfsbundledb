'use strict';

// Bundles controller
RFSBundleDB.controller('DrmfreegameIndexCtrl',  function($rootScope, $scope, $filter, $timeout, $q,
                                                         loadDrmfreegames, ngTableParams) {

        $rootScope.highlight = 'drmfreegames';

        console.log("DRM Free Games Index CONTROLLER");

        var data = loadDrmfreegames;

        $scope.drmfreegames = data;

        $scope.tableParams = new ngTableParams({
            page: 1,            // show first page
            count: 10           // count per page
        }, {
            groupBy: 'title',
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

                $scope.drmfreegames = orderedData;

                params.total(orderedData.length); // set total for recalc pagination
                $defer.resolve(orderedData.slice((params.page() - 1) * params.count(), params.page() * params.count()));

            },
            counts: [5,10,25,50,100]
        });


        var inArray = Array.prototype.indexOf ?
            function (val, arr) {
                return arr.indexOf(val)
            } :
            function (val, arr) {
                var i = arr.length;
                while (i--) {
                    if (arr[i] === val) return i;
                }
                return -1;
            };

        $scope.platform = function(column) {
            var def = $q.defer(),
                arr = [],
                names = [];

            $timeout(function(){
                angular.forEach(data, function(item){
                    if (inArray(item.name, arr) === -1) {
                        arr.push(item.name);
                        names.push({
                            'id': item.name,
                            'title': item.name
                        });
                    }
                });
            }, 1000);
            def.resolve(names);
            console.log(def.resolve(names));
            return def;
        };

        // hacky but this is needed to reload the table after the json is retrieved.
        // because it is a local site there should be very minimal latency with the retrieval so 500 should work
        // might have to increase it to 1000 or 1500 once more data is in the db.
        // TODO: check on delay of $timeout
        $timeout(function(){
            $scope.tableParams.reload();
        }, 500);

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
    }
);