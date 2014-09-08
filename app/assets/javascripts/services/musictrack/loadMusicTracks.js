RFSBundleDB.factory('loadMusicTracks', function($resource) {
    return $resource("/api/musictracks.json").query();
});