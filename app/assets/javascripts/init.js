var RFSBundleDB = angular.module("RFSBundleDB", ['ng', 'ngResource', 'ui.router', 'ngStorage', 'xeditable',
    'angularUtils.directives.dirPagination', 'ngTable'])
    .run(function (editableOptions) {
        editableOptions.theme = 'bs3';
    })
    .config(function ($stateProvider) {
        $stateProvider
            .state('bundles', {
                url: '/bundles',
                templateUrl: '/templates/bundles/index.html',
                controller: 'BundlesIndexCtrl'
            })
            .state('bundleNew', {
                url: '/bundle/new',
                templateUrl: '/templates/bundles/new.html',
                controller: 'BundlesNewCtrl'
            })
            .state('bundleView', {
                url: '/bundle/:titleSlug',
                templateUrl: '/templates/bundles/view.html',
                controller: 'BundlesViewCtrl'
            })
            .state('games', {
                url: '/games',
                templateUrl: '/templates/games/index.html',
                controller: 'GamesIndexCtrl'
            })
            .state('gameView', {
                url: '/game/:titleSlug',
                templateUrl: '/templates/games/view.html',
                controller: 'GamesViewCtrl'
            })
            .state('drmfreegames', {
                url: '/drmfreegames',
                templateUrl: '/templates/drmfreegames/index.html',
                controller: 'DrmfreegameIndexCtrl'
            })
            .state('musictracks', {
                url: '/musictracks',
                templateUrl: '/templates/musictracks/index.html',
                controller: 'MusicTracksIndexCtrl'
            })
            .state('androidgames', {
                url: '/androidgames',
                templateUrl: '/templates/androidgames/index.html',
                controller: 'AndroidGamesIndexCtrl'
            })
            .state('ebooks', {
                url: '/ebooks',
                templateUrl: '/templates/ebooks/index.html',
                controller: 'EbooksIndexCtrl'
            })
            .state('home', {
                url: '/',
                templateUrl: '/templates/index.html',
                controller: 'MainCtrl'
            })
        ;
    })
    .controller('MainCtrl', function ($rootScope, $scope, $location) {

        $rootScope.highlight = 'home';

        $scope.clickedLink = function (subdir) {
            $location.url("/" + subdir);
        };

        $rootScope.viewItem = function (slug) {
            $location.url($location.path() + slug);
        }
    });