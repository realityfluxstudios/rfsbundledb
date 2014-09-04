'use strict';

// Bundles controller
RFSBundleDB.controller('musictracksViewCtrl',  function($rootScope, $location, $scope, $http, $resource, $stateParams) {

        $rootScope.highlight = 'musictracks';

        $scope.loadBundle = $http.get('/musictracks/' + $stateParams.titleSlug + '.json').then(
            function(result){
                $scope.bundle = result.data;
            },
            function(){
                console.log("data didn't load properly");
            }
        );
    }
);