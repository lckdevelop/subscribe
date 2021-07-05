package dev.department.subscribe;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dev.department.subscribe.sec.SecurityMember;
import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
public class HomeController {
   
   @Autowired private ResourceLoader resourceLoader;

   /**
    * Simply selects the home view to render by returning its name.
    * @throws IOException 
    */
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home(Locale locale, Model model, Authentication authentication) throws IOException {

      /*
       * File file = new File(
       * getClass().getClassLoader().getResource("s3key.json").getFile() );
       * ObjectMapper mapper = new ObjectMapper(); Map<String, String> test =
       * mapper.readValue(file, new TypeReference<Map<String, String>>(){});
       */
      //logger.info(test.get("accessKey") + ": accessKey");
      //logger.info(test.get("secretKey") + ": secretKey");
      
		if (authentication != null) {
			SecurityMember sMember = (SecurityMember) authentication.getPrincipal();

			log.info(sMember.getName() + ": 겟 네임입니다~");
			log.info(sMember.getNo() + ": 겟 네임입니다~");
		}
	   
      Date date = new Date();
      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
      
      String formattedDate = dateFormat.format(date);
      
      model.addAttribute("serverTime", formattedDate );
      
      return "home/index";
   }
   
}