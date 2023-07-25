package billboard.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import billboard.model.list;
import billboard.service.listService;



@Controller
public class billboardController {
	
	@Autowired
	private listService service;
	
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping("/home")
	public ModelAndView home() {
		
		
		
		ModelAndView model = new ModelAndView();
		model.setViewName("hello");
		model.addObject("aass",service.findAll());
		
		
		return model;
	}
	
	@PostMapping("/getDetail")
	public ResponseEntity<?> detail(@RequestBody list data) {
		
		return ResponseEntity.ok(service.findById(data.getId()));
	}

	
	@GetMapping("/detail")
	public ModelAndView detail(@RequestParam(value = "id") Integer id) {
		
		ModelAndView model = new ModelAndView();
		model.addObject("Label", "detail");
		list data=service.findById(id);
		model.addObject("data", data);
		model.setViewName("detail");
		
		
		return model;
	}
	
	
	
	
	
	@GetMapping("/reviseData")
	public ModelAndView reviseDataPage(@RequestParam(value = "id") Integer id) {
		
		ModelAndView model = new ModelAndView();
		model.addObject("Label", "revise");
		list data=service.findById(id);
		model.addObject("data", data);
		model.setViewName("detail");
		
		
		return model;
	}
	
	@PostMapping("/reviseDataUpdate")
	public String reviseDataUpdate(@ModelAttribute("billboard") list data,@RequestParam(value="file") MultipartFile file) throws IOException {
		list data2=service.findById(data.getId());
		if(file.isEmpty()) {
			data.setUrl(data2.getUrl());
		}
		else {
			String filePath = generateFilePath(file.getOriginalFilename());
	        
	        Files.write(Paths.get(filePath),file.getBytes());
	        data.setUrl(file.getOriginalFilename());
		}
		service.updateData(data);
		
		return "redirect:/home";
		
	}
	
	
	
	@GetMapping("/addData")
	public ModelAndView addDataPage() {
		
		ModelAndView model = new ModelAndView();
		model.addObject("Label", "add");
		list data=new list();
		model.addObject("data", data);
		model.setViewName("detail");
		
		
		return model;
	}
	
	
	
	@PostMapping("/addDataSave")
	public String getNewData(@ModelAttribute("billboard") list data,@RequestParam(value="file") MultipartFile file) throws IOException {
		
		if(!file.isEmpty()) {
			String filePath = generateFilePath(file.getOriginalFilename());
	        
	        Files.write(Paths.get(filePath),file.getBytes());
			
	        data.setUrl(file.getOriginalFilename());
		}
		
		
		
		
        
		service.savaData(data);
		
		
		return "redirect:/home";
	}
	
	
	
	@DeleteMapping("/deleteSelect")
	public ResponseEntity<?> deleteById(@RequestBody Map<String, Object> data) {
		
		
		List<String>  idList = new ArrayList<String>((Collection<String>)data.get("id"));
		for(String id:idList) {
			service.deleteById(id);
		}
		return ResponseEntity.ok(true);
	}
	

	
	@DeleteMapping("/deleteById")
	public ResponseEntity<?> deleteById(@RequestBody list data) {
		service.deleteById(data);
		return ResponseEntity.ok(true);
	}
	
	
	@RequestMapping(value = "/uploadImage", method = RequestMethod.POST)
	@ResponseBody
    public String uploadImage(HttpServletRequest request) {
		try {
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            Iterator<String> fileNames = multipartRequest.getFileNames();
            if (fileNames.hasNext()) {
                MultipartFile file = multipartRequest.getFile(fileNames.next());
                String fileName = file.getOriginalFilename(); // 取得上傳的檔案名稱
                // 執行圖片上傳的處理（例如儲存到伺服器或資料庫）
                // 這裡只是一個範例，你需要根據你的需求進行實際處理
                String filePath = generateFilePath(fileName);
                
                Files.write(Paths.get(filePath),file.getBytes());
                return "{ \"url\":  .\"upload\"" + fileName + ", \"uploaded\": true }";
            }
        } catch (Exception e) {
        	 System.out.println(e);
        }
        return "{ \"error\": \"上傳失敗\" }";
    }
       
	  private String generateFilePath(String fileName) {
	        String uploadDir = servletContext.getRealPath("/upload/"); 
	        System.out.println(uploadDir);
	        return uploadDir + File.separator + fileName;
	    }
	

}
