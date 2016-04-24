angular.module("myApp", ['serviceModule'])
  .value("udemy", {
     courseName: "angular myAppController",
     author: 	 "Kevin Bardool",
     getCourseDetails: function (){
    	 return this.courseName + " " + this.author;
    }
})
.controller("valueController", function ($scope, udemy)
{
    $scope.udemyObject = udemy;
});