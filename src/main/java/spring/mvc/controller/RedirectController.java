package spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RedirectController {
	
	 @RequestMapping(value="/redirectExample", method=RequestMethod.GET)
	  public String redirect() {
		 //redirect to external URL
		 System.out.println("**** REDIRECT CONTROLLER: redirect method is called");		 
		 return "redirect:https://dossier.univ-st-etienne.fr/er49873h/public/2015-pwa/index.html";
	 }

}
