RFSBundleDB.factory('loadBundles', function($resource) {
    return $resource("/api/bundles.json").query();
});