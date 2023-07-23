package billboard.dao;

import java.util.List;

import billboard.model.list;

public interface listdao {

	
	List<list> findAll();
	list findById(Integer id);
	
	void deleteById(list data);
	void saveData(list data);
	void updateData(list data);
}