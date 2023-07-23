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
	
	
	@Override
	@Transactional
	public list findById(Integer id) {
		String sql = "SELECT * FROM list Where id="+id;
		 return sessionFactory.getCurrentSession().createNativeQuery(sql, list.class).getSingleResult();
		
	}
	
	@Override
	@Transactional
	public void deleteById(list data) {
		sessionFactory.getCurrentSession().delete(data);
		 
		
	}


	@Override
	@Transactional
	public void saveData(list data) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(data);
	}
	
	@Override
	@Transactional
	public void updateData(list data) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(data);
	}

	
	
	
}
