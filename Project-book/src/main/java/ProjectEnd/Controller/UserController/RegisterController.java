package ProjectEnd.Controller.UserController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ProjectEnd.entities.User;
import ProjectEnd.entities.Categories;
import ProjectEnd.entities.contact;
import ProjectEnd.entities.imageInfor;
import ProjectEnd.dao.categories.categoriesInterface;
import ProjectEnd.dao.contact.contactDAO;
import ProjectEnd.dao.contact.imageInforDAO;

@Controller
public class RegisterController {
	@Autowired
	private contactDAO contactDAO;
	@Autowired
	private categoriesInterface catInterface;
	@Autowired
	private imageInforDAO imageInforDAO;
	
	@RequestMapping(value = {"register" })
	public String loadContact(Model model) {
		contact contact = contactDAO.getInforById(1);
		User user = new User();
		List<Categories> listCate = catInterface.getCategories();
		imageInfor imageLogo = imageInforDAO.getImageInforById(1);
		model.addAttribute("user", user);
		model.addAttribute("listCate", listCate);
		model.addAttribute("imageLogo", imageLogo);
		model.addAttribute("contact", contact);
		return "Register";
	}
	
}
