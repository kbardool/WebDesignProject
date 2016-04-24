<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="page" tagdir="/WEB-INF/tags" %>


<page:angular-template>

	<jsp:attribute name="title">
     	 	AngularJS $http $resource
    </jsp:attribute>
    
    <jsp:body>		       		
	
    <script>
  
    //$http and $resource config ['ngResource']
    var app = angular.module("myApp", ['ngResource']);

    //$http
  	app.controller("getJSON", function($scope, $http) {
		   $http.get('/SpringWebProject/posts/1').
	      success(function(data, status, headers, config) {
	        $scope.post = data;
	  	  	console.log("http get /SpringWebProject/posts/1"); 
	        console.log(data);
	      }).
	      error(function(data, status, headers, config) {
	        // log error
	     });
	   
	    //test JSON as post
	    var post = {
	    		userId: 'Iput User Id',
				id : 	'1234',
				title : 'Test Title ',
				body: 	'Test Body'
		};
    
	    //$http
	    $http.post('/SpringWebProject/savePost', post).
	    success(function(data, status, headers, config) {
	      $scope.post = data;
		  console.log("http post /SpringWebProject/savePost"); 
	      console.log(data);
	    }).
	    error(function(data, status, headers, config) {
	      // log error
	    });
	  
	    });

  	//$resource
  	//$resource configuration object is Posts used for CRUD
  	app.factory("Posts", function($resource) {
		console.log("Posts Factory "+"/SpringWebProject/posts/:id");  		
	  	return $resource("/SpringWebProject/posts/:id");
	});

    //$resource
  	//get post id mapped to @RestController getPostByID
  	app.controller("PostQueryByIdController", function($scope, Posts) {
  		Posts.get({ id: 1 }, function(data) {
  		  $scope.posts = data;
  		  console.log("Post Query by Id Controller ");
  		  console.log(data);
  	  });
  	});
  	
  	//$resource
  	//delete a post mapped to @RestController deletePostByID
  	app.controller("DeletePostByIdController", function($scope, Posts) {
		  console.log("Delete Post by Id Controller ");
  		  Posts.delete({ id: 1 });
  	});
  	

	</script>

	<h1>AngularJS $http $resource</h1>
	
	<div ng-app="myApp">
	
	<div  ng-controller="getJSON">
		<table class="table table-striped">
			<tr>
				<td><b>userid</b></td>
				<td>{{ post.userId }}</td>
			</tr>
			<tr>
				<td><b>id</b></td>
				<td>{{ post.id }}</td>
			</tr>
			<tr>
				<td><b>title</b></td>
				<td>{{ post.title}}</td>
			</tr>
			<tr>
				<td><b>body</b></td>
				<td>{{ post.body }}</td>
			</tr>
		</table> 
	</div>
	
	<div ng-controller="PostQueryByIdController"></div> 
	
	<div ng-controller="DeletePostByIdController"></div> 

	</div>

	</jsp:body>
</page:angular-template>
