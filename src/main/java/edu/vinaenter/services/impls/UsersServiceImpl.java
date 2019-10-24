package edu.vinaenter.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.vinaenter.daos.UsersDao;
import edu.vinaenter.models.Users;
import edu.vinaenter.services.UsersService;

@Service
public class UsersServiceImpl implements UsersService {
	@Autowired
	private UsersDao usersDAO;

	@Override
	public List<Users> findAllPagination(int offset) {
		// TODO Auto-generated method stub
		return usersDAO.findAllPagination(offset);
	}

	@Override
	public List<Users> searchItems(int offset, String str, String option) {
		// TODO Auto-generated method stub
		return usersDAO.searchItems(offset, str, option);
	}

	@Override
	public int addItem(Users users) {
		// TODO Auto-generated method stub
		return usersDAO.addItems(users);
	}

	@Override
	public int delItem(int id) {
		// TODO Auto-generated method stub
		return usersDAO.delItems(id);
	}

	@Override
	public Users findItemById(int id) {
		// TODO Auto-generated method stub
		return usersDAO.findItemById(id);
	}

	@Override
	public int editItem(Users users) {
		// TODO Auto-generated method stub
		return usersDAO.editItems(users);
	}
	
	@Override
	public int countPagination() {
		// TODO Auto-generated method stub
		return usersDAO.countPagination();
	}

	@Override
	public int editEnable(int enable, int id) {
		// TODO Auto-generated method stub
		return usersDAO.editEnable(enable, id);
	}

	@Override
	public int checkUsername(String username) {
		// TODO Auto-generated method stub
		return usersDAO.checkUsername(username);
	}

}
