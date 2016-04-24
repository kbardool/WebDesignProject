package spring.mvc.controller;

import java.time.LocalTime;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ScopeController {
	
	
	@RequestMapping(value = "/scopeSession", method=RequestMethod.GET)
	 public ModelAndView scope(HttpSession session) {		
	
		System.out.println("**** ScopeController scope is called");
		session.setAttribute("sessionObject", "Value in session object");
		session.setAttribute("currentTime", LocalTime.now().toString());
		//session.setMaxInactiveInterval(15); seconds
//		 return "/cookie/cookieView";
		return new ModelAndView("/alljsps/cookieView");		 
	}

	@RequestMapping(value = "/invalidate", method=RequestMethod.GET)
	 public ModelAndView invalidate(HttpSession session) {
		
		session.invalidate();
//		session.setAttribute("currentTime", LocalTime.now().toString());
		
		System.out.println("**** ScopeController invalidate is called");
		return new ModelAndView("/alljsps/cookieView");
//		 return "/cookie/cookieView";
	}
	
	
}
