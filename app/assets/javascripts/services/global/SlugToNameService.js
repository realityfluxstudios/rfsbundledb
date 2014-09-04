RFSBundleDB.service("SlugToNameService", function(){
   return {
       bundle: function(slug){
           var bundle = $resource("/bundle/:slug.json").query();
           return bundle.title;
       }
//       game: function(slug){
//
//       },
//       drmfreegame: function(slug){
//
//       },
//       ebook: function(slug){
//
//       },
//       musictrack: function(slug){
//
//       },
//       androidgame: function(slug){
//
//       }
   }
});