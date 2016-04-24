
## WebDesignProject

Final project for WebDesignCourse

The goal of project was to implement a simple torrent file directory server. 

The server will store .libr files and users should be able:
    
- to browse library files available
- download library files on to their local machine
- upload new library files through a form page

In addition, during the project additional features of the various technologies uses were explored. 

#### Technologies Used 

The technologies that were used include the following:
* [Spring MVC Framework]
* [HTML 5] - (including trying out new features of HTML 5)
* [CSS] - Cascading Style Sheets
* [Twitter Bootstrap] - great UI boilerplate for modern web apps
* [AngularJS] - HTML enhanced for web apps!
* [Bower] - Bower is a “package manager for the web.” Bower lets you install and restore client-side packages, including JavaScript and CSS libraries
* [Angular Smart Table] - Smart table is an Angularjs module to easily display data in a table with a set of built in features such filtering,sorting, etc 
* [jQuery] 

#### Persistance Layer
 Originally project was built using MySQL, but switched over to HSQLDB integrated Database for portability

#### Login Information
The login is NOT required to use the website, it was implemented to become familiar with the basics of Spring security

| Username              	| Password 	| Role            	|
|-----------------------	|----------	|-----------------	|
| user                  	| 12345    	| ROLE_USER       	|
| admin@outlook.com     	| 12345    	| ROLE_ADMIN      	|
| superuser@outlook.com 	| 12345    	| ROLE_SUPER_USER 	|
| test1@outlook.com     	| 12345    	| ROLE_USER       	|

 
#### Version
0.1

####Deployment
A clean and install build will generate the WAR file. This file can be deployed in Tomcat using automatic war file extact.

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

   [node.js]: <http://nodejs.org>
   [Twitter Bootstrap]: <http://twitter.github.com/bootstrap/>
   [jQuery]: <http://jquery.com>
   [express]: <http://expressjs.com>
   [AngularJS]: <http://angularjs.org>
   [Gulp]: <http://gulpjs.com>
   [Angular Smart Table]: <https://lorenzofox3.github.io/smart-table-website/>
   [Bower]: <https://bower.io>
   [Spring MVC Framework]: <https://spring.io>
   [HTML 5]: <http://www.html5rocks.com/en/>
   [CSS]: <https://www.w3.org/Style/CSS/>
