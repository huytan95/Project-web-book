package ProjectEnd.Controller.UserController;

import ProjectEnd.entities.Product;
import ProjectEnd.entities.User;
import ProjectEnd.entities.Categories;
import ProjectEnd.entities.Comment;
import ProjectEnd.entities.contact;
import ProjectEnd.entities.imageInfor;
import ProjectEnd.dao.Product.ProductDAO;
import ProjectEnd.dao.User.userDAO;
import ProjectEnd.dao.categories.categoriesInterface;
import ProjectEnd.dao.comment.CommentDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@Controller
public class ProductController {
    @Autowired
    private categoriesInterface catInterface;
    @Autowired
    private ProjectEnd.dao.contact.contactDAO contactDAO;
    @Autowired
    private ProjectEnd.dao.contact.imageInforDAO imageInforDAO;
    @Autowired
    private ProductDAO productDAO;
    @Autowired
    private userDAO userDao;

    @Autowired
    private CommentDAO commentDao;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sf = new SimpleDateFormat("dd/MM/yyyy");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sf, true));
    }
    @RequestMapping("loadProductUser")
    public String loadProductUser(@RequestParam("cateId") Integer cateId,
                                  @RequestParam(name = "page", required = false) Integer page, Model model) {

        if (page == null || page <1)
            page = 1;
        int maxResult = 16;
        int offset = (page - 1) * maxResult;
        long totalProduct = productDAO.getTotalProductByCateId(cateId);
        int totalPages = (int) (totalProduct / maxResult + (totalProduct % maxResult == 0 ? 0 : 1));
        List<Product> ListProductByCateId = productDAO.getProductByCateId(cateId, offset, maxResult);
        model.addAttribute("ListProductByCateId", ListProductByCateId);
        List<Integer> listPage = new ArrayList();
        for (int i = 1; i <= totalPages; i++)
            listPage.add(i);
        model.addAttribute("listPage", listPage);
        int previous = page -1;
        int next = page +1;
        if(next>totalPages){
            next = totalPages;
        }
        model.addAttribute("next", next);
        model.addAttribute("previous",previous);
        Categories categories = catInterface.getCategoryById(cateId);
        contact contact = contactDAO.getInforById(1);
        imageInfor imageLogo = imageInforDAO.getImageInforById(1);
        imageInfor imageBanner = imageInforDAO.getImageInforById(3);
        List<Categories> listCate = catInterface.getCategories();

        model.addAttribute("ListProductByCateId", ListProductByCateId);
        model.addAttribute("listCate", listCate);
        model.addAttribute("categories", categories);
        model.addAttribute("contact", contact);
        model.addAttribute("imageLogo", imageLogo);
        model.addAttribute("imageBanner", imageBanner);
        return "User/ListProductUser";
    }
    @RequestMapping("productDetailUser")
    public String productDetailUser(@RequestParam("productId") Integer productId,
                                    HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        String role = userDao.getRoleUser(user);
        List<Comment> commentList = commentDao.getListCommentByProductId(productId);
        Product product = productDAO.getProductById(productId);
        List<Product> productList = productDAO.getProductByCateId(product.getCategories().getcateId());
        Collections.shuffle(productList);
        loadInfor(model);
        model.addAttribute("productList", productList);
        model.addAttribute("role", role);
        model.addAttribute("commentList", commentList);
        model.addAttribute("product", product);
        return "User/ProductDetailUser";
    }
    @RequestMapping("searchProductUser")
    public String searchProductUser(@RequestParam("productName") String productName, Model model,
                                    @RequestParam(name = "page", required = false) Integer page) {
        if(page==null||page<1)
            page = 1;
        int maxResult = 12;
        int offset = (page-1)*maxResult;

        long totalProductByName = productDAO.getTotalProductByName(productName);
        int totalPages = (int) (totalProductByName/maxResult+(totalProductByName%maxResult==0?0:1));

        List<Product> listProduct = productDAO.getProductByName(productName,offset,maxResult);
        List<Integer> listPage = new ArrayList();
        for(int i=1;i<=totalPages;i++)
            listPage.add(i);
        int previous = page -1;
        int next = page +1;
        if(next>totalPages){
            next = totalPages;
        }
        loadInfor(model);
        model.addAttribute("next", next);
        model.addAttribute("previous",previous);
        if(listProduct == null ) {
            model.addAttribute("Notification", "Không tìm thấy sản phẩm trùng khớp!");
        }
        model.addAttribute("nameSearch", productName);
        model.addAttribute("listPage", listPage);
        model.addAttribute("listProduct", listProduct);
        return "User/ProductSearchUser";
    }
    public void loadInfor(Model model) {
        contact contact = contactDAO.getInforById(1);
        List<Categories> listCate = catInterface.getCategories();
        imageInfor imageLogo = imageInforDAO.getImageInforById(1);
        imageInfor imageBanner = imageInforDAO.getImageInforById(2);
        model.addAttribute("imageLogo", imageLogo);
        model.addAttribute("imageBanner", imageBanner);
        model.addAttribute("listCate", listCate);
        model.addAttribute("contact", contact);
    }
}
