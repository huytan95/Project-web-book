package ProjectEnd.Controller.AdminController;

import ProjectEnd.entities.Categories;
import ProjectEnd.entities.contact;
import ProjectEnd.entities.imageInfor;
import ProjectEnd.entities.OrderDetail;
import ProjectEnd.entities.Orders;
import ProjectEnd.dao.Product.ProductDAO;
import ProjectEnd.dao.User.userDAO;
import ProjectEnd.dao.categories.categoriesInterface;
import ProjectEnd.dao.contact.contactDAO;
import ProjectEnd.dao.contact.imageInforDAO;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class CartControllerAD {
    @Autowired
    private ProductDAO productDao;
    @Autowired
    private contactDAO contactDAO;
    @Autowired
    private categoriesInterface catInterface;
    @Autowired
    private imageInforDAO imageInforDAO;
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


    @RequestMapping("admin-listOderAdmin")
    public String listOderAdmin(@RequestParam(name = "page", required = false) Integer page,
                                @RequestParam(value = "mess", required = false)String mess,
                                HttpSession session, Model model) {
            if (page == null || page < 1)
                page = 1;
            int maxResult = 16;
            int offset = (page - 1) * maxResult;
            long TotalOrder = ordersDao.getTotalOrder();
            int totalPages = (int) (TotalOrder / maxResult + (TotalOrder % maxResult == 0 ? 0 : 1));
            List<Orders> ordersList = ordersDao.getListOrder(offset, maxResult);
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
            model.addAttribute("mess", mess);
            model.addAttribute("next", next);
            model.addAttribute("previous", previous);
            return "Admin/ListOrderAdmin";
    }
    @RequestMapping("admin-orderDetailAdmin")
    public String orderDetailAdmin(@RequestParam("orderId")Integer orderId,
                                   HttpSession session, Model model){
            List<OrderDetail> orderDetailList = orderDetailDao.getListOrderByOrderId(orderId);
            int totalPrice = 0;
            for (OrderDetail orderDetail : orderDetailList) {
                totalPrice += orderDetail.getUnitPrice() * orderDetail.getQuantity();
            }
            model.addAttribute("totalPrice", totalPrice);
            model.addAttribute("orderDetailList",orderDetailList);
            loadInfor(model);
            return "Admin/OrderDetailAdmin";
    }

    @RequestMapping("admin-preUpdateStatusOrder")
    public String preUpdateStatusOrder(@RequestParam("orderId") Integer orderId, Model model){
        Orders orders = ordersDao.getOrdersById(orderId);
        model.addAttribute("orders", orders);
        return "Admin/UpdateStatusOrder";
    }
    @RequestMapping("admin-updateStatusOder")
    public String updateStatusOder(@ModelAttribute("orders") Orders orders,
                                   RedirectAttributes ra, Model model){
        boolean bl = ordersDao.updateOrders(orders);
        if(bl){
            ra.addAttribute("mess", "Cập nhật trạng thái thành công");
        }else{
            ra.addAttribute("mess", "Cập nhật trạng thái không thành công");
        }
        return "redirect:/admin-listOderAdmin";
    }
    @RequestMapping("admin-searchOrderById")
    public  String searchOrderById (@RequestParam("orderId")String orderId,
                                    RedirectAttributes ra, Model model){
        List<Orders> ordersList = new ArrayList<>();
        if(orderId == null|| orderId == ""){
            return "redirect:/admin-listOderAdmin";
        } else {
            Orders orders = ordersDao.getOrderById(Integer.parseInt(orderId));
            if(orders == null ){
                ra.addAttribute("mess", "Mã đơn hàng không tồn tại");
                return "redirect:/admin-listOderAdmin";
            } else {
                ordersList.add(orders);
                model.addAttribute("ordersList", ordersList);
                return "Admin/ListOrderAdmin";
            }
        }
    }
    public void sendMail(String to, String subject, String content){
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(to);
        mailMessage.setSubject(subject);
        mailMessage.setText(content);
        javaMailSender.send(mailMessage);
    }
    public void loadInfor(Model model){
        contact contact = contactDAO.getInforById(1);
        List<Categories> listCate = catInterface.getCategories();
        imageInfor imageLogo = imageInforDAO.getImageInforById(1);
        model.addAttribute("imageLogo", imageLogo);
        model.addAttribute("listCate", listCate);
        model.addAttribute("contact", contact);
    }
}
