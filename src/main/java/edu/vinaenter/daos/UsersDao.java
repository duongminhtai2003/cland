package edu.vinaenter.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import edu.vinaenter.models.Users;

@Repository
public class UsersDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Users> findAll() {
		String sql = "SELECT id, username, fullname, remember_token, password FROM users ORDER BY id DESC";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Users.class));
	}

	public List<Users> findAllByStr(String str) {
		String sql = "SELECT id, username, fullname, remember_token, password FROM users WHERE fullname LIKE ? ORDER BY id DESC";
		return jdbcTemplate.query(sql, new Object[] { "%" + str + "%" }, new BeanPropertyRowMapper<>(Users.class));
	}

	public int addItems(Users users) {
		String sql = "INSERT INTO users(username, fullname, password, remember_token) VALUES (?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] { users.getUsername(), users.getFullname(), users.getPassword(),
				users.getRemember_token() });
	}

	public int delItems(int id) {
		String sql = "DELETE FROM users WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] { id });
	}

	public Users findItemById(int id) {
		String sql = "SELECT id, username, fullname, remember_token, password FROM users WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { id }, new BeanPropertyRowMapper<>(Users.class));
	}

	public int editItems(Users users) {
		String sql = "UPDATE users SET fullname = ?, password = ? WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] { users.getFullname(), users.getPassword() });
	}
	
	public int checkItems(Users users) {
		String sql = "SELECT * FROM users WHERE username = ?, password = ? WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] { users.getFullname(), users.getPassword() });
	}
}
