var RFSBundleDB = angular.module("RFSBundleDB", ['ng', 'ngResource', 'ui.router',
                                                 'ngStorage', 'xeditable', 'ngTable', 'ngSanitize'])
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
            .state('drmFreeGameView', {
                url: '/drmfreegame/:titleSLug',
                templateUrl: '/templates/drmfreegames/view.html',
                controller: 'DrmfreegameViewCtrl'
            })
            .state('musictracks', {
                url: '/musictracks',
                templateUrl: '/templates/musictracks/index.html',
                controller: 'MusicTracksIndexCtrl'
            })
            .state('musictrackView', {
                url: '/musictrack/:titleSlug',
                templateUrl: '/templates/musictracks/view.html',
                controller: 'MusicTracksViewCtrl'
            })
            .state('androidgames', {
                url: '/androidgames',
                templateUrl: '/templates/androidgames/index.html',
                controller: 'AndroidGamesIndexCtrl'
            })
            .state('androidGameView', {
                url: '/androidgame/:titleSlug',
                templateUrl: '/templates/androidgames/View.html',
                controller: 'AndroidGamesViewCtrl'
            })
            .state('ebooks', {
                url: '/ebooks',
                templateUrl: '/templates/ebooks/index.html',
                controller: 'EbooksIndexCtrl'
            })
            .state('ebookView', {
                url: '/ebook/:titleSlug',
                templateUrl: '/templates/ebooks/view.html',
                controller: 'EbooksViewCtrl'
            })
            .state('importer', {
                url: '/importer',
                templateUrl: '/templates/importer/index.html',
                controller: 'ImporterIndexCtrl'
            })
            .state('humblebundle', {
                url: '/humblebundle',
                templateUrl: '/templates/importer/humblebundle.html',
                controller: 'ImporterIndexCtrl'
            })
            .state('indiegala', {
                url: '/indiegala',
                templateUrl: '/templates/importer/indiegala.html',
                controller: 'ImporterIndexCtrl'
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