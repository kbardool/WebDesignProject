<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="page" tagdir="/WEB-INF/tags"%>
<page:template>
	<jsp:attribute name="title">
     	Controller Mapping Examples
    </jsp:attribute>
	<jsp:body>
		<div class="well">
			<h1>
				<b>Controller Mapping Examples</b>
			</h1>
			<br />
				<c:url value="/controllerBeanName.html" var="controllerBeanName" />
				<a href="${controllerBeanName}">Controller Bean Name Url Handler Mapping  --   ${controllerBeanName}</a><br />   	
				<c:url value="/controllerclassnamehandlermapping.html"
				var="controllerClassNameMapping" />
				<a href="${controllerClassNameMapping}">Controller Class Name HandlerMapping --   ${controllerClassNameMapping}</a><br />	
				<c:url value="/controllerWithXMLConfig.html"
				var="controllerWithXMLConfig" />
				<a href="${controllerWithXMLConfig}">Controller With XML Config --   ${controllerWithXMLConfig}</a><br />   
				<c:url value="/callMethod" var="callMethod" />
				<a href="${callMethod}">Sample Controller which will send  ${callMethod}</a><br /> 
				<br /> 		         
 				<a href="javascript:history.back()">Back</a>
		</div>		
	</jsp:body>
</page:template>
