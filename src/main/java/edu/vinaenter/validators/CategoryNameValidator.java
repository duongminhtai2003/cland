package edu.vinaenter.validators;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import edu.vinaenter.models.Category;

@Component
public class CategoryNameValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.isAssignableFrom(Category.class);
	}

	@Override
	public void validate(Object object, Errors errors) {
		//validation for name of category
	}

}
