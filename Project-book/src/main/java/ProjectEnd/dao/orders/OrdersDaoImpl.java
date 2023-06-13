package ProjectEnd.dao.orders;

import ProjectEnd.entities.Orders;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrdersDaoImpl implements OrdersDAO{
    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public boolean insertOrders(Orders orders) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.save(orders);
            session.getTransaction().commit();
            return true;
        } catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return false;
    }

    @Override
    public List<Orders> getListOrderById(long userId, Integer offset, Integer maxResult) {
        Session session = sessionFactory.openSession();
        try {
            List list = session.createQuery("FROM Orders o WHERE o.user.id = :userId ORDER BY orderDate DESC")
                            .setFirstResult(offset)
                                    .setMaxResults(maxResult)
                                            .setParameter("userId", userId)
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
    public Long getTotalOrderByUserId(long userId) {
        Session session = sessionFactory.openSession();
        try {
            Query query = session.createQuery("SELECT COUNT(o) FROM Orders o WHERE o.user.id = :userId");
            query.setParameter("userId", userId);
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
    public boolean updateOrders(Orders orders) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.update(orders);
            session.getTransaction().commit();
            return true;
        } catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return false;
    }

    @Override
    public Orders getOrdersById(int orderId) {
        Session session = sessionFactory.openSession();
        try {
            Orders orders = session.get(Orders.class, orderId);
            return orders;
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            session.close();
        }
        return null;
    }

    @Override
    public List<Orders> getListOrder(Integer offset, Integer maxResult) {
        Session session = sessionFactory.openSession();
        try {
            List list = session.createQuery("FROM Orders ORDER BY orderDate DESC")
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
    public Long getTotalOrder() {
        Session session = sessionFactory.openSession();
        try {
            Query query = session.createQuery("SELECT COUNT(*) FROM Orders");
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
    public Orders getOrderById(Integer orderId) {
        Session session = sessionFactory.openSession();
        try {
            Orders orders = session.get(Orders.class, orderId);
            return orders;
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public List<Orders> getListOrderPerMonth(int month) {
        Session session = sessionFactory.openSession();
        try {
            List<Orders> list = session.createQuery("SELECT o FROM Orders o WHERE MONTH(o.orderDate) = :month")
                    .setParameter("month", month)
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
