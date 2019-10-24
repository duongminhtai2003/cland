package edu.vinaenter.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.vinaenter.daos.ContactDao;
import edu.vinaenter.models.Contact;
import edu.vinaenter.services.ContactService;

@Service
public class ContactServiceImpl implements ContactService {
	@Autowired
	private ContactDao contactDAO;

	@Override
	public List<Contact> findAllPanigation(int offset) {
		// TODO Auto-generated method stub
		return contactDAO.findAllPanigation(offset);
	}

	@Override
	public int addItem(Contact contact) {
		return contactDAO.addItems(contact);
	}

	@Override
	public int delItem(int id) {
		return contactDAO.delItems(id);
	}

	@Override
	public int editItem(Contact contact) {
		return contactDAO.editItems(contact);
	}

	@Override
	public Contact findItemById(int id) {
		return contactDAO.findItemById(id);
	}

	@Override
	public List<Contact> searchItems(int offset, String str, String option) {
		return contactDAO.searchItems(offset, str, option);
	}

	@Override
	public int countPagination() {
		// TODO Auto-generated method stub
		return contactDAO.countPagination();
	}

}
