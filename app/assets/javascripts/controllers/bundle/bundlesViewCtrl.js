'use strict';

// Bundles controller
RFSBundleDB.controller('BundlesViewCtrl',  function($rootScope, $location, $scope, $http, $resource, $stateParams) {

        console.log("BUNDLES View CONTROLLER");

        $rootScope.highlight = 'bundles';

        var bundleJSON = '/bundles/' + $stateParams.titleSlug + '.json';

        console.log(bundleJSON);

        $scope.loadBundle = $http.get(bundleJSON).then(
            function(result){
                $scope.bundle = result.data;
            },
            function(){
                console.log("data didn't load properly");
            }
        );
    }
);