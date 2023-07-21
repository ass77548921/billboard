package billboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import billboard.service.listService;

@Controller
public class HelloController {
	
	@Autowired
	private listService service;
	
	@RequestMapping("hello")
	public ModelAndView hello() {
		
		
		
		System.out.println(service.findAll());
		ModelAndView model = new ModelAndView();
		model.setViewName("hello");
		model.addObject("aass",service.findAll());
		
		
		return model;
	}

}
