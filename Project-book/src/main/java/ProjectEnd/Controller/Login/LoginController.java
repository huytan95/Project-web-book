package ProjectEnd.Controller.Login;

import java.util.List;

import ProjectEnd.entities.User;
import ProjectEnd.entities.imageInfor;
import ProjectEnd.service.User.userDAO;
import ProjectEnd.service.contact.imageInforDAO;
import ProjectEnd.service.customUserDetailService.CustomUserDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ProjectEnd.entities.Categories;
import ProjectEnd.entities.contact;
import ProjectEnd.service.categories.categoriesInterface;
import ProjectEnd.service.contact.contactDAO;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
	@Autowired
	private contactDAO contactDAO;
	@Autowired
	private categoriesInterface catInterface;
	@Autowired
	private imageInforDAO imageInforDAO;
	@Autowired
	private userDAO userDao;

	@Autowired
	private CustomUserDetailService customUserDetailService;

	@RequestMapping("login")
	public String loadinfor(@RequestParam(value = "err", required = false)String err,
							@RequestParam(value = "success", required = false)String success,
							HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if(user != null){
			if(userDao.getRoleUser(user).equals("Admin")){
				return "redirect:/admin-dashboard";
			}
			return "redirect:/home";
		}
		imageInfor imageLogo = imageInforDAO.getImageInforById(1);
		contact contact = contactDAO.getInforById(1);
		List<Categories> listCate = catInterface.getCategories();
		model.addAttribute("listCate", listCate);
		model.addAttribute("success", success);
		model.addAttribute("contact", contact);
		model.addAttribute("imageLogo", imageLogo);
		model.addAttribute("err",err);
		return "Login";
	}
	@RequestMapping(value = {"login"}, method = RequestMethod.POST)
	public String login (@RequestParam("username") String username,
						 @RequestParam("password") String password,
						 RedirectAttributes ra,
						 HttpSession session, Model model){

		User userFind = userDao.findByUserName(username);
		if(userFind!=null){
			if(userFind.getEnabled()==1){
				if(BCrypt.checkpw(password,userFind.getPassword()))
				{
					session.setAttribute("user", userFind);
					String role = userDao.getRoleUser(userFind);
					if(userDao.getRoleUser(userFind).equals("Admin")){
						return "redirect:/admin-dashboard";
					}else {
						return "redirect:/home";
					}
				} else {
					ra.addAttribute("err", "Mật khẩu không đúng");
					return "redirect:/login";
				}
			} else {
				ra.addAttribute("err", "Tài khoản bị khóa");
			}
		} else {
			ra.addAttribute("err","Tài khoản không tồn tại");
			return "redirect:/login";
		}
		return "redirect:/login";
	}
}
