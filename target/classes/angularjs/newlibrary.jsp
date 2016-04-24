<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<page:angular-template>

	<jsp:attribute name="title">
     	Add new library file
    </jsp:attribute>
    
    <jsp:body>		       		


	
			<style type="text/css">
			  input.ng-invalid {
		  		border: 2px solid red;
			  }
			  input.ng-valid {
		 	   border: 2px solid green;
			  }
			</style>
	
		    <!-- AngularJS myApp -->
		  	<spring:url value="/resources/angularjs/modules/myApp1.js"      var="myApp1" />
			<script src="${myApp1}"></script>
	

		
			<!-- novalidate option on forms will disable HTML5 related validations -->
			
			<!-- 
			Specific AngularJS Form Properties
			
			Accessing input AngularJS properties
			syntax: formName.AngularJSProperty
			example: libraryForm.$invalid
			
			$invalid: style class:ng-invalid The content of the field is invalid
			$valid:   style class:ng-valid The content of the field is valid
			$touched: style class:ng-touched The form or input has been blurred
			$pristine: style class:ng-pristine The form or input has NOT been used
			$dirty: style class:ng-dirty The form or input has been used
			
			Accessing input AngularJS properties
			syntax: formName.fieldName.AngularJSProperty
			example: libraryForm.username.$invalid

			 -->

	<h2>New library file information</h2>	
	<br />
	
	Use this page to enter library file information, select the file to upload and 
	submit the new library to the file server. 
	<br /><br />
	The file will be uploaded to the file server, and a new entry will be created in 
	the <strong>LIBRARY</strong> table, which keeps track of all library files advertised by this 
	server.
		
	<div style="width: 600px" ng-app="myApp1" ng-controller="myCtrl1">
		<form name="libraryForm" novalidate>
	 
		<table class="table table-striped">
	
			<tr><td>Library name:</td><td><input type="text" name="lib_name" ng-model="lib.lib_name" ng-required="true" /> 
				<span style="color:red" ng-show="libraryForm.lib_name.$invalid">
					<span ng-show="libraryForm.lib_name.$error.required">Library Name is required</span>
				</span>

			</tr>

			<tr><td>Library Creator:</td><td><input type="text" name="lib_creator" ng-model="lib.lib_creator" ng-required="true" /> 
				<span style="color:red" ng-show="libraryForm.lib_creator.$invalid">
					<span ng-show="libraryForm.lib_creator.$error.required">Library Creator is required</span>
				</span>
			</tr>
			
			<tr><td>Library Create Date:</td><td><input type="date" name="lib_create_dt" ng-model="lib.lib_create_dt" ng-required="true" /> 
				<span style="color:red" ng-show="libraryForm.lib_create_dt.$invalid">
					<span ng-show="libraryForm.lib_create_dt.$error.required">Library Create date is required</span>
				</span>
			</tr>

			<tr><td>Library Description:</td><td><input type="text" name="lib_description" ng-model="lib.lib_description" ng-required="true" /> 
				<span style="color:red" ng-show="libraryForm.lib_description.$invalid">
					<span ng-show="libraryForm.lib_description.$error.required">Library Description is required</span>
				</span>
			</tr>
			
			<tr><td>Library File:  </td><td><input type ="file" file-model="myFile"/>
			        <!--  <button ng-click = "uploadFile()">Upload me</button> -->
			</tr>

			<br/><br/> 


			
			<tr>
				<td colspan="2" align="center"><button ng-click="submitForm()">Submit Library</button> </td>
			</tr>
						
		</table>	
 
		</form>
  		</br>
			
     </div>     
     <a href="javascript:history.back()">Back</a>

	
	</jsp:body>

</page:angular-template>



