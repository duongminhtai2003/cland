package edu.vinaenter.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.vinaenter.daos.CategoryDao;
import edu.vinaenter.dto.CategoryDTO;
import edu.vinaenter.models.Category;
import edu.vinaenter.services.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDao catDao;
	
	@Override
	public List<CategoryDTO> findAll() {
		// TODO Auto-generated method stub
		return catDao.findAll();
	}
	
	@Override
	public int addItem(Category cat) {
		return catDao.addItems(cat);
	}

	@Override
	public int delItem(int id) {
		return catDao.delItems(id);
	}

	@Override
	public int editItem(Category cat) {
		return catDao.editItems(cat);
	}
	
	@Override
	public Category findItemById(int id) {
		return catDao.findItemById(id);
	}

	@Override
	public List<Category> findAllByStr(String str) {
		return catDao.findAllByStr(str);
	}

	@Override
	public int countPagination() {
		// TODO Auto-generated method stub
		return catDao.countPagination();
	}

	@Override
	public List<CategoryDTO> findCategoryHot() {
		// TODO Auto-generated method stub
		return catDao.findCategoryHot();
	}

	@Override
	public int countPagination(String name) {
		// TODO Auto-generated method stub
		return catDao.countPagination(name);
	}

}
