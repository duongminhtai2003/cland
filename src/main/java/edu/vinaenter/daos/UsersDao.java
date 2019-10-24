package edu.vinaenter.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import edu.vinaenter.constants.CommonConstants;
import edu.vinaenter.models.Users;

@Repository
public class UsersDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Users> findAllPagination(int offset) {
		String sql = "SELECT u.id, "
				+ "u.username, "
				+ "u.fullname, "
				+ "u.password, "
				+ "u.enable, "
				+ "u.role_id AS roleid, "
				+ "r.name AS roleName "
				+ "FROM users AS u "
				+ "INNER JOIN roles AS r "
				+ "ON u.role_id = r.id "
				+ "ORDER BY id DESC "
				+ "LIMIT ?, ?";
		return jdbcTemplate.query(sql, new Object[] { offset, CommonConstants.DEFAULT_PAGING_SIZE },
				new BeanPropertyRowMapper<>(Users.class));
	}

	public int countPagination() {
		String sql = "SELECT COUNT(1) AS countUser " 
				+ "FROM users " 
				+ "ORDER BY id DESC ";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	public List<Users> searchItems(int offset, String str, String option) {
		String sql = "";
		if ("username".equals(option)) {
			sql = "SELECT u.id, "
					+ "u.username, "
					+ "u.fullname, "
					+ "u.password, "
					+ "u.enable, "
					+ "u.role_id AS roleid, "
					+ "r.name AS roleName "
					+ "FROM users AS u "
					+ "INNER JOIN roles AS r "
					+ "ON u.role_id = r.id "
					+ "WHERE u.username LIKE ?"
					+ "LIMIT ?, ?";
		} else if ("fullname".equals(option)) {
			sql = "SELECT u.id, "
					+ "u.username, "
					+ "u.fullname, "
					+ "u.password, "
					+ "u.enable, "
					+ "u.role_id AS roleid, "
					+ "r.name AS roleName "
					+ "FROM users AS u "
					+ "INNER JOIN roles AS r "
					+ "ON u.role_id = r.id "
					+ "WHERE u.fullname LIKE ?"
					+ "LIMIT ?, ?";
		}else if ("role".equals(option)) {
			sql = "SELECT u.id, "
					+ "u.username, "
					+ "u.fullname, "
					+ "u.password, "
					+ "u.enable, "
					+ "u.role_id AS roleid, "
					+ "r.name AS roleName "
					+ "FROM users AS u "
					+ "INNER JOIN roles AS r "
					+ "ON u.role_id = r.id "
					+ "WHERE r.name LIKE ? "
					+ "LIMIT ?, ?";
		}
		return jdbcTemplate.query(sql, new Object[] { "%" + str + "%", offset, CommonConstants.DEFAULT_PAGING_SIZE },
				new BeanPropertyRowMapper<>(Users.class));
	}

	public int addItems(Users users) {
		String sql = "INSERT INTO users(username, fullname, password, role_id, enable) VALUES (?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] { users.getUsername(), users.getFullname(), users.getPassword(), users.getRoleid(), 1 });
	}

	public int delItems(int id) {
		String sql = "DELETE FROM users WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] { id });
	}

	public Users findItemById(int id) {
		String sql = "SELECT u.id, "
				+ "u.username, "
				+ "u.fullname, "
				+ "u.password, "
				+ "u.enable, "
				+ "u.role_id AS roleid, "
				+ "r.name AS roleName "
				+ "FROM users AS u "
				+ "INNER JOIN roles AS r "
				+ "ON u.role_id = r.id "
				+ "WHERE u.id = ? "
				+ "ORDER BY u.id DESC ";
		return jdbcTemplate.queryForObject(sql, new Object[] { id }, new BeanPropertyRowMapper<>(Users.class));
	}

	public int editItems(Users users) {
		String sql = "UPDATE users SET username=?, fullname=?, password=?, role_id=? WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {users.getUsername(), users.getFullname(), users.getPassword(), users.getRoleid(), users.getId() });
	}
	
	public int editEnable(int enable, int id) {
		String sql = "UPDATE users SET enable = ? WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] { enable, id });
	}

	public int checkItems(Users users) {
		String sql = "SELECT * FROM users WHERE username = ?, password = ? WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] { users.getFullname(), users.getPassword() });
	}
	
	public int checkUsername(String username) {
		String sql = "SELECT COUNT(1) AS countUser FROM users WHERE username = ? ";
		return jdbcTemplate.queryForObject(sql, new Object[] { username }, Integer.class);
	}
}
