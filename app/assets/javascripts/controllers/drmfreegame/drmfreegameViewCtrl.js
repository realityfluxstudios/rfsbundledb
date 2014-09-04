'use strict';

// Bundles controller
RFSBundleDB.controller('DrmfreegameViewCtrl',  function($rootScope, $location, $scope, $http, $resource, $stateParams) {

        $rootScope.highlight = 'drmfreegame';

        $scope.loadBundle = $http.get('/drmfreegame/' + $stateParams.nameSlug + '.json').then(
            function(result){
                $scope.bundle = result.data;
            },
            function(err){
                console.log("data didn't load properly: ");
                console.log(err);
            }
        );
    }
);