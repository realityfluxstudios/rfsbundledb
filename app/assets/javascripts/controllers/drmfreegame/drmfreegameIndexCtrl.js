'use strict';

// Bundles controller
RFSBundleDB.controller('DrmfreegameIndexCtrl',  function($rootScope, $location, $scope, loadDrmfreegames) {

        $rootScope.highlight = 'drmfreegames';

        console.log("DRM Free Games Index CONTROLLER");

        $scope.bundles = {
            name: "Loading DRM Free Games..."
        };

        $scope.drmfreegames = loadDrmfreegames; //$resource("/api/drm_free_games.json").query();

        $scope.sortField = 'title';

        $scope.filtered = [];
    }
);