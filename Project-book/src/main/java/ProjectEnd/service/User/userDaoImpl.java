package ProjectEnd.service.User;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import ProjectEnd.entities.User_role;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ProjectEnd.entities.User;

@Repository
public class userDaoImpl implements userDAO{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<User> getUser(Integer offset, Integer maxResult) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("FROM User").
					setFirstResult(offset).
					setMaxResults(maxResult).
					list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public User getUserById(Long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		try {
			User user = session.get(User.class, id);
			return user;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean insertUser(User user) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(user);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			// TODO: handle exception
		}finally {
			session.close();
		}
		return false;
	}

	@Override
	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(user);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public boolean deleteUser(int userId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Long getTotalUser() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("select count(*) from User").list();
			return (Long) list.get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return 0L;
	}

	@Override
	public List<User> getUserByUserName(String userName, Integer offset, Integer maxResult) {
		Session session = sessionFactory.openSession();
		try {
			if (userName == null || userName.length() == 0) {
				userName = "%";
			} else {
				userName = "%" + userName + "%";
			}

			List list = session.createQuery("from User where userName like :userName")
					.setParameter("userName", userName)
					.setFirstResult(offset)
					.setMaxResults(maxResult)
					.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public Long getTotalUserByUserName(String userName) {
		Session session = sessionFactory.openSession();
		try {
			if (userName == null || userName.length() == 0) {
				userName = "%";
			} else {
				userName = "%" + userName + "%";
			}

			List list = session.createQuery("from User where userName like :userName")
					.setParameter("userName", userName)
					.list();
			Long temp = 0L;
			for (Object object : list){
				temp++;
			}
			return temp;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}
	@Override
	public User findByUserName(String username) {
		Session session = sessionFactory.openSession();
		try {
			User user = (User) session.createQuery("from User where userName = :userName")
					.setParameter("userName", username)
					.uniqueResult();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public String getRoleUser(User user) {
		if (user==null){
			return null;
		}
		Set<String> roleName = new HashSet<>();
		Set<User_role> roles = user.getUserRoles();
		for (User_role account_Role : roles) {
			roleName.add(account_Role.getRole().getName());
			System.out.println(account_Role.getRole().getName());
		}
		if(roleName.contains("ROLE_ADMIN")){
			return "Admin";
		}else {
			return "User";
		}
	}

	@Override
	public User findByMail(String email) {
		Session session = sessionFactory.openSession();
		try {
			User user = (User) session.createQuery("from User where email = :email")
					.setParameter("email", email)
					.uniqueResult();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}


}
