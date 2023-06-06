package ProjectEnd.service.orderDetail;

import ProjectEnd.entities.OrderDetail;

import java.util.List;

public interface OrderDetailDAO {
    public boolean insertOrderDetail(OrderDetail orderDetail);
    public List<OrderDetail> getListOrderByOrderId(int orderId);
    public List<OrderDetail> getTopListOrderDetail();
    public List<OrderDetail> getListOrderDetail();
}
