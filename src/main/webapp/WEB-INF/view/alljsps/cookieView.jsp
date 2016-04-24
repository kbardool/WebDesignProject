<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="page" tagdir="/WEB-INF/tags" %>
<page:template>
	<jsp:attribute name="title">
     	Cookie value get Example
    </jsp:attribute>
    <jsp:body>
		<div class="well">
		<c:url value="/writecookie" var="writeCookieController" />
		<h3><b>Spring MVC writeCookieController Example</b></h3>	
		<a href="${writeCookieController}">CookieControllerExample writecookie</a>
		<br/>
	
		<c:url value="/readcookie" var="readCookieController" />
		<h3><b>Spring MVC readCookieController Example</b></h3>	
		<a href="${readCookieController}">CookieControllerExample readcookie</a>
		<br/>
	
		<c:url value="/readAllCookies" var="readAllCookiesController" />
		<h3><b>Spring MVC readAllCookiesController Example</b></h3>	
		<a href="${readAllCookiesController}">CookieControllerExample readAllCookies</a>
		<br/><br/>
	
		CookieValue: <b> ${cookieValue} </b> <br/> <br/>
	
		<c:url value="/CookieView.html" var="scope" />
		<h3><b>Scope Examples</b></h3>
		<c:url value="/scopeSession" var="scopeSession" />
		<c:url value="/invalidate" var="invalidate" /> <br/> 
		<a href="${scopeSession}">Session Scope Call</a><br/>	
		<a href="${invalidate}">Session Invalidate Call</a><br/><br/>
		
		<b>SessionScope attribute: </b> ${sessionScope.sessionObject}<br/>
		<b>SessionScope Time : </b> ${sessionScope.currentTime}<br/>	
		</div>		
	</jsp:body>
</page:template>   		
