package ProjectEnd.Controller.UserController;

import ProjectEnd.entities.Product;
import ProjectEnd.entities.User;
import ProjectEnd.entities.Categories;
import ProjectEnd.entities.contact;
import ProjectEnd.entities.imageInfor;
import ProjectEnd.entities.OrderDetail;
import ProjectEnd.entities.Orders;
import ProjectEnd.dao.Product.ProductDAO;
import ProjectEnd.dao.User.userDAO;
import ProjectEnd.dao.categories.categoriesInterface;
import ProjectEnd.dao.mail.MailAutoDao;
import ProjectEnd.dao.orderDetail.OrderDetailDAO;
import ProjectEnd.dao.orders.OrdersDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class CartController {
    @Autowired
    private ProductDAO productDao;
    @Autowired
    private ProjectEnd.dao.contact.contactDAO contactDAO;
    @Autowired
    private categoriesInterface catInterface;
    @Autowired
    private ProjectEnd.dao.contact.imageInforDAO imageInforDAO;
    @Autowired
    private OrderDetailDAO orderDetailDao;
    @Autowired
    private OrdersDAO ordersDao;
    @Autowired
    private JavaMailSender javaMailSender;
    @Autowired
    private MailAutoDao mailAutoDao;
    @Autowired
    private userDAO userDao;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sf = new SimpleDateFormat("dd/MM/yyyy");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sf, true));
    }
    @RequestMapping("addToCart")
    public String addToCart(@RequestParam("productId") Integer productId,
                            @RequestParam("quantity") Integer quantity,
                            HttpSession session, RedirectAttributes ra, Model model) {

        Integer totalQuantity = (Integer) session.getAttribute("totalQuantity");
        if (totalQuantity == null || totalQuantity == 0) {
            totalQuantity = quantity;
        } else {
            totalQuantity += quantity;
        }
        session.setAttribute("totalQuantity", totalQuantity);
        List<OrderDetail> orderDetailList = new ArrayList<>();
        Product p = productDao.getProductById(productId);
        if (session.getAttribute("orderDetailList") == null) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setProduct(p);
            orderDetail.setQuantity(quantity);
            orderDetail.setUnitPrice(p.getPriceOutput() * (100 - p.getDiscound()) / 100);
            orderDetailList.add(orderDetail);
            session.setAttribute("orderDetailList", orderDetailList);
        } else {
            int temp = 0;
            orderDetailList = (List<OrderDetail>) session.getAttribute("orderDetailList");
            for (OrderDetail orderDetail : orderDetailList) {
                if (orderDetail.getProduct().getProductId() == productId) {
                    quantity = quantity + orderDetail.getQuantity();
                    orderDetail.setQuantity(quantity);
                    temp++;
                    break;
                }
            }
            if (temp == 0) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setProduct(p);
                orderDetail.setQuantity(quantity);
                orderDetail.setUnitPrice(p.getPriceOutput() * (100 - p.getDiscound()) / 100);
                orderDetailList.add(orderDetail);
            }
            session.setAttribute("orderDetailList", orderDetailList);
        }
        ra.addAttribute("productId", productId);
        return "redirect:/productDetailUser";
    }

    @RequestMapping("listCart")
    public String listCart(HttpSession session, Model model) {
        loadInfor(model);
        int totalPrice = 0;
        List<OrderDetail> orderDetailList = (List<OrderDetail>) session.getAttribute("orderDetailList");
        if (orderDetailList.size() == 0) {
            int totalProduct = 0;
            model.addAttribute("totalProduct", totalProduct);
        } else {
            for (OrderDetail orderDetail : orderDetailList) {
                totalPrice = totalPrice + orderDetail.getQuantity() * orderDetail.getUnitPrice();
            }
            model.addAttribute("totalPrice", totalPrice);
        }
        return "User/Cart";
    }

    @RequestMapping("removeProductCart")
    public String removeProductCart(@RequestParam("productId") Integer productId,
                                    HttpSession session) {
        List<OrderDetail> orderDetailList = (List<OrderDetail>) session.getAttribute("orderDetailList");
        Integer totalQuantity = (Integer) session.getAttribute("totalQuantity");
        for (OrderDetail orderDetail : orderDetailList) {
            if (orderDetail.getProduct().getProductId() == productId) {
                orderDetailList.remove(orderDetail);
                totalQuantity -= orderDetail.getQuantity();
                break;
            }
        }
        session.setAttribute("totalQuantity", totalQuantity);
        session.setAttribute("orderDetailList", orderDetailList);
        return "redirect:/listCart";
    }

    @RequestMapping("productPlus")
    public String productPlus(@RequestParam("productId") Integer productId, HttpSession session) {
        List<OrderDetail> orderDetailList = (List<OrderDetail>) session.getAttribute("orderDetailList");
        Integer totalQuantity = (Integer) session.getAttribute("totalQuantity");
        for (OrderDetail orderDetail : orderDetailList) {
            if (orderDetail.getProduct().getProductId() == productId) {
                orderDetail.setQuantity(orderDetail.getQuantity() + 1);
                totalQuantity += 1;
                break;
            }
        }
        session.setAttribute("totalQuantity", totalQuantity);
        session.setAttribute("orderDetailList", orderDetailList);
        return "redirect:/listCart";
    }

    @RequestMapping("productMinus")
    public String productMinus(@RequestParam("productId") Integer productId, HttpSession session) {
        List<OrderDetail> orderDetailList = (List<OrderDetail>) session.getAttribute("orderDetailList");
        Integer totalQuantity = (Integer) session.getAttribute("totalQuantity");
        for (OrderDetail orderDetail : orderDetailList) {
            if (orderDetail.getProduct().getProductId() == productId) {
                orderDetail.setQuantity(orderDetail.getQuantity() - 1);
                totalQuantity -= 1;
                break;
            }
        }
        session.setAttribute("totalQuantity", totalQuantity);
        session.setAttribute("orderDetailList", orderDetailList);
        return "redirect:/listCart";
    }

    @RequestMapping("preCheckOut")
    public String preCheckOut(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        int shipPrice = 40000;
        int totalPrice = 0;
        List<OrderDetail> orderDetailList = (List<OrderDetail>) session.getAttribute("orderDetailList");
        for (OrderDetail orderDetail : orderDetailList) {
            totalPrice = totalPrice + orderDetail.getQuantity() * orderDetail.getUnitPrice();
        }
        int totalPriceOrder = totalPrice + shipPrice;
        model.addAttribute("totalPriceOrder", totalPriceOrder);
        model.addAttribute("shipPrice", shipPrice);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("user", user);
        loadInfor(model);
        return "User/CheckOut";
    }

    @RequestMapping("checkOut")
    public String checkOut(HttpSession session, Model model) {
        Orders orders = new Orders();
        List<OrderDetail> orderDetailList = (List<OrderDetail>) session.getAttribute("orderDetailList");
        User user = (User) session.getAttribute("user");
        int totalPrice = 0;
        for (OrderDetail orderDetail : orderDetailList) {
            totalPrice = totalPrice + orderDetail.getUnitPrice() * orderDetail.getQuantity();
        }
        int shipPrice = 40000;
        int totalPriceOrder = totalPrice + shipPrice;
        if (orderDetailList.size() != 0) {
            orders.setShipAddress(user.getAddress());
            orders.setUser(user);
            orders.setStatus(1);
            orders.setTotalPrice(totalPriceOrder);
            LocalDate currentDate = LocalDate.now();
            orders.setOrderDate(java.sql.Date.valueOf(currentDate));
        }
        boolean bl = ordersDao.insertOrders(orders);
        if (bl) {
            int temp = 0;
            for (OrderDetail orderDetail : orderDetailList) {
                orderDetail.setOrders(orders);
                boolean check = orderDetailDao.insertOrderDetail(orderDetail);
                if(check){
                    temp++;
                }
            }

            if (temp == orderDetailList.size()) {
                for (OrderDetail orderDetail : orderDetailList){
                    Product product = orderDetail.getProduct();
                    int quantityToReduce = orderDetail.getQuantity();
                    int currentQuantity = product.getQuantityProduct();
                    if (currentQuantity >= quantityToReduce) {
                        product.setQuantityProduct(currentQuantity - quantityToReduce);
                        productDao.updateProduct(product);
                    }
                }
                orderDetailList.clear();
                session.setAttribute("orderDetailList", orderDetailList);
            }
        }
        if (orderDetailList.size() == 0) {
            Thread thread = new Thread(new Runnable() {
                @Override
                public void run() {
                    sendMail(user.getEmail(), mailAutoDao.getMailById(2).getMailType(), mailAutoDao.getMailById(2).getMailContent());
                }
            });
            thread.start();
            return "redirect:/home";
        } else {
            return "redirect:/listCart";
        }
    }

    @RequestMapping("listOder")
    public String listOder(@RequestParam(name = "page", required = false) Integer page,
                           @RequestParam(name = "message", required = false) String message,
                           HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        } else {
            if (page == null || page < 1)
                page = 1;
            int maxResult = 16;
            int offset = (page - 1) * maxResult;
            long TotalOrder = ordersDao.getTotalOrderByUserId(user.getId());
            int totalPages = (int) (TotalOrder / maxResult + (TotalOrder % maxResult == 0 ? 0 : 1));
            List<Orders> ordersList = ordersDao.getListOrderById(user.getId(), offset, maxResult);
            model.addAttribute("ordersList", ordersList);
            List<Integer> listPage = new ArrayList();
            for (int i = 1; i <= totalPages; i++)
                listPage.add(i);
            model.addAttribute("listPage", listPage);
            int previous = page - 1;
            int next = page + 1;
            if (next > totalPages) {
                next = totalPages;
            }
            model.addAttribute("next", next);
            model.addAttribute("previous", previous);
            loadInfor(model);
            model.addAttribute("message", message);
            return "User/ListOrderUser";
        }

    }

    @RequestMapping("disable")
    public String disable(@RequestParam("orderId") Integer orderId,
                          RedirectAttributes ra) {
        Orders orders = ordersDao.getOrdersById(orderId);
        orders.setStatus(4);
        boolean bl = ordersDao.updateOrders(orders);
        if (bl) {
            ra.addAttribute("message", "Hủy đơn hàng thành công");
            return "redirect:/listOder";
        } else {
            ra.addAttribute("message", "Hủy đơn hàng không thành công");
            return "redirect:/listOder";
        }
    }

    @RequestMapping("orderDetailUser")
    public String orderDetailUser(@RequestParam("orderId") Integer orderId, Model model,
                                  HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        } else {
            List<OrderDetail> orderDetailList = orderDetailDao.getListOrderByOrderId(orderId);
            int totalPrice = 0;
            for (OrderDetail orderDetail : orderDetailList) {
                totalPrice += orderDetail.getUnitPrice() * orderDetail.getQuantity();
            }
            model.addAttribute("totalPrice", totalPrice);
            model.addAttribute("orderDetailList", orderDetailList);
            loadInfor(model);

            return "User/OrderDetailUser";
        }
    }
    public void loadInfor(Model model){
        contact contact = contactDAO.getInforById(1);
        List<Categories> listCate = catInterface.getCategories();
        imageInfor imageLogo = imageInforDAO.getImageInforById(1);
        model.addAttribute("imageLogo", imageLogo);
        model.addAttribute("listCate", listCate);
        model.addAttribute("contact", contact);
    }
    public void sendMail(String to, String subject, String content){
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(to);
        mailMessage.setSubject(subject);
        mailMessage.setText(content);
        javaMailSender.send(mailMessage);
    }
}
