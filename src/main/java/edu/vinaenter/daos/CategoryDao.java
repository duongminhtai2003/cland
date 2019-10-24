package edu.vinaenter.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import edu.vinaenter.constants.CommonConstants;
import edu.vinaenter.dto.CategoryDTO;
import edu.vinaenter.models.Category;

@Repository
public class CategoryDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<CategoryDTO> findAll() {
		String sql = "SELECT c.id, " + "c.name AS catName, " + "COUNT(l.cid) AS totalCat " + "FROM categories as c "
				+ "LEFT JOIN lands as l " + "ON c.id = l.cid " + "GROUP BY c.id";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(CategoryDTO.class));
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
		return jdbcTemplate.query(sql, new Object[] { "%" + str + "%" }, new BeanPropertyRowMapper<>(Category.class));
	}

	public int countPagination() {
		String sql = "SELECT COUNT(1) AS countCat FROM categories";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	public int countPagination(String name) {
		String sql = "SELECT COUNT(1) AS countCat FROM categories WHERE name LIKE ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { name }, Integer.class);
	}

	public List<CategoryDTO> findCategoryHot() {
		String sql = "SELECT DISTINCT c.id, " + "c.name AS catName, " + "COUNT(l.cid) AS totalCat "
				+ "FROM categories AS c " + "INNER JOIN lands AS l " + "ON c.id = l.cid " + "GROUP BY c.id "
				+ "HAVING COUNT(l.cid) " + "ORDER BY l.count_views DESC " + "LIMIT ?";
		return jdbcTemplate.query(sql, new Object[] { CommonConstants.DEFAULT_HOT },
				new BeanPropertyRowMapper<>(CategoryDTO.class));
	}

}
