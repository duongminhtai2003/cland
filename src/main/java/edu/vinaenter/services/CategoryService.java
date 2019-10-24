package edu.vinaenter.services;

import java.util.List;

import edu.vinaenter.dto.CategoryDTO;
import edu.vinaenter.models.Category;

public interface CategoryService {
	
	List<CategoryDTO> findAll();
	
	int addItem(Category cat);
	
	int delItem(int id);
	
	int editItem(Category cat);
	
	Category findItemById(int id);
	
	List<Category> findAllByStr(String str);

	int countPagination();
	
	int countPagination(String name);
	
	List<CategoryDTO> findCategoryHot();
	
	// abstract class : muốn bắt buộc các class kế thừa phải override lại
	// các method cũng như có những method chung

	// interface: 100%: kế thừa interface => override tất cả các method đc
	// định nghĩa trong interface đó

}
