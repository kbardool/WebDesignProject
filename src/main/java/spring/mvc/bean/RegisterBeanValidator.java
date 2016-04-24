package spring.mvc.bean;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class RegisterBeanValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return RegisterBeanValidator.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		 ValidationUtils.rejectIfEmpty(errors, "password", null, "Password can not be empty");		 
		 //Register register = (Register) target;		 
		 //errors.rejectValue("errorField", null, "RegisterBeanValidator: error");
		 
	}

}
