package ProjectEnd.dao.Product;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ProjectEnd.entities.Product;

@Repository
public class productDaoImpl implements ProductDAO{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Product> getProduct() {
		Session session = sessionFactory.openSession();
		try {
			List<Product> list = session.createQuery("from Product ").list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public Product getProductById(int productId) {
		Session session = sessionFactory.openSession();
		try {
			Product product = session.get(Product.class, productId);
			return product;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean insertProduct(Product product) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(product);
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
	public boolean updateProduct(Product product) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.update(product);
			tx.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
			// TODO: handle exception
		}finally {
			session.close();
		}
		return false;
	}

	@Override
	public boolean deleteProduct(int productId) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.delete(getProductById(productId));
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
	public List<Product> getProductByName(String productName, Integer offset, Integer maxResult) {
	    Session session = sessionFactory.openSession();
	    try {
	        if (productName == null || productName.length() == 0) {
	            productName = "%";
	        } else {
	            productName = "%" + productName + "%";
	        }

	        List list = session.createQuery("SELECT p FROM Product p WHERE LOWER(p.productName) LIKE LOWER(:productName) order by productName desc")
	                .setParameter("productName", productName)
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
	public List<Product> getProductPaging(Integer offset, Integer maxResult) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from Product p ORDER BY p.importDate DESC").
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
	public Long getTotalProduct() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("select count(*) from Product").list();
			return (Long) list.get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}


	@Override
	public List<Product> getProductByCateId(int cateId, Integer offset, Integer maxResult) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		   
		try {
	        List list = session.createQuery("FROM Product p WHERE p.categories.cateId = :cateId")
	        		.setParameter("cateId", cateId)
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
	public Long getTotalProductByCateId(int cateId) {
	    Session session = sessionFactory.openSession();
	    try {
	        Query query = session.createQuery("SELECT COUNT(*) FROM Product p WHERE p.categories.cateId = :cateId");
	        query.setParameter("cateId", cateId);
	        List list = query.list();
	        return (Long) list.get(0);
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        session.close();
	    }
	    return null;
	}

	@Override
	public List<Product> getTopNewProduct() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("SELECT p FROM Product p ORDER BY p.importDate DESC").list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<Product> getTopDiscountProduct() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("SELECT p FROM Product p WHERE p.discound > 0 ORDER BY p.discound DESC").list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public Long getTotalProductByName(String productName) {
		Session session = sessionFactory.openSession();
	    try {
	        if (productName == null || productName.length() == 0) {
	            productName = "%";
	        } else {
	            productName = "%" + productName + "%";
	        }

	        List list = session.createQuery("SELECT p FROM Product p WHERE LOWER(p.productName) LIKE LOWER(:productName) order by productName desc")
	                .setParameter("productName", productName)
	                .list();
	        long temp=0;
	        for (Object object : list) {
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
	public List<Product> getProductByCateId(int cateId) {
		Session session = sessionFactory.openSession();
		try {
			List<Product> list = session.createQuery("FROM Product p WHERE p.categories.cateId = :cateId")
					.setParameter("cateId", cateId)
					.list();
			return list;
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}


}
