'use strict';

RFSBundleDB.controller('GamesViewCtrl',  function($rootScope, $location, $scope, $http, $resource, $stateParams) {

        $rootScope.highlight = 'games';

        $scope.loadBundle = $http.get('/api/games/' + $stateParams.titleSlug + '.json').then(
            function(result){
                $scope.game = result.data;
            },
            function(){
                console.log("data didn't load properly");
            }
        );
    }
);