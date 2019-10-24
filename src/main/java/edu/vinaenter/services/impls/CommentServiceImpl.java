package edu.vinaenter.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.vinaenter.daos.CommentDAO;
import edu.vinaenter.models.Comment;
import edu.vinaenter.services.CommentService;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentDAO commentDAO;

	@Override
	public List<Comment> findAllPagination(int offset) {
		// TODO Auto-generated method stub
		return commentDAO.findAllPagination(offset);
	}
	
	@Override
	public List<Comment> findAllByLandsID(int lid) {
		// TODO Auto-generated method stub
		return commentDAO.findAllByLandsID(lid);
	}

	@Override
	public List<Comment> searchItems(int offset, String str, String option) {
		// TODO Auto-generated method stub
		return commentDAO.searchItems(offset, str, option);
	}

	@Override
	public int countPagination() {
		// TODO Auto-generated method stub
		return commentDAO.countPagination();
	}

	@Override
	public int addItems(Comment comment) {
		// TODO Auto-generated method stub
		return commentDAO.addItems(comment);
	}

	@Override
	public int delItems(int id) {
		// TODO Auto-generated method stub
		return commentDAO.delItems(id);
	}

}
