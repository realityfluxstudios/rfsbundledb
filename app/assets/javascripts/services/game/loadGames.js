RFSBundleDB.factory('loadGames', function($resource) {
    return $resource("/api/games.json").query();
});