package edu.vinaenter.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import edu.vinaenter.constants.CommonConstants;
import edu.vinaenter.models.Comment;

@Repository
public class CommentDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Comment> findAllPagination(int offset) {
		String sql = "SELECT c.id, "
			+ "c.fullname, "
			+ "c.lid, "
			+ "c.content, "
			+ "c.date_create AS dateCreate, "
			+ "l.name AS landsName "
			+ "FROM comment AS c "
			+ "INNER JOIN lands AS l "
			+ "ON c.lid = l.id ORDER BY c.id DESC "
			+ "LIMIT ?, ?";
		return jdbcTemplate.query(sql, new Object[] { offset, CommonConstants.DEFAULT_PAGING_SIZE }, new BeanPropertyRowMapper<>(Comment.class));
	}
	
	public List<Comment> findAllByLandsID(int lid) {
		String sql = "SELECT id, "
			+ "fullname, "
			+ "content, "
			+ "date_create AS dateCreate, "
			+ "lid "
			+ "FROM comment "
			+ "WHERE lid = ? ";
		return jdbcTemplate.query(sql, new Object[] {lid}, new BeanPropertyRowMapper<>(Comment.class));
	}
	
	public List<Comment> searchItems(int offset, String str, String option) {
		String sql = "";
		if ("fullname".equals(option)) {
				sql = "SELECT c.id, "
					+ "c.fullname, "
					+ "c.lid, "
					+ "c.content, "
					+ "c.date_create AS dateCreate, "
					+ "l.name AS landsName "
					+ "FROM comment AS c "
					+ "INNER JOIN lands AS l "
					+ "ON c.lid = l.id "
					+ "WHERE c.fullname LIKE ? "
					+ "LIMIT ?, ?";
		} else if ("content".equals(option)) {
			sql = "SELECT c.id, "
					+ "c.fullname, "
					+ "c.lid, "
					+ "c.content, "
					+ "c.date_create AS dateCreate, "
					+ "l.name AS landsName "
					+ "FROM comment AS c "
					+ "INNER JOIN lands AS l "
					+ "ON c.lid = l.id "
					+ "WHERE c.content LIKE ? "
					+ "LIMIT ?, ?";
		}else if ("landsName".equals(option)) {
			sql = "SELECT c.id, "
					+ "c.fullname, "
					+ "c.lid, "
					+ "c.content, "
					+ "c.date_create AS dateCreate, "
					+ "l.name AS landsName "
					+ "FROM comment AS c "
					+ "INNER JOIN lands AS l "
					+ "ON c.lid = l.id "
					+ "WHERE l.name LIKE ? "
					+ "LIMIT ?, ?";
		}
		return jdbcTemplate.query(sql, new Object[] { "%" + str + "%", offset, CommonConstants.DEFAULT_PAGING_SIZE },
				new BeanPropertyRowMapper<>(Comment.class));
	}
	
	public int countPagination() {
		String sql = "SELECT COUNT(1) AS countComment "
				+ "FROM comment AS c "
				+ "INNER JOIN lands AS l "
				+ "ON c.lid = l.id ORDER BY c.id DESC ";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public int addItems(Comment comment) {
		String sql = "INSERT INTO comment(fullname, lid, content) VALUES (?,?,?)";
		return jdbcTemplate.update(sql, new Object[] { 
				comment.getFullname(),
				comment.getLid(),
				comment.getContent()
		});
	}
	
	public int delItems(int id) {
		String sql = "DELETE FROM comment WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] { id });
	}
}
