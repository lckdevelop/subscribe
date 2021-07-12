package dev.department.subscribe.sec;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {
	
	@GetMapping("/error403")
	public String error403() {
		
		return "errorpage/error403";
	}
	
	@GetMapping("/error404")
	public String error404() {
		
		return "errorpage/error404";
	}
	
	@GetMapping("/error405")
	public String error405() {
		
		return "errorpage/error405";
	}
	
	@GetMapping("/error500")
	public String error500() {
		
		return "errorpage/error500";
	}
	
}
