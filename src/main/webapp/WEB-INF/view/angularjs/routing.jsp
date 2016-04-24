<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="page" tagdir="/WEB-INF/tags" %>

<page:angular-template>

	<jsp:attribute name="title">
     	AngularJS Routing
    </jsp:attribute>
    
    <jsp:body>		       		
	
	<script>
	  
	  var app = angular.module('myApp', ['ngRoute']);
	  
	  app.controller('ListPostController', function($scope) {
			$scope.posts = [
						 	{id: "Java Programming"			, title: 'Kevin Bardool 1'}, 
						 	{id: "Java Spring MVC Framework", title: 'Kevin Bardool 2'},
						 	{id: "Core Spring Framework 4"	, title: 'Kevin Bardool 3'},
						 	{id: "HTML5"					, title: 'Kevin Bardool 4'},
						 	{id: "AngularJS"				, title: 'Kevin Bardool 5'}
						  ];
	  });
	  
	  
	  app.controller('ListPostControllerJSON', function($scope,$http) {
		  $http.get('/SpringWebProject/posts').
	      success(function(data, status, headers, config) {
	        $scope.posts = data;
	        console.log(data);
	      }).
	      error(function(data, status, headers, config) {
	        // log error
	    	 console.log(data);
	         console.log(status);
	      });
	  });

	  app.controller('ListLibraryControllerJSON', function($scope,$http) {
		  $http.get('/SpringWebProject/getLibrariesJSON').
	      success(function(data, status, headers, config) {
	        $scope.posts = data;
	        console.log(data);
	      }).
	      error(function(data, status, headers, config) {
	        // log error
	    	 console.log(data);
	         console.log(status);
	      });
	  });
	  app.controller('GetPostController', function($scope,$routeParams) { 		  		  	
		  		//$routeParams is used to get postId /posts/:postId
		  		$scope.post = {id:$routeParams.postId, title:"Kevin's Title Test"};

	  });
	  	 
	  //ngRoute definition
	  //a route is defined after #sign #/posts/1 or #/postsJSON
	  app.config(['$routeProvider',
	      function($routeProvider) {
	          $routeProvider.
	            when('/posts', {
	              templateUrl: 'resources/angularjs/templates/listPost.html',
	              controller: 'ListPostController'
	            }).
	            when('/getLibrariesJSON', {
			          templateUrl: 'resources/angularjs/templates/listlibraries.html',
			          controller: 'ListLibraryControllerJSON'
			        }).	            
	            when('/postsJSON', {
		          templateUrl: 'resources/angularjs/templates/listPost.html',
		          controller: 'ListPostControllerJSON'
		        }).
	            when('/posts/:postId', {
	              templateUrl: 'resources/angularjs/templates/getPost.html',
	              controller: 'GetPostController'
	            }).
	            otherwise({
	              redirectTo: '/posts'
	        	});             
	 	}]);
	  
	  
	</script>
	
	
	<div ng-app="myApp">
		<h1>AngularJS Routing</h1><br/>		
		<div ng-view></div>
		<br/> 
		<a href="#/getLibrariesJSON">Get Libraries in JSON format</a><br/>
		<br/>		
		<br/> 
		<a href="#/posts/1">#/posts/1</a><br/>
		<br/>
		<br/>
		<a href="#/postsJSON">#/postsJSON</a><br/>
		<br/>
		<br/>
	</div>	
	
	
	</jsp:body>
</page:angular-template>



