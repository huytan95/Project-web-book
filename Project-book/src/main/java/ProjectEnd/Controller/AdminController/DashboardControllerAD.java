package ProjectEnd.Controller.AdminController;

import ProjectEnd.entities.User;
import ProjectEnd.entities.Categories;
import ProjectEnd.entities.Comment;
import ProjectEnd.entities.contact;
import ProjectEnd.entities.imageInfor;
import ProjectEnd.entities.News;
import ProjectEnd.entities.Orders;
import ProjectEnd.service.Product.ProductDAO;
import ProjectEnd.service.Role.roleDAO;
import ProjectEnd.service.User.userDAO;
import ProjectEnd.service.categories.categoriesInterface;
import ProjectEnd.service.comment.CommentDAO;
import ProjectEnd.service.news.NewsDAO;
import ProjectEnd.service.orderDetail.OrderDetailDAO;
import ProjectEnd.service.orders.OrdersDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class DashboardControllerAD {

    @Autowired
    private userDAO userDao;
    @Autowired
    private roleDAO roleDao;
    @Autowired
    private ProjectEnd.service.UserRole.roleUserDAO roleUserDAO;
    @Autowired
    private ProjectEnd.service.contact.contactDAO contactDAO;
    @Autowired
    private categoriesInterface catInterface;
    @Autowired
    private ProjectEnd.service.contact.imageInforDAO imageInforDAO;
    @Autowired
    private NewsDAO newsDao;
    @Autowired
    private ProductDAO productDAO;
    @Autowired
    private CommentDAO commentDao;
    @Autowired
    private OrderDetailDAO orderDetailDao;
    @Autowired
    private OrdersDAO ordersDao;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sf = new SimpleDateFormat("dd/MM/yyyy");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sf, true));
    }

    public void loadInfor(Model model) {
        contact contact = contactDAO.getInforById(1);
        List<Categories> listCate = catInterface.getCategories();
        imageInfor imageLogo = imageInforDAO.getImageInforById(1);
        model.addAttribute("imageLogo", imageLogo);
        model.addAttribute("listCate", listCate);
        model.addAttribute("contact", contact);
    }
    @RequestMapping("admin-dashboard")
    public String dashboard(HttpSession session, Model model) {
            Calendar calendar = Calendar.getInstance();
            int currentMonth = calendar.get(Calendar.MONTH) + 1;
            List<Orders> ordersList = ordersDao.getListOrderPerMonth(currentMonth);
            int totalOrder = 0;
            int totalPrice = 0;
            int totalOrderCancel = 0;
            int totalOrderSuccess = 0;
            for(Orders orders : ordersList){
                totalOrder++;
                if(orders.getStatus()!= 4){
                    totalPrice += orders.getTotalPrice();
                }

                if(orders.getStatus()==4){
                    totalOrderCancel++;
                }
                if(orders.getStatus()==3){
                    totalOrderSuccess++;
                }
            }
            List<Integer> months = new ArrayList<>();
            List<Integer> totalPrices = new ArrayList<>();
            for(int i = 1; i<=12; i++){
                int sum = 0;
                months.add(i);
                List<Orders> orders = ordersDao.getListOrderPerMonth(i);
                for (Orders orders1 : orders){
                    if(orders1.getStatus()!=4){
                        sum+=orders1.getTotalPrice();
                    }
                }
                totalPrices.add(sum);
            }

            model.addAttribute("currentTime", new Date());
            model.addAttribute("months", months);
            model.addAttribute("totalPrices", totalPrices);
            model.addAttribute("totalOrder", totalOrder);
            model.addAttribute("totalPrice", totalPrice);
            model.addAttribute("totalOrderCancel", totalOrderCancel);
            model.addAttribute("totalOrderSuccess", totalOrderSuccess);
            return "Admin/Dashboard";
        }

    @RequestMapping("getNews")
    public String getNews(@RequestParam(name = "page", required = false) Integer page, Model model) {
        if (page == null || page < 1)
            page = 1;
        int maxResult = 5;
        int offset = (page - 1) * maxResult;
        long totalNews = newsDao.getTotalNews();
        int totalPages = (int) (totalNews / maxResult + (totalNews % maxResult == 0 ? 0 : 1));
        List<News> listNews = newsDao.listNews(offset, maxResult);
        model.addAttribute("listNews", listNews);
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

        List<News> listTopNews = newsDao.getTopNewsByViews();
        List<News> listTop3News = new ArrayList<>();
        int temp = 0;
        for (News news : listTopNews) {
            temp++;
            listTop3News.add(news);
            if (temp >= 3) {
                break;
            }
        }
        model.addAttribute("listTop3News", listTop3News);
        loadInfor(model);
        return "User/News";
    }

    @RequestMapping("getNewsAdmin")
    public String getNewsAdmin(@RequestParam(name = "page", required = false) Integer page,
                               @RequestParam(name = "mess", required = false) String mess,
                               HttpSession session, Model model) {
            if (page == null || page < 1)
                page = 1;
            int maxResult = 16;
            int offset = (page - 1) * maxResult;
            long totalNews = newsDao.getTotalNews();
            int totalPages = (int) (totalNews / maxResult + (totalNews % maxResult == 0 ? 0 : 1));
            List<News> listNews = newsDao.listNews(offset, maxResult);
            model.addAttribute("listNews", listNews);
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

            model.addAttribute("listNews", listNews);
            model.addAttribute("mess", mess);
            loadInfor(model);
            return "Admin/NewsAdmin";
    }

    @RequestMapping("preInsertNews")
    public String preInsertNews(Model model) {
        News news = new News();
        model.addAttribute("news", news);
        return "Admin/InsertNews";
    }

    @RequestMapping("insertNews")
    public String insertNews(@ModelAttribute("news") News news, Model model,
                             @RequestParam(name = "newsImageName") MultipartFile newsImageName, HttpServletRequest request) {
        String path = request.getServletContext().getRealPath("sources/img");
        File imagePath = new File(path);
        File destination = new File(imagePath.getAbsolutePath() + "/" + newsImageName.getOriginalFilename());
        if (!destination.exists()) {
            try {
                Files.write(destination.toPath(), newsImageName.getBytes(), StandardOpenOption.CREATE);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        String imageFileName = newsImageName.getOriginalFilename();
        news.setNewsImage(imageFileName);
        news.setNewsViews(0);
        boolean bl = newsDao.insertNews(news);
        if (bl) {
            return "redirect:/getNewsAdmin";
        } else {
            model.addAttribute("news", news);
            return "Admin/InsertNews";
        }
    }

    @RequestMapping("newsDetail")
    public String newsDetail(@RequestParam("newsId") Integer newsId, Model model) {
        News news = newsDao.getNewsById(newsId);
        List<News> listTopNews = newsDao.getTopNewsByViews();
        List<News> listTop3News = new ArrayList<>();
        int temp = 0;
        for (News news1 : listTopNews) {
            temp++;
            listTop3News.add(news1);
            if (temp >= 3) {
                break;
            }
        }
        news.setNewsViews(news.getNewsViews() + 1);
        newsDao.updateNews(news);
        model.addAttribute("listTop3News", listTop3News);
        loadInfor(model);
        model.addAttribute("news", news);
        return "User/NewsDetail";
    }

    @RequestMapping("preUpdateNews")
    public String preUpdateNews(@RequestParam("newsId") Integer newsId, Model model) {
        News news = newsDao.getNewsById(newsId);
        model.addAttribute("news", news);
        loadInfor(model);
        return "Admin/UpdateNews";
    }

    @RequestMapping("updateNews")
    public String updateNews(@ModelAttribute("news") News news, Model model,
                             @RequestParam(name = "newsImageName") MultipartFile newsImageName, HttpServletRequest request) {
        if(newsImageName.getSize() == 0){
            news.setNewsImage(newsDao.getNewsById(news.getNewsId()).getNewsImage());
            newsDao.updateNews(news);
        } else {
            String path = request.getServletContext().getRealPath("sources/img");
            File imagePath = new File(path);
            File destination = new File(imagePath.getAbsolutePath() + "/" + newsImageName.getOriginalFilename());
            if (!destination.exists()) {
                try {
                    Files.write(destination.toPath(), newsImageName.getBytes(), StandardOpenOption.CREATE);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            String imageFileName = newsImageName.getOriginalFilename();
            news.setNewsImage(imageFileName);
            boolean bl = newsDao.updateNews(news);
            if (bl) {
                return "redirect:/getNewsAdmin";
            } else {
                model.addAttribute("news", news);
                return "Admin/UpdateNews";
            }
        }
        return "redirect:/getNewsAdmin";
    }

    @RequestMapping("deleteNews")
    public String deleteNews(@RequestParam("newsId") Integer newsId, RedirectAttributes ra) {
        boolean bl = newsDao.deleteNews(newsId);
        if (bl) {
            ra.addAttribute("mess", "Xóa tin thành công");
            return "redirect:/getNewsAdmin";
        } else {
            ra.addAttribute("mess", "Xóa tin không thành công");
            return "redirect:/getNewsAdmin";
        }
    }

    @RequestMapping("searchNews")
    public String searchNews(@RequestParam("newsTitle") String newsTitle,
                             @RequestParam(name = "page", required = false) Integer page,
                             HttpSession session, Model model) {
            if (page == null || page < 1)
                page = 1;
            int maxResult = 10;
            int offset = (page - 1) * maxResult;
            long totalNews = newsDao.getTotalNewsByTitle(newsTitle);
            int totalPages = (int) (totalNews / maxResult + (totalNews % maxResult == 0 ? 0 : 1));
            List<Integer> listPage = new ArrayList();
            for (int i = 1; i <= totalPages; i++)
                listPage.add(i);
            model.addAttribute("listPage", listPage);
            int previous = page - 1;
            int next = page + 1;
            if (next > totalPages) {
                next = totalPages;
            }
            List<News> listNews = newsDao.searchNews(newsTitle, offset, maxResult);
            if (listNews.size() != 0) {
                model.addAttribute("listNews", listNews);
            } else {
                model.addAttribute("mess", "Không có sản phẩm trùng khớp");
                return "Admin/NewsAdmin";
            }

            model.addAttribute("next", next);
            model.addAttribute("previous", previous);
            model.addAttribute("nameSearch", newsTitle);

            return "Admin/NewsAdmin";
    }

    @RequestMapping("admin/newsDetailAdmin")
    public String newsDetailAdmin(@RequestParam("newsId") Integer newsId, Model model) {
        News news = newsDao.getNewsById(newsId);
        model.addAttribute("news", news);
        return "Admin/NewsDetailAdmin";
    }

    @RequestMapping("insertComment")
    public String insertComment(@RequestParam("commentContent") String commentContent,
                                @RequestParam("productId") Integer productId,
                                RedirectAttributes ra,
                                HttpSession session, Model model) {
        Comment comment = new Comment();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        } else {
            comment.setCommentContent(commentContent);
            comment.setUser(user);
            comment.setCommentDate(new Date());
            comment.setProduct(productDAO.getProductById(productId));
            commentDao.insertComment(comment);
            ra.addAttribute("productId", productId);
            return "redirect:/productDetailUser";
        }
    }

    @RequestMapping("listCommentAdmin")
    public String listCommentAdmin(@RequestParam(name = "page", required = false) Integer page,Model model) {
        if (page == null || page < 1)
            page = 1;
        int maxResult = 15;
        int offset = (page - 1) * maxResult;
        long totalNews = newsDao.getTotalNews();
        int totalPages = (int) (totalNews / maxResult + (totalNews % maxResult == 0 ? 0 : 1));
        List<Comment> listComment = commentDao.getListComment(offset, maxResult);
        model.addAttribute("listComment", listComment);
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

        return "Admin/ListCommentAdmin";
    }

    @RequestMapping("admin/deleteComment")
    public String deleteComment(@RequestParam("commentId")Integer commentId, HttpSession session,
                                RedirectAttributes ra, Model model){
            boolean bl = commentDao.deleteComment(commentId);
            if(bl){
                ra.addAttribute("mess", "Xóa bình luận thành công");
                return "redirect:/listCommentAdmin";
            } else {
                ra.addAttribute("mess", "Xóa bình luận không thành công");
                return "redirect:/listCommentAdmin";
            }
    }
    @RequestMapping("deleteCmt")
    public String deleteCmt (@RequestParam("commentId")Integer commentId, RedirectAttributes ra){
        ra.addAttribute("productId", commentDao.getCommentById(commentId).getProduct().getProductId());
        boolean bl = commentDao.deleteComment(commentId);
            return "redirect:/productDetailUser";
    }
}
