package ProjectEnd.entities;

import javax.persistence.*;

@Entity
@Table(name = "order_Detail")
public class OrderDetail {
    @Id
    @Column(name ="order_Detail_Id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer orderDetailId;

    @Column(name = "quantity")
    private int quantity;

    @Column(name = "unit_price")
    private int unitPrice;

    @ManyToOne
    @JoinColumn(name = "orderId", referencedColumnName = "orderId")
    private Orders orders;
    @ManyToOne
    @JoinColumn(name = "productId", referencedColumnName = "product_Id")
    private Product product;

    public OrderDetail() {
    }

    public OrderDetail(Integer orderDetailId, int quantity, int unitPrice, Orders orders, Product product) {
        this.orderDetailId = orderDetailId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.orders = orders;
        this.product = product;
    }

    public Integer getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(Integer orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(int unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
