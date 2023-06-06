package ProjectEnd.entities;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name ="orders")
public class Orders {
    @Id
    @Column(name = "orderId")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int orderId;
    @Column(name = "status")
    private int status;
    @Column(name ="OrderDate")
    private Date orderDate;
    @Column(name = "ShipAddress")
    private String shipAddress;
    @Column(name = "TotalPrice")
    private int totalPrice;
    @ManyToOne
    @JoinColumn(name = "userId", referencedColumnName = "id")
    private User user;

    @OneToMany(mappedBy = "orders")
    private Set<OrderDetail> orderDetails;
    public Orders() {
    }

    public Orders(int orderId, int status, Date orderDate, String shipAddress,
                  int totalPrice, User user, Set<OrderDetail> orderDetails) {
        this.orderId = orderId;
        this.status = status;
        this.orderDate = orderDate;
        this.shipAddress = shipAddress;
        this.totalPrice = totalPrice;
        this.user = user;
        this.orderDetails = orderDetails;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getShipAddress() {
        return shipAddress;
    }

    public void setShipAddress(String shipAddress) {
        this.shipAddress = shipAddress;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Set<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(Set<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }
}
