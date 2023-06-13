package ProjectEnd.Controller.AdminController;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import ProjectEnd.entities.Categories;
import ProjectEnd.entities.contact;
import ProjectEnd.entities.imageInfor;
import ProjectEnd.dao.categories.categoriesInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ProjectEnd.entities.Role;
import ProjectEnd.entities.User;
import ProjectEnd.entities.User_role;
import ProjectEnd.dao.Role.roleDAO;
import ProjectEnd.dao.User.userDAO;
import ProjectEnd.dao.UserRole.roleUserDAO;

@Controller
public class UserControllerAD {
	
	@Autowired
	private userDAO userDao;
	@Autowired
	private roleDAO roleDao;
	@Autowired
	private roleUserDAO roleUserDAO;
	@Autowired
	private ProjectEnd.dao.contact.contactDAO contactDAO;
	@Autowired
	private categoriesInterface catInterface;
	@Autowired
	private ProjectEnd.dao.contact.imageInforDAO imageInforDAO;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sf = new SimpleDateFormat("dd/MM/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sf, true));
	}

	@RequestMapping("admin-listUser")
	private String listUser(@RequestParam(name = "page", required = false) Integer page,
							HttpSession session, Model model) {
			if (page == null || page <1)
				page = 1;
			int maxResult = 15;
			int offset = (page - 1) * maxResult;
			long totalUser = userDao.getTotalUser();
			int totalPages = (int) (totalUser / maxResult + (totalUser % maxResult == 0 ? 0 : 1));
			List<User> listUser = userDao.getUser(offset, maxResult);
			List<Integer> listPage = new ArrayList();
			for (int i = 1; i <= totalPages; i++)
				listPage.add(i);
			int previous = page -1;
			int next = page +1;
			if(next>totalPages){
				next = totalPages;
			}
			model.addAttribute("next", next);
			model.addAttribute("previous",previous);
			model.addAttribute("listPage", listPage);
			model.addAttribute("listUser", listUser);
			return "Admin/ListUserAdmin";
	}
	
	@RequestMapping("admin-detailUser")
	public String detailUser(@RequestParam("id")Long id, Model model) {
		User user = userDao.getUserById(id);
		model.addAttribute("user", user);
		return "Admin/DetailUser";
	}
	
	@RequestMapping("admin-preUpdateUser")
	public String preUpdateUser(@RequestParam("id") Long id, Model model){
		User user = userDao.getUserById(id);
		
		List<Role> listRole = roleDao.getRole();
		model.addAttribute("listRole", listRole);
		model.addAttribute("user", user);
		return "Admin/UpdateUserAdmin";
	}
	
	@RequestMapping(value = "admin-updateUser", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("user") User user, HttpServletRequest request, Model model) {
		roleUserDAO.deleteAllRolesByUser(user);
	    String selectedRoleId = request.getParameter("userRoles.role");
	    Role role = roleDao.getRoleById(Long.parseLong(selectedRoleId));
	    Set<User_role> userRoleSet = roleUserDAO.getUserRoleByUser(user);
	    User_role userRole = new User_role();
	    userRole.setRole(role);
	    userRole.setUser(user);
	    userRoleSet.add(userRole);
	    user.setUserRoles(userRoleSet);
	    roleUserDAO.insertRoleUser(userRole);
	    boolean bl = userDao.updateUser(user);
	    if (bl) {
	        return "redirect:/admin-listUser";
	    } else {
	        model.addAttribute("err", "Update failed!");
	        model.addAttribute("user", user);
	        return "Admin/UpdateUserAdmin";
	    }
	}
	@RequestMapping("admin-disabled")
	private String disabled (@RequestParam("id") Long id,@RequestParam(name = "page", required = false) Integer page, Model model) {
		User user = userDao.getUserById(id);
		user.setEnabled(0);
		userDao.updateUser(user);
		if (page == null)
			page = 1;
		int maxResult = 15;
		int offset = (page - 1) * maxResult;
		long totalUser = userDao.getTotalUser();
		int totalPages = (int) (totalUser / maxResult + (totalUser % maxResult == 0 ? 0 : 1));
		List<User> listUser = userDao.getUser(offset, maxResult);
		List<Integer> listPage = new ArrayList();
		for (int i = 1; i <= totalPages; i++)
			listPage.add(i);
		model.addAttribute("listPage", listPage);
		model.addAttribute("listUser", listUser);
		return "Admin/ListUserAdmin";
	}
	@RequestMapping("admin-searchUser")
	private String searchUser(@RequestParam("userName") String userName,
							  @RequestParam(name = "page", required = false) Integer page, Model model){
		if(page==null)
			page = 1;
		int maxResult = 15;
		int offset = (page-1)*maxResult;

		long totalUserByUserName = userDao.getTotalUserByUserName(userName);
		int totalPages = (int) (totalUserByUserName/maxResult+(totalUserByUserName%maxResult==0?0:1));

		List<User> listUser = userDao.getUserByUserName(userName,offset,maxResult);
		model.addAttribute("listUser", listUser);
		List<Integer> listPage = new ArrayList();
		for(int i=1;i<=totalPages;i++)
			listPage.add(i);
		model.addAttribute("nameSearch", userName);
		model.addAttribute("listPage", listPage);
		return "Admin/ListUserAdmin";
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
