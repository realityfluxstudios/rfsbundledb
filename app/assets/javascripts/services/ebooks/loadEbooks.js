RFSBundleDB.factory('loadEbooks', function($resource) {
    return $resource("/api/ebooks.json").query();
});