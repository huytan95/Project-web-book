package ProjectEnd.Controller.AdminController;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;
import java.util.List;

import ProjectEnd.entities.User;
import ProjectEnd.service.User.userDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ProjectEnd.service.contact.contactDAO;
import ProjectEnd.service.contact.imageInforDAO;
import ProjectEnd.entities.contact;
import ProjectEnd.entities.imageInfor;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class EditInfomationWebControllerAD {
	@Autowired
	private contactDAO contactDAO;
	@Autowired
	private imageInforDAO imageInforDAO;
	@Autowired
	private userDAO useDao;

	@RequestMapping(value = { "admin-InformationWebAd" })
	public String loadContact(@RequestParam(value = "mess", required = false)String mess, HttpSession session, Model model) {
			contact contact = contactDAO.getInforById(1);
			List<imageInfor> listImageInfors = imageInforDAO.getImageInfor();
			model.addAttribute("contact", contact);
			model.addAttribute("listImageInfors", listImageInfors);
			model.addAttribute("mess", mess);
			return "Admin/InformationAd";
	}

	@RequestMapping("admin-preEditInfor")
	public String preEditInfor(@RequestParam("id") Integer id, Model model) {
		contact infor = contactDAO.getInforById(id);
		model.addAttribute("infor", infor);
		return "Admin/EditInformationWebAd";
	}

	@RequestMapping("admin-editInformationWeb")
	public String editInformationWeb(@ModelAttribute("infor") contact infor, Model model) {
		model.addAttribute("infor", infor);
		boolean bl = contactDAO.updateInfor(infor);
		if (bl) {
			return "redirect:/admin-InformationWebAd";
		} else {
			model.addAttribute("err", "Update failed!");
			model.addAttribute("infor", infor);
			return "Admin/EditInformationWebAd";
		}
	}
	@RequestMapping("admin-introductionAdmin" )
	public String introduction(Model model) {
			contact contact = contactDAO.getInforById(1);
			model.addAttribute("contact", contact);
			return "Admin/IntroductionAdmin";
	}

	@RequestMapping("admin-preEditIntroduction")
	public String preEditIntroduction(@RequestParam("id") Integer id, Model model) {
		contact introduction = contactDAO.getInforById(1);
		model.addAttribute("introduction", introduction);
		return "Admin/EditIntroduction";
	}

	@RequestMapping("admin-editIntroduction")
	public String editIntroduction(@ModelAttribute("introduction") contact contact, Model model) {
		model.addAttribute("contact", contact);
		boolean bl = contactDAO.updateInfor(contact);
		if (bl) {
			return "redirect:/admin-introductionAdmin";
		} else {
			model.addAttribute("err", "Update failed!");
			model.addAttribute("contact", contact);
			return "Admin/IntroductionAdmin";
		}
	}
	@RequestMapping("admin-policyAdmin")
	public String policy(Model model) {
			contact contact = contactDAO.getInforById(1);
			model.addAttribute("contact", contact);
			return "Admin/PolicyAdmin";
	}

	@RequestMapping("admin-preEditPolicy")
	public String preEditPolicy(@RequestParam("id") Integer id, Model model) {
		contact policy = contactDAO.getInforById(1);
		model.addAttribute("policy", policy);
		return "Admin/EditPolicy";
	}
	@RequestMapping("admin-editPolicy")
	public String editPolicy(@ModelAttribute("policy") contact contact, Model model) {
		model.addAttribute("contact", contact);
		boolean bl = contactDAO.updateInfor(contact);
		if (bl) {
			return "redirect:/admin-policyAdmin";
		} else {
			model.addAttribute("err", "Update failed!");
			model.addAttribute("contact", contact);
			return "Admin/PolicyAdmin";
		}
	}
	@RequestMapping("admin-preUpdateImageInfor")
	public String preUpdateLogo(@RequestParam("id") Integer id, Model model) {
		imageInfor imageInfor = imageInforDAO.getImageInforById(id);
		model.addAttribute("imageInfor", imageInfor);
		return "Admin/UpdateImageInfor";
	}
	@RequestMapping({"admin-updateImageInfor" })
	public String updateLogo(@ModelAttribute("imageInfor") imageInfor imageInfor, Model model,
							 @RequestParam(name = "imageInforName") MultipartFile imageInforName,
							 HttpServletRequest request, RedirectAttributes ra) {

		String path = request.getServletContext().getRealPath("sources/img");
		File logoPath = new File(path);
		File destinationLogo = new File(logoPath.getAbsolutePath() + "/" + imageInforName.getOriginalFilename());

		try {
			Files.write(destinationLogo.toPath(), imageInforName.getBytes(), StandardOpenOption.CREATE);
		} catch (IOException e) {
			e.printStackTrace();
		}

		String imageFileName = imageInforName.getOriginalFilename();
		imageInfor.setImageName(imageFileName);

		model.addAttribute("imageInfor", imageInfor);

		boolean bl = imageInforDAO.updateImageInfor(imageInfor);
		if (bl) {
			ra.addAttribute("mess", "Cập nhật thành công");
		} else {
			ra.addAttribute("mess", "Cập nhật không thành công");
		}
		return "redirect:/admin-InformationWebAd";
	}
}
