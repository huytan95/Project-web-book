package ProjectEnd.Controller.UserController;

import ProjectEnd.entities.Role;
import ProjectEnd.entities.User;
import ProjectEnd.entities.User_role;
import ProjectEnd.entities.Categories;
import ProjectEnd.entities.contact;
import ProjectEnd.entities.imageInfor;
import ProjectEnd.service.Role.roleDAO;
import ProjectEnd.service.User.userDAO;
import ProjectEnd.service.categories.categoriesInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.crypto.bcrypt.BCrypt;
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
import java.util.Date;
import java.util.List;

@Controller
public class UserController {
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

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sf = new SimpleDateFormat("dd/MM/yyyy");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sf, true));
    }
    @RequestMapping("insertUser")
    public String insertUser(@ModelAttribute("user") User user, Model model) {
        user.setEnabled(1);
        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));
        User_role userRole = new User_role();
        Role role = roleDao.getRoleById(2L);
        boolean bl = userDao.insertUser(user);
        if(bl) {
            userRole.setUser(user);
            userRole.setRole(role);
            roleUserDAO.insertRoleUser(userRole);
            return "redirect:/login";
        } else {
            model.addAttribute("err", "Tên đăng nhập đã tồn tại!");
            model.addAttribute("user", user);
            return "Register";
        }
    }
    @RequestMapping("updateInforUser")
    public String updateInforUser(@ModelAttribute("user")User user,
                                  HttpSession session, RedirectAttributes ra){
        boolean bl = userDao.updateUser(user);
        if(bl){
            session.setAttribute("user", user);
            return "redirect:/home";
        } else {
            ra.addAttribute("mess", "Thay đổi thông tin không thành công");
            return "redirect:/admin-preUpdateInforUser";
        }
    }
    @RequestMapping("preChangePasswordUser")
    public String preChangePasswordUser(@RequestParam(name = "err", required = false)String err, Model model){
        loadInfor(model);
        model.addAttribute("err", err);
        return "User/ConfirmChangePass";
    }
    @RequestMapping("ChangePasswordUser")
    public  String ChangePasswordUser(@RequestParam("password")String password,
                                      @RequestParam("oldPassword")String oldPass, HttpSession session, RedirectAttributes ra){
        User user = (User) session.getAttribute("user");
        if(BCrypt.checkpw(oldPass,user.getPassword())){
            user.setPassword(BCrypt.hashpw(password, BCrypt.gensalt(12)));
            boolean bl = userDao.updateUser(user);
            if(bl){
                ra.addAttribute("success","Thay mật khẩu thành công!");
                return "redirect:/login";
            }else {
                return "redirect:/home";
            }
        } else {
            ra.addAttribute("err","Mật khẩu không đúng");
            return "redirect:/preChangePasswordUser";
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
}
