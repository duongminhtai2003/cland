package edu.vinaenter.services;

import java.util.List;

import edu.vinaenter.models.Contact;

public interface ContactService {

	List<Contact> findAllPanigation(int offset);

	int addItem(Contact contact);

	int delItem(int id);

	int editItem(Contact contact);

	Contact findItemById(int id);

	List<Contact> searchItems(int offset, String str, String option);

	int countPagination();

	// abstract class : muốn bắt buộc các class kế thừa phải override lại
	// các method cũng như có những method chung

	// interface: 100%: kế thừa interface => override tất cả các method đc
	// định nghĩa trong interface đó

}
