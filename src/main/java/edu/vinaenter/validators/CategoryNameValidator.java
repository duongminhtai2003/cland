package edu.vinaenter.validators;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import edu.vinaenter.models.Category;
import edu.vinaenter.utils.CharacterUtil;

@Component
public class CategoryNameValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.isAssignableFrom(Category.class);
	}

	@Override
	public void validate(Object object, Errors errors) {
		Category cat = (Category) object;
		if (CharacterUtil.isValidCharacterSpecial(cat.getName())) {   
			errors.rejectValue("name", null, "Vui lòng không nhập tên chứa các kí tự như: " + CharacterUtil.show());
			// mong muốn in ra các kí tự để người dùng biết tránh nhập sai tiếp
		}
	}

}
