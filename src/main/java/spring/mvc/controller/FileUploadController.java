 
package spring.mvc.controller;

/**
 * @author kevin.bardool
 *
 */
 

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class FileUploadController {

	@RequestMapping(method = RequestMethod.GET, value = "/fileUpload")
	public String provideUploadInfo(Model model) {
        String rootPath = System.getProperty("catalina.home");
		File rootFolder = new File(rootPath);
		System.out.println("\n ======> provide UploadInfo");
		List<String> fileNames = Arrays.stream(rootFolder.listFiles())
			.map(f -> f.getName())
			.collect(Collectors.toList());

		model.addAttribute("files",
			Arrays.stream(rootFolder.listFiles())
					.sorted(Comparator.comparingLong(f -> -1 * f.lastModified()))
					.map(f -> f.getName())
					.collect(Collectors.toList())
		);

		return "uploadForm";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/fileUpload")
	public String handleFileUpload(@RequestParam("name") String name,
								   @RequestParam("file") MultipartFile file,
								   RedirectAttributes redirectAttributes) {
		
		System.out.println("\n ======> handle File Upload (/fileUpload)");
		
		if (name.contains("/")) {
			redirectAttributes.addFlashAttribute("message", "Folder separators not allowed");
			return "redirect:upload";
		}
		if (name.contains("/")) {
			redirectAttributes.addFlashAttribute("message", "Relative pathnames not allowed");
			return "redirect:upload";
		}

		if (!file.isEmpty()) {
			try {
                String rootPath = System.getProperty("catalina.home");
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(new File(rootPath + "/" + name)));
                FileCopyUtils.copy(file.getInputStream(), stream);
				stream.close();
				redirectAttributes.addFlashAttribute("message",
						"You successfully uploaded " + name + "!");
			}
			catch (Exception e) {
				redirectAttributes.addFlashAttribute("message",
						"You failed to upload " + name + " => " + e.getMessage());
			}
		}
		else {
			redirectAttributes.addFlashAttribute("message",
					"You failed to upload " + name + " because the file was empty");
		}

		return "redirect:upload";
	}
	
	

	/*---------------------------------------------------------------------
	 *  handle File Upload ()
	 --------------------------------------------------------------------- */
 	@RequestMapping(value="/uploadFile", method=RequestMethod.POST)
    public @ResponseBody String handleFileUpload(@RequestParam("file") MultipartFile file){
 		
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
 	


}