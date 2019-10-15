package edu.vinaenter.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import edu.vinaenter.constants.CommonConstants;
import edu.vinaenter.dto.LandsDTO;
import edu.vinaenter.models.Category;


@Repository
public class CategoryDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Category> findAll() {
		String sql = "SELECT id, name FROM categories ORDER BY id DESC";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Category.class));
	}
	
	public int addItems(Category cat) {
		String sql = "INSERT INTO categories(name) VALUES (?)";
		return jdbcTemplate.update(sql, new Object[] { cat.getName() });
	}

	public int delItems(int id) {
		String sql = "DELETE FROM categories WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] { id });
	}

	public int editItems(Category cat) {
		String sql = "UPDATE categories SET name = ? WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] { cat.getName(), cat.getId() });
	}
	
	public Category findItemById(int id) {
		String sql = "SELECT id, name FROM categories WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { id }, new BeanPropertyRowMapper<>(Category.class));
	}
	
	public List<Category> findAllByStr(String str) {
		String sql = "SELECT id, name FROM categories WHERE name LIKE ? ORDER BY id DESC";
		return jdbcTemplate.query(sql, new Object[] {"%"+str+"%" },new BeanPropertyRowMapper<>(Category.class));
	}

	public int countPagination() {
		String sql = "SELECT COUNT(1) AS countCat FROM categories";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public List<Category> findCategoryHot() {
		String sql = "SELECT DISTINCT c.id, "
				+ "c.name "
				+ "FROM categories AS c "
				+ "INNER JOIN lands AS l "
				+ "ON c.id = l.cid "
				+ "ORDER BY l.count_views DESC "
				+ "LIMIT ?";
		return jdbcTemplate.query(sql, new Object[] {CommonConstants.DEFAULT_HOT}, new BeanPropertyRowMapper<>(Category.class));
	}


}
