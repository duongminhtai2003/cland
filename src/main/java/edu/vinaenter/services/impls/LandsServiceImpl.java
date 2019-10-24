package edu.vinaenter.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.vinaenter.daos.LandsDAO;
import edu.vinaenter.dto.LandsDTO;
import edu.vinaenter.models.Lands;
import edu.vinaenter.services.LandsService;

@Service
public class LandsServiceImpl implements LandsService {
	@Autowired
	private LandsDAO landsDAO;

	@Override
	public List<LandsDTO> findAllPagination(int offset) {
		// TODO Auto-generated method stub
		return landsDAO.findAllPagination(offset);
	}

	@Override
	public int addItem(Lands lands) {
		// TODO Auto-generated method stub
		return landsDAO.addItems(lands);
	}

	@Override
	public int delItem(int id) {
		// TODO Auto-generated method stub
		return landsDAO.delItems(id);
	}

	@Override
	public int editItem(Lands lands) {
		// TODO Auto-generated method stub
		return landsDAO.editItems(lands);
	}

	@Override
	public List<LandsDTO> findAllByStrPagination(String str, int offset, String option) {
		// TODO Auto-generated method stub
		return landsDAO.findAllByStrPagination(str, offset, option);
	}

	@Override
	public LandsDTO findItemById(int id) {
		// TODO Auto-generated method stub
		return landsDAO.findItemById(id);
	}

	@Override
	public List<LandsDTO> findAllById(int id) {
		// TODO Auto-generated method stub
		return landsDAO.findAllById(id);
	}

	@Override
	public int countPagination() {
		// TODO Auto-generated method stub
		return landsDAO.countPagination();
	}

	@Override
	public List<LandsDTO> findItemsHot() {
		// TODO Auto-generated method stub
		return landsDAO.findItemsHot();
	}

	@Override
	public List<LandsDTO> findItemsLatest() {
		// TODO Auto-generated method stub
		return landsDAO.findItemsLatest();
	}

	@Override
	public int delItemByCid(int cid) {
		// TODO Auto-generated method stub
		return landsDAO.delItemsByCid(cid);
	}

}
