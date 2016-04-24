<!DOCTYPE html>
<%@tag description="Template Site Tag" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@attribute name="title" fragment="true" %>

<html lang="en">
  <head>

    <title><jsp:invoke fragment="title"/></title>

	<spring:url value="/resources/css/bootstrap.min.css" 		var="bootstrap" />
	<spring:url value="/resources/css/starter-template.css" var="startertemplate" />

	<link href="${bootstrap}" 			rel="stylesheet" />
	<link href="${startertemplate}" 	rel="stylesheet"/>
    <link href='<c:url value="/resources/images/favicon.ico" />' rel="shortcut icon" type="image/x-icon">
	<spring:url value="/resources/js/jquery-2.1.4.min.js" var="jqueryjs" />
	<script src="${jqueryjs}" type="text/javascript"></script>

	<spring:url value="/resources/js/bootstrap.min.js" var="js" />
	<script src="${js}"></script>

  </head>
  
  

  <body>

	    <nav class="navbar navbar-inverse navbar-fixed-top">
	      <div class="container">
	        <div class="navbar-header">
	          <b><a class="navbar-brand" href="${pageContext.request.contextPath}">P2P Fileshare Server</a></b>
	        </div>

	     	<div id="navbar" class="navbar-collapse collapse ">
	          <ul class="nav navbar-nav ">
	             <li><a href="${pageContext.request.contextPath}">Home</a></li>

	             <li class="dropdown">

	                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Services<span class="caret"></span></a>

	                <ul class="dropdown-menu">

					<c:url value="/addlibrary.html" var="addlibrary" />
					<li><a href="${addlibrary}"><b>Addition of New Library File</b></a></li> 
     
   					<c:url value="/viewlibraries.html" var="viewlibraries" />
					<li><a href="${viewlibraries}"><b>View Libraries</b></a></li>
					             
	              </ul>
	            </li>

	             <li class="dropdown">

	                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Learning<span class="caret"></span></a>

	                <ul class="dropdown-menu">
					 
	                <c:url value="/rest.html" var="rest" />
	                <li><a href="${rest}"><b>REST Webservices (JSON XML)</b></a></li>

	                <c:url value="/jdbc.html" var="jdbc" />
	                <li><a href="${jdbc}"><b>JDBC with JdbcTemplates</b></a></li>
	                
	                <c:url value="/jstl.html" var="jstl" />
	                <li><a href="${jstl}"><b>JSTL (Java Standard Tag Library) examples</b></a></li>

					<c:url value="/file.html" var="file" />
	                <li><a href="${file}"><b>File Upload Excel and PDF examples</b></a></li>

	                <c:url value="/controller.html" var="controller" />
	                <li><a href="${controller}"><b>Controller Mapping Example</b></a></li>

	                <c:url value="/registerForm" var="registerForm" />
	            	<li><a href="${registerForm}"><b>Spring MVC Form Handling and tags</b></a></li>

	                <c:url value="/cookieView.html" var="cookieView" />
	                <li><a href="${cookieView}"><b>Cookie and Session Scope examples</b></a></li>

	            	<c:url value="/html5.html" var="html5" />
	                <li><a href="${html5}"><b>HTML5</b></a></li>

					<c:url value="/angularjs.html" var="angularjs" />
	                <li><a href="${angularjs}"><b>AngularJS Examples</b></a></li>
	                
   	                <c:url value="/register.html" var="register" />
	                <li><a href="${loginURL}">Form Input</a></li>

					<c:url value="/redirectExample.html" var="redirect" />
	                <li><a href="${redirect}"><b>Course website</b></a></li>	                
	              </ul>
	            </li>
	            
	            <c:url value="/login.html" var="loginURL" />
	            <li><a href="${loginURL}">Login</a></li>

	            <c:url value="/about.html" var="about" />
	            <li><a href="${about}">About</a></li>

	          </ul>
	  
	          <security:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUPER_USER','ROLE_USER')">
				<span style="color: #568C00;font-size: 12px" ><b>You are logged in as: </b><security:authentication property="principal.username"/><br/><security:authentication property="principal.authorities"/></span>
				<b><a style="color: #568C00!important;text-decoration: underline;" href="<c:url value="/j_spring_security_logout"/>">Logout</a></b>
			  </security:authorize>
	        </div>
	      </div>
	    </nav>

		<div class="jumbotron text-center">
		    <div class="container">
		      <div class="row">
		        <div class="col col-lg-12 col-sm-12">
		          <h2><B>Peer2Peer File Sharing Server</B></h2>
		          <p>Built using Spring, AngularJS and HTML5</p>
		        </div>
		      </div>
		    </div>
		</div>

		<div class="container">
			<div class="starter-template">
				<jsp:doBody/>
			</div>
 	    </div>

  	 <footer class="footer">
      	<div class="container">
      	    <br>
 			<font color="green"><b>MLDM Web Design Project - K Bardool, A Alazizi - 2016</b></font>
        </div>
    </footer>

  </body>
</html>
