package dev.department.subscribe.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {
	
	@GetMapping("/error403")
	public String error403() {
		
		return "errorpage/error403";
	}
}
