<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<title>About</title>

<!-- <link href="starter-template.css" rel="stylesheet"> -->
<%-- <spring:url value="/resources/css/bootstrap.css" var="bootstrap" /> --%>
<%-- <spring:url value="/resources/css/starter-template.css"	var="startertemplate" /> --%>
<%-- <link href="${bootstrap}" rel="stylesheet" /> --%>
<%-- <link href="${startertemplate}" rel="stylesheet" /> --%>



<spring:url value="/resources/css/bootstrap.css" var="bootstrap" />
<spring:url value="/resources/css/starter-template.css"
	var="startertemplate" />

<link href="${bootstrap}" rel="stylesheet" />
<link href="${startertemplate}" rel="stylesheet" />

<spring:url value="/resources/js/jquery-2.1.4.min.js" var="jqueryjs" />
<script src="${jqueryjs}" type="text/javascript"></script>

<spring:url value="/resources/js/bootstrap.min.js" var="js" />
<script src="${js}"></script>

</head>
</head>


<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<b><a class="navbar-brand"
						href="${pageContext.request.contextPath}">P2P Fileshare Server</a></b>
				</div>

				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="${pageContext.request.contextPath}">Home</a></li>

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Categories<span class="caret"></span></a>

							<ul class="dropdown-menu">

								<c:url value="/rest.html" var="rest" />
								<li><a href="${rest}"><b>REST Webservices (JSON
											XML)</b></a></li>

								<c:url value="/jdbc.html" var="jdbc" />
								<li><a href="${jdbc}"><b>JDBC with JdbcTemplates</b></a></li>


								<c:url value="/jstl.html" var="jstl" />
								<li><a href="${jstl}"><b>JSTL (Java Standard Tag
											Library) examples</b></a></li>

								<c:url value="/file.html" var="file" />
								<li><a href="${file}"><b>File Upload Excel and PDF
											examples</b></a></li>

								<c:url value="/controller.html" var="controller" />
								<li><a href="${controller}"><b>Controller Mapping
											Example</b></a></li>

								<c:url value="/registerForm" var="registerForm" />
								<li><a href="${registerForm}"><b>Spring MVC Form
											Handling and tags</b></a></li>

								<c:url value="/cookieView.html" var="cookieView" />
								<li><a href="${cookieView}"><b>Cookie and Session
											Scope examples</b></a></li>

								<c:url value="/throwRunTimeException.html"
									var="throwRunTimeException" />
								<li><a href="${throwRunTimeException}"><b>Exception
											Handler</b></a></li>


								<c:url value="/html5.html" var="html5" />
								<li><a href="${html5}"><b>HTML5</b></a></li>

								<c:url value="/angularjs.html" var="angularjs" />
								<li><a href="${angularjs}"><b>AngularJS by Google</b></a></li>


								<c:url value="/redirectExample.html" var="redirect" />
								<li><a href="${redirect}"><b>Course website</b></a></li>
							</ul></li>

						<c:url value="/login.html" var="loginURL" />
						<li><a href="${loginURL}">Login</a></li>

						<c:url value="/about.html" var="about" />
						<li><a href="${about}">About</a></li>

					</ul>

					<security:authorize
						access="hasAnyRole('ROLE_ADMIN','ROLE_SUPER_USER','ROLE_USER')">
						<span style="color: #568C00; font-size: 12px"><b>You
								are logged in as: </b>
						<security:authentication property="principal.username" /><br />
						<security:authentication property="principal.authorities" /></span>
						<b><a
							style="color: #568C00 !important; text-decoration: underline;"
							href="<c:url value="/j_spring_security_logout"/>">Logout</a></b>
					</security:authorize>
				</div>
			</div>
		</nav>
	</nav>

	<div class="container">

		<div class="starter-template">
			<h3>
				<b>About the course, and this project</b>
			</h3>
			<br />
			<p class="lead">
				<b>Parent course: <a
					href="https://dossier.univ-st-etienne.fr/er49873h/public/2015-pwa/index.html"
					target="_blank"> <font color="blue">Design of Web
							Applications</font></a>
				</b>
			</p>


			<br /> <a
				href="https://dossier.univ-st-etienne.fr/er49873h/public/2015-pwa/index.html"
				target="_blank"><img width="400" alt="ss" align="middle"
				src="<%=request.getContextPath()%>/resources/images/web-design.png"></a>
			<br /> <br />
			<h3>
				Instructor: <a href="http://home.heeere.com/index.html">Remi
					Emonet</a>
			</h3>
			<br /> <br /> <em><h4>Course Description:</h4></em> <br /> This
			course was presented during the first semester of the Machine
			Leanring and Data Mining (MLDM) program at University Jean Monnet,
			Fall 2015 Cohort. The course covered multiple aspects of web
			application design and programming.<br /> <br /> <em><h4>Course
					Outline:</h4></em> <br />
			<ul>
				<li><strong>HTML and CSS</strong></li>
				<li><strong>HTTP and Servlets</strong></li>
				<li><strong>Spring MVC, </strong><strong>Dependency
						Injection, and IOC (Inversion of Control)</strong></li>
				<li><strong>Aspect Oriented Programming</strong></li>
				<li><strong>Git</strong></li>
				<li><strong>JPA, Spring Data, </strong> and a brief overview of
					<strong>Hibernate</strong></li>
				<li><strong>JavaScript</strong></li>
				<li><strong>REST</strong></li>
				<li><strong>Library Management with Maven</strong></li>
				<li><strong>AngularJS and Rest</strong></li>
				<li><strong>Security Management</strong></li>
			</ul>

			<br /> <em><h4>Here are some of the topics we worked on
					during practical sessions and project implementation</h4></em> <br />
			<ul>
				<li>Basic <strong>HTML </strong> and <strong>CSS</strong>
					coding
				</li>
				<li>Installing <strong>Spring Tool Suite and Java JDK
						8.0</strong></li>
				<li>Learning how to use<strong> Maven </strong> and pom xml
					editing for library management
				</li>
				<li>How to <strong>debug, test and run</strong> Spring
					Framework applications
				</li>
				<li>Using <strong>Spring Framework's Container</strong></li>
				<li>Using <strong>constructor and setter injection </strong>works
				</li>
				<li>Learn Spring Framework's Container, Dependency Injection
					and IOC (Inversion of Control) concepts</li>
				<li>Understand how to code and configure Spring Framework with
					XML or Java Config</li>
				<li>Understand how to use AOP (Aspect Oriented Programming)
					wtih Spring Framework</li>
				<li>Understand Spring JDBC and Hibernate ORM integration</li>
				<li>Learn how to use Spring MVC module in Web Applications</li>
				<li>Code Spring Framework based Web applications</li>
				<li>Code REST based web applications using Spring Framework</li>
				<li>Use @Annotations in Spring Framework applicatons</li>
				<li>Learn how to use Maven for library management</li>
				<li>Understand the structure of Spring Web applications</li>
				<li>Learn how to configure Embedded Database source for Spring
					applications</li>
				<li>Understand the usage of <strong>&lt;context:component-scan/&gt;
				</strong>tag in <strong>application-context xml</strong> file
				</li>
				<li>How to define <strong>scopes for beans </strong>in XML
					configuration and annotation configuration
				</li>
				<li>Using <strong>@Bean </strong>annotation with <strong>@Scope</strong>annotation
				</li>
				<li>How to use <strong>@Autowired </strong>and <strong>@Qualifier</strong>annotations
				</li>
				<li>Using <strong>&lt;bean/&gt;</strong> tag in XML
					configuration
				</li>
				<li>How to use <strong>&lt;context-annotation-config&gt;</strong>
					tag in XML configuration
				</li>
				<li>How to use <strong>ClassPathXmlApplicationContext,
						FileSystemXmlApplicationContext, XmlWebApplicationContext and
						AnnotationConfigApplicationContext</strong></li>
				<li>How to use <strong>@ContextConfiguration</strong></li>
				<li>Understand the usage of <strong>@Value</strong> annotation
				</li>
				<li>How to use <strong>&lt;context:property-placeholder/&gt;</strong></li>
				<li>How to configure <strong>PropertySourcesPlaceholderConfigurer</strong>
					in JavaConfig
				</li>
				<li>Implementing <strong>FactoryBean interfaces</strong> in
					Spring Framework
				</li>
				<li>How to use <strong>@Configuration </strong>annotation in
					Spring Framework
				</li>
				<li>How to define <strong>AnnotationConfigApplicationContext</strong></li>
				<li>How to use <strong>AbstractJUnit4SpringContextTests</strong></li>
				<li>See how to use <strong>&lt;util:properties/&gt; </strong>in
					XML configuration files
				</li>
				<li>How to get beans from application-context xml with <strong>getBean()
				</strong>method
				</li>
				<li>How to close Application Context with <strong>ConfigurableApplicationContext</strong></li>
				<li>How to use <strong>@PropertySource </strong>annotation
				</li>
				<li>Understand the usage of <strong>Aspect Oriented
						Programming (AOP)</strong></li>
				<li>Learn <strong>cross cutting concerns </strong>in
					programming
				</li>

				<li>Understand how to use J<strong>DBCTemplate</strong> when
					accessing databases
				</li>
				<li>Learn how to define <strong>&lt;jdbc:embedded-database/&gt;</strong>
					and <strong>&lt;jdbc:script/&gt;</strong></li>
				<li>Learn the usages of <strong>RowMapper,
						RowCallbackHandler and ResultSetExtractor</strong></li>
				<li>Learn how to define <strong>DataSourceTransactionManager</strong></li>
				<li>How to use <strong>@Transactional</strong> annotation
				</li>
				<li>Understand how to use <strong>TransactionTemplate</strong></li>
				<li>Learn how to configure <strong>entityManagerFactory
				</strong>with <strong>Hibernate </strong>in Spring Framework
				</li>
				<li>Understand what is <strong>MVC (Model View
						Controller)</strong></li>
				<li>How to use <strong>DispatcherServlet</strong></li>
				<li>Understand how to edit <strong>web xml </strong>file for
					configurations
				</li>
				<li>Understand the usage of <strong>@Controller </strong>and <strong>@RequestMapping
				</strong>annotations
				</li>
				<li>How to configure <strong>SimpleUrlHandlerMapping </strong>using
					XML configuration
				</li>
				<li>How to define <strong>&lt;contextConfigLocation/&gt;</strong>tag
					in web xml
				</li>

				<li>Understand the usage of <strong>ModelAndView</strong></li>
				<li>How to define<strong> InternalResourceViewResolver
				</strong>in configuration files
				</li>

				<li>Understand how to configure <strong>&lt;form-login/&gt;</strong>
					in Spring Secuirty
				</li>

				<li>How to develop <strong>REST </strong>web services with
					Spring Framework
				</li>
				<li>How to use <strong>&lt;mvc:annotation-driven /&gt;
						and @EnableWebMvc</strong></li>
				<li>How to use <strong>RequestMethod </strong>types in Spring
					Framework
				</li>
				<li>How to use <strong>@ReponseBody, @RestController,
						@ExceptionHandler and @ResponseStatus</strong>annotations
				</li>
				<li>How to use <strong>RestTemplate</strong> in Spring
					Framework
				</li>
			</ul>

			<br /> <em>
				<h4>What was our outtake from this course?</h4>
			</em> <br>
			<ul>
				<li>We gained a high level overview of the different aspects of
					design and implementation of web applications, and the basics of
					the necessary skills required for a Web application programmer.
				</li>
				<li>Spring alone is an extremely powerful and complex framework
					AngularJS has become one of the most popular frameworks in desiging
					MVW single-page applications
				</li>
			</ul>

		</div>
	</div>
</body>
</html>
