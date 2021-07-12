package dev.department.subscribe.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import dev.department.subscribe.dto.CouponDTO;
import jdk.internal.org.jline.utils.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CouponValidator implements Validator {

	@Override
	public boolean supports(Class<?> arg0) {
		return CouponDTO.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		log.info("Coupon validate --");
		
		CouponDTO couponDTO = (CouponDTO) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "notEmpty", "제목이 비어있습니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "type", "notEmpty", "구분이 비어있습니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "amount", "notEmpty", "할인가가 비어있습니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "duetime", "notEmpty", "유효기간이 비어있습니다.");
		
		int amount = couponDTO.getAmount();
		int type = couponDTO.getType();
		
		if (amount <= 0) {
			errors.rejectValue("amount", "trouble");
		}
		
		if (type == 0 && amount >= 100) {
			errors.rejectValue("amount", "trouble");
		}
		
	}

}
