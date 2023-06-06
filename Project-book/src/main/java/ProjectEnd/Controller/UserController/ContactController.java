package ProjectEnd.Controller.UserController;

import java.util.List;

import ProjectEnd.entities.User;
import ProjectEnd.entities.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ProjectEnd.entities.Categories;
import ProjectEnd.entities.contact;
import ProjectEnd.entities.imageInfor;
import ProjectEnd.service.categories.categoriesInterface;
import ProjectEnd.service.contact.contactDAO;
import ProjectEnd.service.contact.imageInforDAO;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class ContactController {
	@Autowired
	private categoriesInterface catInterface;
	@Autowired
	private contactDAO contactDAO;
	@Autowired
	private imageInforDAO imageInforDAO;
	
	@RequestMapping("contact")
	private String contact(@RequestParam(value = "mess", required = false)String mess,
						   HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user!= null){
			model.addAttribute("user", user);
		}
		model.addAttribute("mess", mess);
		contact contact = contactDAO.getInforById(1);
		List<Categories> listCate = catInterface.getCategories();
		imageInfor imageLogo = imageInforDAO.getImageInforById(1);
		imageInfor imageBanner = imageInforDAO.getImageInforById(2);
		Message message = new Message();
		model.addAttribute("message", message);
		model.addAttribute("imageLogo", imageLogo);
		model.addAttribute("imageBanner", imageBanner);
		model.addAttribute("listCate", listCate);
		model.addAttribute("contact", contact);
		return "User/Contact";
	}

	@RequestMapping("introductionUser")
	private String introductionUser(Model model) {
		contact contact = contactDAO.getInforById(1);
		List<Categories> listCate = catInterface.getCategories();
		imageInfor imageLogo = imageInforDAO.getImageInforById(1);
		model.addAttribute("imageLogo", imageLogo);
		model.addAttribute("listCate", listCate);
		model.addAttribute("contact", contact);
		
		return "User/IntroductionUser";
	}
	@RequestMapping("policyUser")
	private String policyUser(Model model) {
		contact contact = contactDAO.getInforById(1);
		List<Categories> listCate = catInterface.getCategories();
		imageInfor imageLogo = imageInforDAO.getImageInforById(1);
		model.addAttribute("imageLogo", imageLogo);
		model.addAttribute("listCate", listCate);
		model.addAttribute("contact", contact);
		
		return "User/PolicyUser";
	}
	
}
