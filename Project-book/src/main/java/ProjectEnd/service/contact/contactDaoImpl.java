package ProjectEnd.service.contact;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ProjectEnd.entities.contact;

@Repository
public class contactDaoImpl implements contactDAO{
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public List<contact> getContact(){
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from contact").list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}
	@Override
	public contact getInforByEmail(String email) {
		Session session = sessionFactory.openSession();
		try {
			contact infor = session.get(contact.class, email);
			return infor;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}
	@Override
	public contact getInforById(int id) {
		Session session = sessionFactory.openSession();
		try {
			contact infor = session.get(contact.class, id);
			return infor;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}
	
	@Override
	public boolean updateInfor(contact infor) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(infor);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return false;
	}
	}


