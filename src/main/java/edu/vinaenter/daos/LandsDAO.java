package edu.vinaenter.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import edu.vinaenter.constants.CommonConstants;
import edu.vinaenter.dto.LandsDTO;
import edu.vinaenter.models.Lands;

@Repository
public class LandsDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<LandsDTO> findAllPagination(int offset) {
		String sql = "SELECT l.id, "
			+ "l.name AS landsName, "
			+ "description, "
			+ "l.date_create AS dateCreate, "
			+ "l.cid, "
			+ "c.name AS catName, "
			+ "picture, area, "
			+ "address, "
			+ "count_views AS countViews "
			+ "FROM lands AS l "
			+ "INNER JOIN categories AS c "
			+ "ON c.id = l.cid ORDER BY l.id DESC "
			+ "LIMIT ?, ?";
		return jdbcTemplate.query(sql, new Object[] {offset, CommonConstants.DEFAULT_PAGING_SIZE}, new BeanPropertyRowMapper<>(LandsDTO.class));
	}
	
	public int countPagination() {
		String sql = "SELECT COUNT(1) AS countLand "
				+ "FROM lands AS l "
				+ "INNER JOIN categories AS c "
				+ "ON c.id = l.cid ORDER BY l.id DESC ";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public List<LandsDTO> findAllById(int id) {
		String sql = "SELECT l.id, "
				+ "l.name AS landsName, "
				+ "l.description, "
				+ "l.date_create AS dateCreate, "
				+ "l.cid, "
				+ "c.name AS catName, "
				+ "l.picture, "
				+ "l.area, "
				+ "l.address, "
				+ "l.count_views AS countViews "
				+ "FROM lands AS l "
				+ "INNER JOIN categories AS c "
				+ "ON c.id = l.cid "
				+ "WHERE c.id = ?";
		return jdbcTemplate.query(sql, new Object[] { id }, new BeanPropertyRowMapper<>(LandsDTO.class));
			
	}
	

	public int addItems(Lands lands) {
		String sql = "INSERT INTO lands(name, description, date_create, cid, picture, area, address, count_views) VALUES (?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] { 
				lands.getName(),
				lands.getDescription(),
				lands.getDate_create(),
				lands.getCat().getId(),
				lands.getPicture(),
				lands.getArea(),
				lands.getAddress(),
				lands.getCount_views(),
		});
	}
	
	public int editItems(Lands lands) {
		String sql = "UPDATE lands SET name = ?, description = ?, date_create = ?, cid = ?, picture = ?, area = ?, address = ?, count_views = ? WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] { 
				lands.getName(),
				lands.getDescription(),
				lands.getDate_create(),
				lands.getCat().getId(),
				lands.getPicture(),
				lands.getArea(),
				lands.getAddress(),
				lands.getCount_views(),
				lands.getId()
		});
	}

	public int delItems(int id) {
		String sql = "DELETE FROM lands WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] { id });
	}
	
	public int delItemsByCid(int cid) {
		String sql = "DELETE FROM lands WHERE cid = ?";
		return jdbcTemplate.update(sql, new Object[] { cid });
	}

	public LandsDTO findItemById(int id) {
		String sql = "SELECT l.id, "
				+ "l.name AS landsName, "
				+ "l.description, "
				+ "l.date_create AS dateCreate, "
				+ "l.cid, "
				+ "c.name AS catName, "
				+ "l.picture, "
				+ "l.area, "
				+ "l.address, "
				+ "l.count_views AS countViews "
				+ "FROM lands AS l "
				+ "INNER JOIN categories AS c "
				+ "ON c.id = l.cid "
				+ "WHERE l.id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { id }, new BeanPropertyRowMapper<>(LandsDTO.class));
	}
	
	public List<LandsDTO> findAllByStrPagination(String str, int offset, String option) {
		String sql = "";
		if("landsName".equals(option)) {
				sql = "SELECT l.id, "
					+ "l.name AS landsName, "
					+ "description, "
					+ "l.date_create AS dateCreate, "
					+ "l.cid, "
					+ "c.name AS catName, "
					+ "picture, area, "
					+ "address, "
					+ "count_views AS countViews "
					+ "FROM lands AS l "
					+ "INNER JOIN categories AS c "
					+ "ON c.id = l.cid "
					+ "WHERE l.name LIKE ? "
					+ "LIMIT ?, ?";
		}else if("catName".equals(option)) {
				sql = "SELECT l.id, "
					+ "l.name AS landsName, "
					+ "description, "
					+ "l.date_create AS dateCreate, "
					+ "l.cid, "
					+ "c.name AS catName, "
					+ "picture, area, "
					+ "address, "
					+ "count_views AS countViews "
					+ "FROM lands AS l "
					+ "INNER JOIN categories AS c "
					+ "ON c.id = l.cid "
					+ "WHERE c.name LIKE ? "
					+ "LIMIT ?, ?";
		}else if("address".equals(option)) {
			sql = "SELECT l.id, "
					+ "l.name AS landsName, "
					+ "description, "
					+ "l.date_create AS dateCreate, "
					+ "l.cid, "
					+ "c.name AS catName, "
					+ "picture, area, "
					+ "address, "
					+ "count_views AS countViews "
					+ "FROM lands AS l "
					+ "INNER JOIN categories AS c "
					+ "ON c.id = l.cid "
					+ "WHERE address LIKE ? "
					+ "LIMIT ?, ?";
		}
		return jdbcTemplate.query(sql, new Object[] {"%"+str+"%", offset, CommonConstants.DEFAULT_PAGING_SIZE}, new BeanPropertyRowMapper<>(LandsDTO.class));
	}
	
	public List<LandsDTO> findItemsHot() {
		String sql = "SELECT l.id, "
			+ "l.name AS landsName, "
			+ "description, "
			+ "l.date_create AS dateCreate, "
			+ "l.cid, "
			+ "c.name AS catName, "
			+ "picture, area, "
			+ "address, "
			+ "count_views AS countViews "
			+ "FROM lands AS l "
			+ "INNER JOIN categories AS c "
			+ "ON c.id = l.cid ORDER BY count_views DESC "
			+ "LIMIT ?";
		return jdbcTemplate.query(sql, new Object[] {CommonConstants.DEFAULT_HOT}, new BeanPropertyRowMapper<>(LandsDTO.class));
	}
	
	public List<LandsDTO> findItemsLatest () {
		String sql = "SELECT l.id, "
			+ "l.name AS landsName, "
			+ "description, "
			+ "l.date_create AS dateCreate, "
			+ "l.cid, "
			+ "c.name AS catName, "
			+ "picture, area, "
			+ "address, "
			+ "count_views AS countViews "
			+ "FROM lands AS l "
			+ "INNER JOIN categories AS c "
			+ "ON c.id = l.cid ORDER BY l.id DESC "
			+ "LIMIT ?";
		return jdbcTemplate.query(sql, new Object[] {CommonConstants.DEFAULT_LATEST}, new BeanPropertyRowMapper<>(LandsDTO.class));
	}
}
