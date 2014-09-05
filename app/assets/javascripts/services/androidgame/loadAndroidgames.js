RFSBundleDB.factory('loadAndroidgames', function($resource) {
    return $resource("/api/androidgames.json").query();
});