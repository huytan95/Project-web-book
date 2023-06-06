package ProjectEnd.service.orderDetail;

import ProjectEnd.entities.Product;
import ProjectEnd.entities.OrderDetail;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public class OrderDetailDaoImpl implements OrderDetailDAO{
    @Autowired
    private SessionFactory sessionFactory;


    @Override
    public boolean insertOrderDetail(OrderDetail orderDetail) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.save(orderDetail);
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
    public List<OrderDetail> getListOrderByOrderId(int orderId) {
        Session session = sessionFactory.openSession();
        try {
            List list = session.createQuery("FROM OrderDetail o WHERE o.orders.orderId = :orderId")
                    .setParameter("orderId", orderId)
                    .list();
            return list;
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public List<OrderDetail> getTopListOrderDetail() {
        Session session = sessionFactory.openSession();
        try {
            List<OrderDetail> list = session.createQuery("SELECT od FROM OrderDetail od ORDER BY od.quantity DESC").list();
            Map<Product, Integer> productQuantityMap = new HashMap<>();

            for (OrderDetail orderDetail : list) {
                Product product = orderDetail.getProduct();
                int quantity = orderDetail.getQuantity();

                if (productQuantityMap.containsKey(product)) {
                    int totalQuantity = productQuantityMap.get(product) + quantity;
                    productQuantityMap.put(product, totalQuantity);
                }
                else {
                    productQuantityMap.put(product, quantity);
                }
            }

            List<OrderDetail> result = new ArrayList<>();

            for (Map.Entry<Product, Integer> entry : productQuantityMap.entrySet()) {
                Product product = entry.getKey();
                int totalQuantity = entry.getValue();

                OrderDetail newOrderDetail = new OrderDetail();
                newOrderDetail.setProduct(product);
                newOrderDetail.setQuantity(totalQuantity);
                result.add(newOrderDetail);
            }
            result.sort(Comparator.comparingInt(OrderDetail::getQuantity).reversed());

            return result;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public List<OrderDetail> getListOrderDetail() {
        Session session = sessionFactory.openSession();
        try {
            List<OrderDetail> list = session.createQuery("SELECT od FROM OrderDetail od ORDER BY od.quantity DESC").list();
            return list;
        } catch (Exception e){
            e.printStackTrace();
        }finally {
            session.close();
        }
        return null;
    }

}
