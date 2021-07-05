package dev.department.subscribe;

import java.io.*;
import java.text.*;
import java.util.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.core.io.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired private ResourceLoader resourceLoader;

	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws IOException 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws IOException {
		logger.info("Welcome home! The client locale is {}.", locale);

		//File file = new File(
		 //       getClass().getClassLoader().getResource("s3key.json").getFile()
	    //);
		//ObjectMapper mapper = new ObjectMapper();
		//Map<String, String> test = mapper.readValue(file, new TypeReference<Map<String, String>>(){});
		//logger.info(test.get("accessKey") + ": accessKey");
		//logger.info(test.get("secretKey") + ": secretKey");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home/index";
	}
	
}
