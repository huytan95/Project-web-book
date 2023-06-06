package ProjectEnd.service.Role;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ProjectEnd.entities.Role;

@Repository
public class roleDaoImpl implements roleDAO{
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public Role getRoleById(Long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		try {
			Role role = session.get(Role.class, id);
			return role;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}
	@Override
	public List<Role> getRole() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("FROM Role").
					list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}
	/*@Override
	public Role getRoleByName(String name) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		try {
			Role role = session.get(Role.class, name);
			return role;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}*/

}
