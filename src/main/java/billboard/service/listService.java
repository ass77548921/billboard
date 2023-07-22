package billboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import billboard.dao.listdao;
import billboard.model.list;

@Service
public class listService {

	@Autowired
	private listdao dao;
	
	public List<list> findAll() {
		return dao.findAll();
	}
	
	public list findById(Integer id) {
		return dao.findById(id);
	}
	
	public void deleteById(list data) {
		dao.deleteById(data);
	}
	
}
