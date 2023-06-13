package ProjectEnd.dao.orders;

import ProjectEnd.entities.Orders;

import java.util.List;

public interface OrdersDAO {
    public boolean insertOrders(Orders orders);
    public List<Orders> getListOrderById(long userId, Integer offset, Integer maxResult);
    public Long getTotalOrderByUserId(long userId);
    public boolean updateOrders(Orders orders);
    public Orders getOrdersById(int orderId);
    public List<Orders> getListOrder(Integer offset, Integer maxResult);
    public Long getTotalOrder();
    public Orders getOrderById(Integer orderId);
    public List<Orders> getListOrderPerMonth(int month);

}
