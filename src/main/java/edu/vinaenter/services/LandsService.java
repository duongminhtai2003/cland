package edu.vinaenter.services;

import java.util.List;

import edu.vinaenter.dto.LandsDTO;
import edu.vinaenter.models.Lands;

public interface LandsService {
	
	List<LandsDTO> findAllPagination(int offset);
	
	int addItem(Lands lands);
	
	int delItem(int id);
	
	int editItem(Lands lands);
	// abstract class : muốn bắt buộc các class kế thừa phải override lại
	// các method cũng như có những method chung
	LandsDTO findItemById(int id);

	List<LandsDTO> findAllByStrPagination(String str, int offset, String option);
	
	List<LandsDTO> findAllById(int id);

	// interface: 100%: kế thừa interface => override tất cả các method đc
	// định nghĩa trong interface đó
	
	int countPagination();
	
	List<LandsDTO> findItemsHot();
	
	List<LandsDTO> findItemsLatest();
	
	int delItemByCid(int cid);

}
