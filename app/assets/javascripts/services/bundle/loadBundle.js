RFSBundleDB.factory('loadBundle', function($resource) {
    console.log('load bundle');
    return $resource("/api/bundle/:titleSlug.json").query();
});