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
	public List<Users> findAll() {
		// TODO Auto-generated method stub
		return usersDAO.findAll();
	}

	@Override
	public List<Users> findAllByStr(String str) {
		// TODO Auto-generated method stub
		return usersDAO.findAllByStr(str);
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

}
