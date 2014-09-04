'use strict';

RFSBundleDB.controller('BundlesNewCtrl',  function($rootScope, $location, $scope, $window) {

    window.addEventListener('focus', function(){
        console.log('focus');
        $scope.$digest()
    });

//    $scope.readLS = function(){
//        $scope.testingLS = $window.localStorage.getItem('TestData');
//    };

    $scope.$watch(
        function(){
            return $window.localStorage.getItem('TestData');
        },
        function(newValueInStorage){
            $scope.testingLS = newValueInStorage;
        }
    )
});