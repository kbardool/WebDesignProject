package spring.javaconfig;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.web.WebApplicationInitializer;

public class WebInitializer implements WebApplicationInitializer {

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		System.out.println("**** WebInitializer onStatup() method is called");	
		
		
	/*	AnnotationConfigWebApplicationContext context = new AnnotationConfigWebApplicationContext();  
		context.register(JavaConfig.class);  		
		context.setServletContext(servletContext); 
		Dynamic servlet = servletContext.addServlet("DispatcherServlet", new DispatcherServlet(context));
		servlet.addMapping("/");
		servlet.setLoadOnStartup(1);*/

		
	}
	
	

}
