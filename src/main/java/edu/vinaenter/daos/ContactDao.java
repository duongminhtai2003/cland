package edu.vinaenter.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import edu.vinaenter.constants.CommonConstants;
import edu.vinaenter.models.Contact;


@Repository
public class ContactDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Contact> findAllPanigation(int offset) {
		String sql = "SELECT id, "
				+ "fullname, "
				+ "email, "
				+ "subject, "
				+ "content "
				+ "FROM contact "
				+ "ORDER BY id DESC "
				+ "LIMIT ?, ?";
		return jdbcTemplate.query(sql, new Object[] {offset, CommonConstants.DEFAULT_PAGING_SIZE}, new BeanPropertyRowMapper<>(Contact.class));
	}

	public int addItems(Contact contact) {
		String sql = "INSERT INTO contact(fullname, email, subject, content) VALUES (?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] { contact.getFullname(), contact.getEmail(), contact.getSubject(), contact.getContent() });
	}

	public int delItems(int id) {
		String sql = "DELETE FROM contact WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] { id });
	}

	public int editItems(Contact contact) {
		String sql = "UPDATE contact SET fullname=?, email=?, subject=?, content=? WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] { contact.getFullname(), contact.getEmail(), contact.getSubject(), contact.getContent(), contact.getId() });
	}
	
	public Contact findItemById(int id) {
		String sql = "SELECT id, fullname, email, subject, content FROM contact WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { id }, new BeanPropertyRowMapper<>(Contact.class));
	}
	
	public List<Contact> searchItems(int offset, String str, String option) {
		String sql = "";
		if("fullname".equals(option)) {
			sql = "SELECT id, "
					+ "fullname, "
					+ "email, "
					+ "subject, "
					+ "content "
					+ "FROM contact "
					+ "WHERE fullname LIKE ? "
					+ "LIMIT ?, ?";
		}else if("email".equals(option)) {
			sql = "SELECT id, "
					+ "fullname, "
					+ "email, "
					+ "subject, "
					+ "content "
					+ "FROM contact "
					+ "WHERE email LIKE ? "
					+ "LIMIT ?, ?";
		}else if("subject".equals(option)) {
			sql = "SELECT id, "
					+ "fullname, "
					+ "email, "
					+ "subject, "
					+ "content "
					+ "FROM contact "
					+ "WHERE subject LIKE ? "
					+ "LIMIT ?, ?";
		}
		return jdbcTemplate.query(sql, new Object[] {"%"+str+"%", offset, CommonConstants.DEFAULT_PAGING_SIZE}, new BeanPropertyRowMapper<>(Contact.class));
	}
	public int countPagination() {
		String sql = "SELECT COUNT(1) AS countContact FROM contact";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

}
