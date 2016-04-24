<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="page" tagdir="/WEB-INF/tags" %>


<page:angular-template>

	<jsp:attribute name="title">
     	AngularJS Dependency Injection (services, factories, mdoules, constant, values, providers)
    </jsp:attribute>
    
    <jsp:body>	
    
    <!-- AngularJS service -->
  	<spring:url value="/resources/angularjs/services/service.js"  var="service" />
	<script src="${service}"></script>
	
    <!-- AngularJS myApp -->
  	<spring:url value="/resources/angularjs/modules/root.js"      var="myApp" />
	<script src="${myApp}"></script>
	
	<!-- AngularJS factory -->
  	<spring:url value="/resources/angularjs/factories/factory.js" var="factory" />
	<script src="${factory}"></script>
	
	<!-- AngularJS provider -->
  	<spring:url value="/resources/angularjs/providers/provider.js" var="provider" />
	<script src="${provider}"></script>

    <div ng-app="myApp">
    
	<h2>AngularJS service</h2>
    <div  ng-controller="serviceController"> 
		<button ng-click="serviceMethod()">serviceMethod()</button>
	</div> 
	
	<h2>AngularJS factory</h2>
	<div  ng-controller="factoryController">
		{{ courseName }} 
	</div> 
	
	<h2>AngularJS provider</h2>
	<div  ng-controller="providerController">
		{{ courseName }} 	
	</div>

	<h2>AngularJS value</h2>
	<div ng-controller="valueController"> 
		udemy value module: {{ udemyObject }}
	</div>


	
	</div>
</jsp:body>
</page:angular-template>