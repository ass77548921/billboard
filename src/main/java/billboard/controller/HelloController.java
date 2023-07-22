package billboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import billboard.model.list;
import billboard.service.listService;

@Controller
public class HelloController {
	
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
	
	@DeleteMapping("/deleteById")
	public ResponseEntity<?> deleteById(@RequestBody list data) {
		service.deleteById(data);
		return ResponseEntity.ok(true);
	}

}
