package dev.department.subscribe.web;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import lombok.extern.slf4j.*;

@Slf4j
@Controller
public class CheckoutController {
	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public ModelAndView checkout() throws Exception {
		return new ModelAndView("/theme/checkout");
	}
}
