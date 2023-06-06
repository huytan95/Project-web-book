package ProjectEnd.service.contact;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ProjectEnd.entities.imageInfor;

@Repository
public class imageInforDaoImpl implements imageInforDAO{
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<imageInfor> getImageInfor() {
		Session session = sessionFactory.openSession();
		try {
			List listImageInfor = session.createQuery("from imageInfor").list();
			return listImageInfor;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public imageInfor getImageInforById(int id) {
		Session session = sessionFactory.openSession();
		try {
			imageInfor imageInfor = session.get(imageInfor.class, id);
			return imageInfor;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean updateImageInfor(imageInfor imageInfor) {
		// TODO Auto-generated method stub
				Session session = sessionFactory.openSession();
				try {
					session.beginTransaction();
					session.update(imageInfor);
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
