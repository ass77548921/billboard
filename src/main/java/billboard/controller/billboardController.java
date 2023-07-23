package billboard.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import billboard.model.list;
import billboard.service.listService;

@Controller
public class billboardController {
	
	@Autowired
	private listService service;
	
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
	public String reviseDataUpdate(@ModelAttribute("billboard") list data) {
		
		service.updateData(data);
		
		return "redirect:/home";
		
	}
	
	
	
	@GetMapping("/addData")
	public ModelAndView addDataPage() {
		
		ModelAndView model = new ModelAndView();
		model.addObject("Label", "add");
		model.setViewName("detail");
		
		
		return model;
	}
	
	
	
	@PostMapping("/addDataSave")
	public String getNewData(@ModelAttribute("billboard") list data) {
		
		System.out.println("tes");
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

}
