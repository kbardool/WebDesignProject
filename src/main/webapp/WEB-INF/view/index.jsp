<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>

<page:template>
	<jsp:attribute name="title">
     	Peer2Peer Server Homepage
    </jsp:attribute>
    
    <jsp:body>		
        <c:url value="/about.html" var="about" />		
		<figure style="text-align: center">
        	<img style="border-radius: 15px;" width="450" src="${pageContext.request.contextPath}/resources/images/file-sharing1.jpg">    			
    		<figcaption><br/><b><a href="${about}">About</a></b></figcaption>
     	</figure>	
	</jsp:body>
		
</page:template>   		