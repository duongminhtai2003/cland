package edu.vinaenter.services;

import java.util.List;

import edu.vinaenter.models.Users;

public interface UsersService {

	List<Users> findAllPagination(int offset);
	
	List<Users> searchItems(int offset, String str, String option);

	int addItem(Users users);
	
	int delItem(int id);
	
	Users findItemById(int id);
	
	int editItem(Users users);
	
	int editEnable(int enable, int id);

	int countPagination();
	
	int checkUsername(String username);
	
	// abstract class : muốn bắt buộc các class kế thừa phải override lại
	// các method cũng như có những method chung

	// interface: 100%: kế thừa interface => override tất cả các method đc
	// định nghĩa trong interface đó

}
