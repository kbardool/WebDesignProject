//creates values or objects on demand

angular.module("myApp")
.value("testValue", "Kevin Bardool")
.factory("courseFactory", function(testValue) {
	var courseFactory = {
		    'Name': testValue,
		    'LastName': 'Bardool',
		     getCourse: function(){
		      alert('Course: ' + this.courseName);
		    }
		  };	
	return courseFactory;
})
.controller("factoryController", function($scope, courseFactory) {
	alert(courseFactory.courseName);
	$scope.courseName = courseFactory.courseName;
	console.log(courseFactory.courseName);
	courseFactory.getCourse();
});