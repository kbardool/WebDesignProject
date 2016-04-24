/**
 *  var myApp1 = angular.module('addLibrary', [])
 */
	angular.module('addLibrary', [])
		.value("myApp1Value", {
		    Module: "MyApp1",
		    author: "K Bardool"
		})        
		
		.directive('fileModel', ['$parse', function ($parse) {
		    return {
		       restrict: 'A',
		       link: function(scope, element, attrs) {
		          var model = $parse(attrs.fileModel);
		          var modelSetter = model.assign;
		          
		          element.bind('change', function(){
		             scope.$apply(function(){
		                modelSetter(scope, element[0].files[0]);
		             });
		          });
		       }
		    };
		 }])
		 
		 
		 .service('fileUpload', ['$http', function ($http) {
		    this.uploadFileToUrl = function(file, uploadUrl){
		    	
		       var fd = new FormData();
		       fd.append('file', file);
				var f = $scope.selectedFiles[0]; 
	            console.log("getelementbyid(lib)file) is");
	            console.dir(f);
				
				
		       console.log(uploadUrl);
		       console.log(fd);
		       $http.post(uploadUrl, fd, {
		          transformRequest: angular.identity,
		          headers: {'Content-Type': undefined}
		       })
		    
		       .success(function(status){
		           alert("Success ... " + status);
		       })
		    
		       .error(function(status){
		               alert("Error in upload..."+status);
		       });
		    }
		 }])
		 
		 
		 .controller('addLibraryCtrl', ['$scope', '$http' , function($scope, $http )
		 {	 
			 //postApp.controller('postController', function($scope, $http) {
			 // create a blank object to handle form data.
			 var defDate = new Date();
			 $scope.lib = {};
			 $scope.lib.lib_name = "enter library name";    
 			 $scope.lib.lib_creator = "enter creator";
 			 $scope.lib.lib_description = "enter brief description";
 			 $scope.lib.lib_create_dt = defDate;
 			 
 			 
			 // calling our submit function.

			 $scope.submit = function() {
			 // Posting data
				console.log("kevin "+$scope.lib_name);
		 
	            var file = $scope.myFile;
	            var data = angular.toJson($scope.lib);
//	            var f = document.getElementById('lib_file');

	            console.log("file is ");
	            console.dir(file);     
				console.log("data is ") ;
				console.dir(data);
 
	            var dataObj = {
						  id : 100,
						  libName : 		$scope.lib.lib_name,
						  libCreator : 		$scope.lib.lib_creator,
						  libCreateDt : 	$scope.lib.lib_create_dt,
						  libDescription : 	$scope.lib.lib_description, 
						  libFilename : 	$scope.myFile.name
					};		      
						
				console.log("dataObj is :");
				console.dir(dataObj);
				console.log("my file is :"+ file.name);
				
				//var res = $http.post('/SpringWebProject/saveLibraryJSON', dataObj);
/*                $scope.upload = $upload.upload({
                    url: 'api/upload',
                    method: 'POST',
                    data: angular.toJson($scope.lib),
                    file: file
                }).progress(function (evt) {
                    $scope.uploadProgress = parseInt(100.0 * evt.loaded / evt.total, 10);
                }).success(function (data) {
                    alert("Success");
                });				 
				*/
				
				
				
 				 
			      $http({
			          method  : 'POST',
			          url     :'/SpringWebProject/saveLibraryJSON',
			          data    : $scope.lib, //forms user object
			          file    : file,
			          // headers : {'Content-Type': 'application/x-www-form-urlencoded'} 
			      	  headers: { 'Content-Type': 'undefined'},
			      })
			        .success(function(data) {
			            console.log("Success in upload..."+data);
			            if (data.errors) {
			              // Showing errors.
			              $scope.errorLibraryName = data.errors.lib_name;
			              $scope.errorUserName 	= data.errors.username;
			              $scope.errorEmail 	= data.errors.email;
			            } else {
			              $scope.message = data.message;
			            }
			          })
		       		.error(function(status){
		       			console.log("Error in upload..."+status);
		       		}); 
				
			 };  //$scope.submit()
			 
		 }]);
		 
 
 
/*		 .controller('myCtrl1', ['$scope', 'fileUpload', function($scope, fileUpload){
 * 
		    $scope.uploadFile = function(){
		       var file = $scope.myFile;
		       
		       console.log('file is ' );
		       console.dir(file);
		       
		       var uploadUrl = "./fileUpload";
		       fileUpload.uploadFileToUrl(file, uploadUrl);
		    };
			 }]);    
		    */

	 
	  