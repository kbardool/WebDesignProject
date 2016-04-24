package spring.mvc.event;

import java.time.LocalTime;

import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.ServletRequestHandledEvent;

@Component
public class ApplicationEventListener implements ApplicationListener<ServletRequestHandledEvent> {

	@Override
	public void onApplicationEvent(ServletRequestHandledEvent event) {		
		 
		//System.out.println("\n===> "+ LocalTime.now() + " ApplicationEventListener: " + event);
		//logging can be done here
	
		System.out.println("\n===> Applicationevent ServletRequest Handled in " + event.getProcessingTimeMillis()+ " milliseconds");
		System.out.println("      getRequestURL is: " + event.getRequestUrl());		
	}

}
