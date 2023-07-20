package billboard.dao;

import java.util.List;


import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import billboard.model.list;


@Repository
public class listdaoImpl implements listdao{

	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	@Transactional
	public List<list> findAll() {
		 return sessionFactory.getCurrentSession().createNativeQuery("SELECT * FROM list ", list.class).getResultList();
		
	}
	
	

	
	
	
}
