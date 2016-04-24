<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<page:angular-template>

	<jsp:attribute name="title">
     	 	View Available Libraries
    </jsp:attribute>
    
    <jsp:body>		       		
	
    <script>
  
	    //$http and $resource config ['ngResource']
	    var app = angular.module("myApp", ['ngResource'	, 'smart-table']);
	
	    //$http
	  	app.controller("getJSON", function($scope, $http) {
		    $http.get('/SpringWebProject/getLibrariesJSON').
		      success(function(data, status, headers, config) {
		        $scope.libraries = data;
		  	  	console.log("http get /SpringWebProject/getLibrariesJSON"); 
		        console.dir(data);
		      }).
		      error(function(data, status, headers, config) {
		    	  console.log("Error in upload...");
		      });
		  
	    });  // app.controller
    
	</script>

	<h2>Here are the libraries I have avaliable...</h2>
	
	<div ng-app="myApp">
		<div  ng-controller="getJSON">
<!-- 			<table st-table="libraries" class="table table-striped">
			<thead>
				<th><b>userid</b></th>
				<th><b>Name</b></th>
				<th><b>Creator: </b></th>
				<th><b>Create Date: </b></th>
			</thead>
			<tbody ng-repeat="lib in libraries">
			<tr>
				<td>{{lib.id }}</td>
				<td>{{lib.libName}}</td>
				<td>{{lib.libCreator}}</td>
				<td>{{lib.libCreateDt}}</td>
			</tr>
			</tbody>
			</table>  -->


			<table st-table="libraries" class="table table-striped">
				<thead>
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Date Added</th>
					<th>Added By </th>
					<th>Download</th>
				</tr>
				</thead>
				<tbody>
				<tr ng-repeat="row in libraries">
					<td>{{row.id | uppercase}}</td>
					<td>{{row.libName}}</td>
					<td>{{row.libCreateDt | date}}</td>
					<td>{{row.libCreator }}</td>
					<td>
						<button class="btn btn-sm" popover-placement="top" popover="{{row.email}}" type="button">
							<i class="glyphicon glyphicon-eye-open"></i>
						</button>
						<a ng-href="mailto:{{row.email}}">Download</a></td>
					<td>
						<button type="button" ng-click="removeRow(row)" class="btn btn-sm btn-danger">
							<i class="glyphicon glyphicon-remove-circle">
							</i>
						</button>
					</td>
				</tr>
				</tbody>
			</table>

		</div>
	</div>
	</jsp:body>
</page:angular-template>
