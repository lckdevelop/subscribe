package dev.department.subscribe.web;

import org.springframework.stereotype.Controller;
import dev.department.subscribe.util.S3Utils;

@Controller
public class UploadController {
	
	S3Utils s3 = new S3Utils();
	String bucketName = "subscribe";
	
	
	//자격증 & 신분증 이미지 업로드 -> 참고
//		@ResponseBody
//		@RequestMapping(value = "/uploadAjaxCert", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
//		public String uploadAjaxCertificate(MultipartFile file) throws Exception {
//
//			logger.info("자격증");
//			logger.info("originalName: " + file.getOriginalFilename());
//			String uploadpath = "almom/certificate";
//
//			ResponseEntity<String> img_path = new ResponseEntity<>(
//					UploadFileUtils.uploadFile(uploadpath, file.getOriginalFilename(), file.getBytes()),
//					HttpStatus.CREATED);
//			String certificatePath = (String) img_path.getBody();
//
//			return certificatePath;
//		}

}
