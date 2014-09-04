RFSBundleDB.factory('loadMusicTracks', function($resource) {
    return $resource("/musictracks.json").query();
});