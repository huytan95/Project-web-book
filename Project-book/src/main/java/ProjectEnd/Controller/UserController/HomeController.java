package ProjectEnd.Controller.UserController;

import ProjectEnd.entities.Product;
import ProjectEnd.entities.User;
import ProjectEnd.entities.Categories;
import ProjectEnd.entities.contact;
import ProjectEnd.entities.imageInfor;
import ProjectEnd.entities.OrderDetail;
import ProjectEnd.service.Product.ProductDAO;
import ProjectEnd.service.categories.categoriesInterface;
import ProjectEnd.service.contact.contactDAO;
import ProjectEnd.service.contact.imageInforDAO;
import ProjectEnd.service.orderDetail.OrderDetailDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class HomeController {
    @Autowired
    private contactDAO contactDAO;
    @Autowired
    private categoriesInterface catInterface;
    @Autowired
    private imageInforDAO imageInforDAO;
    @Autowired
    private ProductDAO productDAO;
    @Autowired
    private OrderDetailDAO orderDetailDao;

    @RequestMapping(value = {"/home", "/"})
    public String home(HttpSession session, Model model) {
        contact contact = contactDAO.getInforById(1);
        List<Categories> listCate = catInterface.getCategories();
        imageInfor imageLogo = imageInforDAO.getImageInforById(1);
        imageInfor imageBanner = imageInforDAO.getImageInforById(2);
        List<Product> listTopNewProduct = new ArrayList<>();
        List<Product> listTopDiscountProduct = new ArrayList<>();
        List<OrderDetail> listTopSale = new ArrayList<>();
        List<Product> listNewProduct = productDAO.getTopNewProduct();
        List<Product> listDiscountProduct = productDAO.getTopDiscountProduct();
        List<OrderDetail> listOrderDetail = orderDetailDao.getTopListOrderDetail();
        int temp = 0;
        for (Product product : listNewProduct) {
            temp++;
            listTopNewProduct.add(product);
            if (temp >= 8) {
                break;
            }
        }
        temp = 0;
        for (Product product : listDiscountProduct) {
            temp++;
            listTopDiscountProduct.add(product);
            if (temp >= 8) {
                break;
            }
        }
        temp = 0;
        for (OrderDetail orderDetail : listOrderDetail){
            temp++;
            listTopSale.add(orderDetail);
            if (temp>=8){
                break;
            }
        }
        User user = (User) session.getAttribute("user");
        model.addAttribute("user", user);
        model.addAttribute("listTopNewProduct", listTopNewProduct);
        model.addAttribute("listTopDiscountProduct", listTopDiscountProduct);
        model.addAttribute("listTopSale", listTopSale);
        model.addAttribute("imageLogo", imageLogo);
        model.addAttribute("imageBanner", imageBanner);
        model.addAttribute("listCate", listCate);
        model.addAttribute("contact", contact);

        List<OrderDetail> orderDetailList = (List<OrderDetail>) session.getAttribute("orderDetailList");
        int totalQuantity = 0;
        if(orderDetailList == null){
            orderDetailList = new ArrayList<>();
            session.setAttribute("orderDetailList", orderDetailList);
            totalQuantity = 0;
        } else {
            for(OrderDetail orderDetail : orderDetailList){
                totalQuantity+=orderDetail.getQuantity();
            }
        }

        session.setAttribute("totalQuantity", totalQuantity);

        return "User/home";
    }

}
