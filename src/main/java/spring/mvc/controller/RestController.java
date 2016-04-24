package spring.mvc.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import spring.mvc.bean.DBLog;
import spring.mvc.bean.DBLogJSON;
import spring.mvc.bean.DBLogs;
import spring.mvc.bean.DBLogsJSON;
import spring.mvc.bean.Library;
import spring.mvc.bean.UserJSON;
import spring.mvc.service.RestService;

/**
 * @author kevin.bardool
 *
 */
@Controller
public class RestController {

	@Autowired
	private RestService restService;
	
	@Autowired
    private RestTemplate restTemplate;	 
    
	/**
	 * DBLogs getAllDBLogsXML()
	 *
	 */
	@RequestMapping(value = "/getAllDBLogsXML", method = RequestMethod.GET, produces="application/xml")
	public @ResponseBody DBLogs getAllDBLogsXML() {

		List<DBLog> dbLogList = null;
		try {
			dbLogList = restService.queryAllDBLogs();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		DBLogs dbLogs = new DBLogs();
		dbLogs.setLogList(dbLogList);
		System.out.println("\n @@@@ RestController getAllDBLogsXML returns dbLogs: "+ dbLogList);
		return dbLogs;
	}
	
	 
	/**
	 * DBLogsJSON getAllDBLogsJSON()
	 *
	 */	
	@RequestMapping(value = "/getAllDBLogsJSON", method = RequestMethod.GET)
	public @ResponseBody DBLogsJSON getAllDBLogsJSON() {

		List<DBLogJSON> dbLogsJSONList = null;
		try {
			dbLogsJSONList = restService.queryAllDBLogsJSON();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(dbLogsJSONList);
		DBLogsJSON dbLogsJSON = new DBLogsJSON();
		dbLogsJSON.setLogList(dbLogsJSONList);
		
		System.out.println("\n @@@@ RestController getAllDBLogsJSON returns dbLogsJSON: ");
		return dbLogsJSON;
	}

	  //Getting JSON examples from  http://jsonplaceholder.typicode.com/ 
	  // Whcih is a  free JSON service
	  @RequestMapping(value = "/posts", method = RequestMethod.GET)
	  public @ResponseBody List<UserJSON> getPosts() {
		  
		  System.out.println("\n Entered getPosts() ");
		  //JSON http://jsonplaceholder.typicode.com/posts
		  ResponseEntity<UserJSON[]> response = restTemplate.getForEntity(
			        "http://jsonplaceholder.typicode.com/posts",
			        UserJSON[].class);

		  System.out.println("\n @@@@ RestController getPosts return response: " + response);
		  return Arrays.asList(response.getBody());
	  }
	  	
		
		/**
		 * DBLogsJSON getLibraries()
		 *
		 */	

		@RequestMapping(value = "/getLibrariesJSON", method = RequestMethod.GET)
		public @ResponseBody List<Library> getLibraries() {
			System.out.println("\n GetLibraries () ");
			List<Library> libraryJSONList = null;
			try {
				libraryJSONList = restService.queryAllLibrariesJSON();
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println(libraryJSONList);
/*			DBLogsJSON dbLogsJSON = new DBLogsJSON();
			dbLogsJSON.setLogList(dbLogsJSONList);*/

			System.out.println("\n @@@@ RestController getLibraries returns libraryJSONList: ");
			return libraryJSONList;
		}
	  
	  
	  //Getting JSON examples from  http://jsonplaceholder.typicode.com/ 
	  // Whcih is a  free JSON service
	  @RequestMapping(value = "/posts/{postId}", method = RequestMethod.GET)
	  public @ResponseBody UserJSON getPostByID(@PathVariable(value="postId") String postId) {

		  //JSON http://jsonplaceholder.typicode.com/posts/postId
		  ResponseEntity<UserJSON> response = restTemplate.getForEntity(
			        "http://jsonplaceholder.typicode.com/posts/{postId}",
			        UserJSON.class,postId);

		  System.out.println("\n @@@@ RestController getPostByID return response: " + response);
		  return response.getBody();
	  }
	  
	  
	  //JSON Deletes a post
	  @RequestMapping(value = "/posts/{postId}", method = RequestMethod.DELETE)
	  @ResponseStatus(value = HttpStatus.OK)
	  public @ResponseBody void deletePostByID(@PathVariable(value="postId") String postId) {
		  System.out.println("\n @@@@ RestController  deletePostByID is called");

	  }

	  
	  //JSON SAVES a post
	  @RequestMapping(value = "/savePost", method = RequestMethod.POST)
	  @ResponseStatus(value = HttpStatus.OK)
	  public @ResponseBody void savePost(@RequestBody UserJSON userJSON) {

		  System.out.println("savePost postJSON.getUserId(): " + userJSON.getUserId());
		  System.out.println("savePost postJSON.getTitle():  " + userJSON.getTitle());
		  System.out.println("savePost postJSON.getId(): 	 " 	+ userJSON.getId());
		  System.out.println("savePost postJSON.getBody():   " + userJSON.getBody());
		  
		  System.out.println("\n @@@@ RestController savePost is called /n");		
	  }
	  
		/*---------------------------------------------------------------------
		 *  handle File Upload ()
		 --------------------------------------------------------------------- */
	 	@RequestMapping(value="/saveLibraryJSON", method=RequestMethod.POST)
	    public @ResponseBody String saveLibraryJSON(@RequestParam("file") MultipartFile file){
	    //(@RequestParam("data") String data,	@RequestParam("file") MultipartFile file){
	 	
			System.out.println("\n ======> handle File Upload (/uploadFile)");
			
 	        if (!file.isEmpty()) {
	        	
	            try {
	            	
	                byte[] fileBytes = file.getBytes();	                
	                String rootPath = System.getProperty("catalina.home");
	                System.out.println("     Server rootPath: " + rootPath);
	                System.out.println("     File original name: " + file.getOriginalFilename());
	                System.out.println("     File content type: " + file.getContentType());
	 		
	                File newFile = new File(rootPath + File.separator + file.getOriginalFilename());
	                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(newFile));
	                stream.write(fileBytes);
	                stream.close();
	                
	                System.out.println("     File is saved under: " + rootPath + File.separator + file.getOriginalFilename());	                
	                return "File is saved under: " + rootPath + File.separator + file.getOriginalFilename();
	                
	            } catch (Exception e) {
	            	e.printStackTrace();
	                return "File upload is failed: " + e.getMessage();
	            }
	        } else {
	            return "File upload is failed: File is empty";
	        }
	    }	  
	  
	 	
	 	
	  @RequestMapping(value = "/responseStatusError", method = RequestMethod.GET)	 
	  public String responseStatusError() throws Exception {		  
		  //responseStatusError
		  System.out.println("@RestController responseStatusError");
		  throw new Exception("@RestController responseStatusError exception");		
	  }
	  
	 
/*	  @ExceptionHandler
	  @ResponseStatus(value = HttpStatus.FORBIDDEN,reason="FORBIDDEN ACCESS (PROVIDE YOUR CUSTOM REASON HERE)")
	  public void handleException(Exception ex) {
		    System.out.println("\n @@@@ RestTemplateControllerExample handleException");
		  	System.out.println(ex);
	  }*/
	  



}
