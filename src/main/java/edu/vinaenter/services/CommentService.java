package edu.vinaenter.services;

import java.util.List;

import edu.vinaenter.models.Comment;

public interface CommentService {
	List<Comment> findAllPagination(int offset);

	List<Comment> findAllByLandsID(int lid);
	
	List<Comment> searchItems(int offset, String str, String option);

	int countPagination();

	int addItems(Comment comment);

	int delItems(int id);

}
