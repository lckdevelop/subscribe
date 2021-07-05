package dev.department.subscribe;

import java.io.*;
import java.text.*;
import java.util.*;

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
   
   @Autowired private ResourceLoader resourceLoader;

   /**
    * Simply selects the home view to render by returning its name.
    * @throws IOException 
    */
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home(Locale locale, Model model) throws IOException {

      /*
       * File file = new File(
       * getClass().getClassLoader().getResource("s3key.json").getFile() );
       * ObjectMapper mapper = new ObjectMapper(); Map<String, String> test =
       * mapper.readValue(file, new TypeReference<Map<String, String>>(){});
       */
      //logger.info(test.get("accessKey") + ": accessKey");
      //logger.info(test.get("secretKey") + ": secretKey");
      
      Date date = new Date();
      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
      
      String formattedDate = dateFormat.format(date);
      
      model.addAttribute("serverTime", formattedDate );
      
      return "home/index";
   }
   
}