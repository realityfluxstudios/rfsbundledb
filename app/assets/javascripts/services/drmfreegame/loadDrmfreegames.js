RFSBundleDB.factory('loadDrmfreegames', function($resource) {
    return $resource("/api/drm_free_games.json").query();
});