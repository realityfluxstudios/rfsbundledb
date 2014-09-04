'use strict';

RFSBundleDB.controller('GamesIndexCtrl', function ($rootScope, $scope, $resource, $filter, loadGames) {

    $scope.games = loadGames;

    $rootScope.highlight = 'games';

    $scope.sortField = 'title';

    /* kind of hacky and causes errors, but it's the only way to make the pagination work with sorting on the fly */
    $scope.$watch(function () {
        return $filter('filter')($scope.games, $scope.query);
    }, function (val) {
        $scope.filteredGames = val;
    });

    $scope.filteredGames = [];

    $scope.keyCount = function () {
        var count = 0;
        for (var i = 0; i < $scope.filteredGames.length; i++) {
            var game = $scope.filteredGames[i];
            if (game.hasOwnProperty('gamekeys_count')) {
                count += game.gamekeys_count;
            }
        }
        return count;
    };


});