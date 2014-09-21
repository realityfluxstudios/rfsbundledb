'use strict';

// Bundles controller
RFSBundleDB.controller('BundlesViewCtrl',  function($rootScope, $location, $scope, $http, $resource, $stateParams) {

        console.log("BUNDLES View CONTROLLER");

        $rootScope.highlight = 'bundles';

        var bundleJSON = '/api/bundles/' + $stateParams.titleSlug + '.json';

        console.log(bundleJSON);

        $scope.loadBundle = $http.get(bundleJSON).then(
            function(result){
                $scope.bundle = result.data;
            },
            function(){
                console.log("data didn't load properly");
            }
        );

        $scope.updateBundle = function() {
            var bundle = {};
            bundle.id = $scope.bundle.id;
            bundle.title = $scope.bundle.title;
            $scope.bundle.title_slug = bundle.title_slug = convertToSlug(bundle.title);

            return $http.put('/api/bundles/' + bundle.id + '.json', bundle);
        };

        function convertToSlug (value) {
            return value.toLowerCase()
                .replace(/-+/g, '')
                .replace(/\s+/g, '-')
                .replace(/[^a-z0-9-]/g, '')
                .replace(/--+/g, '-');
        }
    }
);