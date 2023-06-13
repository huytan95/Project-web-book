package ProjectEnd.Controller.UserController;

import ProjectEnd.entities.User;
import ProjectEnd.entities.Authentication;
import ProjectEnd.entities.Categories;
import ProjectEnd.entities.contact;
import ProjectEnd.entities.imageInfor;
import ProjectEnd.dao.User.userDAO;
import ProjectEnd.dao.authentication.AuthenticationDao;
import ProjectEnd.dao.categories.categoriesInterface;
import ProjectEnd.dao.contact.contactDAO;
import ProjectEnd.dao.contact.imageInforDAO;
import ProjectEnd.dao.mail.MailAutoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Random;

@Controller
public class AuthenticationController {
    @Autowired
    private AuthenticationDao authCodeDao;
    @Autowired
    private userDAO userDao;
    @Autowired
    private JavaMailSender javaMailSender;
    @Autowired
    private MailAutoDao mailAutoDao;
    @Autowired
    private contactDAO contactDAO;
    @Autowired
    private categoriesInterface catInterface;
    @Autowired
    private imageInforDAO imageInforDAO;

    @RequestMapping("ForgotPassword")
    public String AuthenticationCode(@RequestParam(value = "err", required = false)String err, Model model){
        contact contact = contactDAO.getInforById(1);
        List<Categories> listCate = catInterface.getCategories();
        imageInfor imageLogo = imageInforDAO.getImageInforById(1);
        model.addAttribute("contact", contact);
        model.addAttribute("listCate",listCate);
        model.addAttribute("imageLogo", imageLogo);
        model.addAttribute("err", err);
        return "User/ForgotPassword";
    }
    @RequestMapping("checkUser")
    public String checkUser (@RequestParam("userName")String userName,
                               HttpSession session, RedirectAttributes ra, Model model) {
        contact contact = contactDAO.getInforById(1);
        List<Categories> listCate = catInterface.getCategories();
        imageInfor imageLogo = imageInforDAO.getImageInforById(1);
        model.addAttribute("contact", contact);
        model.addAttribute("listCate", listCate);
        model.addAttribute("imageLogo", imageLogo);
        User user = userDao.findByUserName(userName);
        session.setAttribute("userChange", user);
        Random rd = new Random();
        if (user != null) {
            if (user.getEnabled() == 1) {
                int number = rd.nextInt(999999)+100000;
                String code = number+"";
                Authentication authentication = authCodeDao.getAuthByUserId(user.getId());
                if(authentication != null ){
                    authentication.setCode(code);
                    authCodeDao.updateAuthCode(authentication);
                } else {
                    Authentication authentication1 = new Authentication();
                    authentication1.setCode(code);
                    authentication1.setUser(user);
                    authCodeDao.insertAuthCode(authentication1);
                }
                Thread thread = new Thread(new Runnable() {
                    @Override
                    public void run() {
                        sendMail(user.getEmail(), mailAutoDao.getMailById(3).getMailType(), mailAutoDao.getMailById(3).getMailContent() + code);
                    }
                });
                thread.start();
                return "redirect:/preAuthenticationCode";
            } else {
                ra.addAttribute("err","Tài khoản bị khóa, không thể thay đổi mật khẩu");
                return "redirect:/login";
            }
        } else {
            ra.addAttribute("err", "Tài khoản không tồn tại!");
            return "redirect:/ForgotPassword";
        }
    }
    @RequestMapping("preAuthenticationCode")
    public String authenticationCode(@RequestParam(value = "err", required = false)String err,Model model){
        contact contact = contactDAO.getInforById(1);
        List<Categories> listCate = catInterface.getCategories();
        imageInfor imageLogo = imageInforDAO.getImageInforById(1);
        model.addAttribute("contact", contact);
        model.addAttribute("listCate",listCate);
        model.addAttribute("imageLogo", imageLogo);
        model.addAttribute("err", err);
        return "User/AuthenticationCode";
    }
    @RequestMapping("authenticationCode")
    public String authenticationCode(@RequestParam("codeNumber") String codeNumber,
                                    HttpSession session, RedirectAttributes ra, Model model){
        User user = (User) session.getAttribute("userChange");
        Authentication authentication = authCodeDao.getAuthByUserId(user.getId());
        String codeData = authentication.getCode();
        if(codeNumber.equals(codeData)){
            return "redirect:/preChangePassWord";
        } else {
            ra.addAttribute("err","Mã không trùng khớp!");

            return "redirect:/preAuthenticationCode";
        }
    }
    @RequestMapping("preChangePassWord")
    public String changePassWord(Model model){
        contact contact = contactDAO.getInforById(1);
        List<Categories> listCate = catInterface.getCategories();
        imageInfor imageLogo = imageInforDAO.getImageInforById(1);
        model.addAttribute("contact", contact);
        model.addAttribute("listCate",listCate);
        model.addAttribute("imageLogo", imageLogo);
        return "User/ChangePassword";
    }
    @RequestMapping("ChangePassword")
    public String ChangePassword(@RequestParam("password")String password,
                                 RedirectAttributes ra,HttpSession session,Model model){
        User userChange = (User) session.getAttribute("userChange");
        userChange.setPassword(BCrypt.hashpw(password, BCrypt.gensalt(12)));
        boolean bl = userDao.updateUser(userChange);
        if(bl){
            ra.addAttribute("success","Thay mật khẩu thành công!");
            return "redirect:/login";
        }else {
            ra.addAttribute("err","Thay mật khẩu không thành công!");
            return "redirect:/preChangePassWord";
        }
    }

    public void sendMail(String to, String subject, String content){
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(to);
        mailMessage.setSubject(subject);
        mailMessage.setText(content);

        javaMailSender.send(mailMessage);
    }
}
