<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="page" tagdir="/WEB-INF/tags" %>
<page:template>
	<jsp:attribute name="title">
     	REST Calls
    </jsp:attribute>
    <jsp:body>
	
	<c:url value="/posts" 				var="RestControllerPosts" />
	<c:url value="/posts/1" 			var="RestControllerPosts1" />
	<c:url value="/responseStatusError" var="RestControllerResponseStatusError" />
	<c:url value="/getAllDBLogsXML" 	var="RestControllerGetAllDBLogsXML" />
	<c:url value="/getAllDBLogsJSON" 	var="RestControllerGetAllDBLogsJSON" />
	<c:url value="/getLibrariesJSON" 	var="RestControllerGetLibrariesJSON" />	
	<h3><b>REST calls</b></h3>
	
	<security:authorize access="hasRole('ROLE_ADMIN')">
			<b>You are logged in as: </b><security:authentication property="principal.username"/> with the role of: <b><security:authentication property="principal.authorities"/></b><br/>
			<span style="color: #568C00;"><security:authentication property="principal.username"/></span>
			<a style="color: #568C00!important;" href="<c:url value="/j_spring_security_logout"/>">Logout</a>
		</security:authorize> 		
		<br/>

		<a href="${RestControllerGetLibrariesJSON}">@RestController --> /getLibraryJSON</a><br/>
		calling with the value : <b>${RestControllerGetLibrariesJSON}</b>
		<br/>
		<br/>
		<a href="${RestControllerPosts}">@RestTemplateController --> /posts</a><br/>
		calling with the value : <b>${RestControllerPosts}</b>
		<br/>
		<br/>
		<a href="${RestControllerPosts1}">@RestTemplateController --> /posts/1</a><br/>
		calling with the value : <b>${RestControllerPosts1}</b>
		<br/>
		<br/>
		<a href="${RestControllerResponseStatusError}">@RestTemplateController --> /ResponseStatusError</a><br/>
		calling with the value : <b>${RestControllerResponseStatusError}</b>
		<br/>
		<br/>
		<a href="${RestControllerGetAllDBLogsXML}">@RestController --> /getAllDBLogsXML</a><br/>
		calling with the value : <b>${RestControllerGetAllDBLogsXML}</b>
		<br/>
		<br/>
		<a href="${RestControllerGetAllDBLogsJSON}">@RestController --> /getAllDBLogsJSON</a><br/>
		calling with the value : <b>${RestControllerGetAllDBLogsJSON}</b>
		
		<br/>
		<br/>
		<a href="javascript:history.back()">Back</a>		
		<br/>
		<br/>
		<br/>
 
	</jsp:body>
	
</page:template>   		

