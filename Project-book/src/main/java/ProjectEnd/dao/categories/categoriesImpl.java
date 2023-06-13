package ProjectEnd.dao.categories;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ProjectEnd.entities.Categories;

@Repository
public class categoriesImpl implements categoriesInterface{
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public List<Categories> getCategories() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from Categories ORDER BY id ASC").list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public Categories getCategoryById(int cateId) {
		Session session = sessionFactory.openSession();
		try {
			Categories categories = session.get(Categories.class, cateId);
			return categories;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean insertCategory(Categories categories) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(categories);
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

	@Override
	public boolean updateCategory(Categories categories) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(categories);
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

	@Override
	public boolean deteleCategory(int cateId) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.delete(getCategoryById(cateId));
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
