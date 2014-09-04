'use strict';

// Bundles controller
RFSBundleDB.controller('MusictrackIndexCtrl',  function($rootScope, $location, $scope, loadMusicTracks) {

        $rootScope.highlight = 'musictrack';

        console.log("MusicTracks Index CONTROLLER");

        $scope.bundles = {
            name: "Loading Music tracks..."
        };

        $scope.bundles = loadMusicTracks; //$resource("/api/bundles.json").query();

        $scope.filtered = [];

    }
);