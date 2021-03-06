'use strict';

RFSBundleDB.controller('GamesViewCtrl',  function($rootScope, $location, $scope, $http, $resource, $stateParams,$sce) {

        $rootScope.highlight = 'games';

        $scope.steam_api = {};

        $scope.loadGame = $http.get('/api/games/' + $stateParams.titleSlug + '.json').then(
            function(result){
                $scope.game = result.data;
                $scope.steam_id_before = $scope.game.steam.steam_id;
            },
            function(error){
                console.log("Game data didn't load properly..." + error.data);
            }
        );

        $scope.updateGame = function(field) {
            var game = {};

            game.id = $scope.game.basic.id;

            if(field == 'title')
            {
                $scope.game.title_slug = game.title_slug = convertToSlug(game.title);
                game.title = $scope.game.title;
            }
            else if(field == 'steam_id')
            {
                game.steam_id = $scope.game.steam.steam_id;

                $http.get('/api/check_steam_id/' + game.steam_id + '.json').then(
                    function(result){
                        console.log(result);

                        $scope.game.steam.steam_id = game.steam_id;
                        $scope.steam_api.name = result['data']['basic']['title'];

                        $http.put('/api/games/' + game.id + '.json', game);
                    },
                    function(error){
                        $scope.steam_api.name = error.data.error;
                        $scope.game.steam.steam_id = $scope.steam_id_before;
                    }
                )
            }
        };

        $scope.parseDescription = function() {
            if($scope.game)
                return $sce.trustAsHtml($scope.game.steam.html.description);
        };

        $scope.parseAbout = function() {
            if($scope.game)
                return $sce.trustAsHtml($scope.game.steam.html.about);
        };

        $scope.parseReqs = function(platform) {
            if(platform === 'pc_min')
                return $sce.trustAsHtml($scope.game.steam.html.reqs.pc.min);
            else if(platform === 'pc_rec')
                return $sce.trustAsHtml($scope.game.steam.html.reqs.pc.rec);
            else if(platform === 'mac_min')
                return $sce.trustAsHtml($scope.game.steam.html.reqs.mac.min);
            else if(platform === 'mac_rec')
                return $sce.trustAsHtml($scope.game.steam.html.reqs.mac.rec);
            else if(platform === 'linux_min')
                return $sce.trustAsHtml($scope.game.steam.html.reqs.linux.min);
            else if(platform === 'linux_rec')
                return $sce.trustAsHtml($scope.game.steam.html.reqs.linux.rec);
        };

        $scope.fade = function(){
          if($scope.steam_id != null){
              return 'fade-out';
          }
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