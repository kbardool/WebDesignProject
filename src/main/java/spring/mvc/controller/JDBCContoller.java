package spring.mvc.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.bean.DBLog;
import spring.mvc.bean.Library;
import spring.mvc.bean.User;
import spring.mvc.service.JDBCService;

@Controller
public class JDBCContoller {
	
	@Autowired
	private JDBCService jdbcService;
	
	
	@RequestMapping(value = "/jdbcSelectAllLibraries", method=RequestMethod.GET)
    public ModelAndView jdbcSelectAllLibraries() {		
		System.out.println("**** JDBCContoller jdbcSelectAllLibraries is called");
		List<Library> libraries = jdbcService.queryAllLibraries();
		return new ModelAndView("/alljsps/jdbc", "libraries", libraries);
 
    }

	@RequestMapping(value = "/jdbcInsert/logstring/{logstring}", method=RequestMethod.GET)
    public ModelAndView jdbcInsert(@PathVariable(value="logstring") String logstring) {		
		System.out.println("JDBCContoller jdbcInsert is called");
		DBLog dblog = new DBLog();
		dblog.setLOGSTRING(logstring);
		boolean result = jdbcService.insertLog(dblog);		
		return new ModelAndView("/alljsps/jdbc", "result", result);
    }
	
	@RequestMapping(value = "/jdbcSelectLogs", method=RequestMethod.GET)
    public ModelAndView jdbcSelect() {				
		System.out.println("JDBCContoller jdbcSelect is called");
		List<DBLog> dbLogs =  jdbcService.queryAllLogs();
        return new ModelAndView("/alljsps/jdbc", "dbLogs", dbLogs);
 
    }

	@RequestMapping(value = "/jdbcDelete/user/{iduser}", method=RequestMethod.GET)
    public ModelAndView jdbcDelete( @PathVariable(value="iduser") int iduser) {		
		System.out.println("JDBCContoller jdbcDelete is called");
		boolean result = jdbcService.deleteUSER(iduser);
		return new ModelAndView("/alljsps/jdbc", "result", result);
 
    }
	
	@RequestMapping(value = "/jdbcUpdate/user/username/{username}/enabled/{enabled}", method=RequestMethod.GET)
    public ModelAndView jdbcUpdate(@PathVariable(value="username") String username, @PathVariable(value="enabled") boolean enabled) {		
		System.out.println("JDBCContoller jdbcUpdate is called");
		User user = new User();
		user.setUsername(username);
		boolean result = jdbcService.updateUserEnable(user, enabled);
		return new ModelAndView("/alljsps/jdbc", "result", result);
 
    }
	
	@RequestMapping(value = "/jdbcSelectAllUsers", method=RequestMethod.GET)
    public ModelAndView jdbcSelectAllUsers() {		
		System.out.println("JDBCContoller jdbcSelectAllUsers is called");
		List<User> users = jdbcService.queryAllUsers();
		return new ModelAndView("/alljsps/jdbc", "users", users);
 
    }
	

}
