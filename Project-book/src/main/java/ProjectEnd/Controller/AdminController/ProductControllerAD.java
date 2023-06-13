package ProjectEnd.Controller.AdminController;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import ProjectEnd.entities.User;
import ProjectEnd.dao.User.userDAO;
import ProjectEnd.dao.comment.CommentDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import ProjectEnd.entities.Product;
import ProjectEnd.entities.Categories;
import ProjectEnd.dao.Product.ProductDAO;
import ProjectEnd.dao.categories.categoriesInterface;
import ProjectEnd.dao.contact.contactDAO;
import ProjectEnd.dao.contact.imageInforDAO;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ProductControllerAD {
	@Autowired
	private categoriesInterface catInterface;
	@Autowired
	private contactDAO contactDAO;
	@Autowired
	private imageInforDAO imageInforDAO;
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



	@RequestMapping("admin-initInsertProduct")
	public String initInsertProduct(Model model) {
		List<Categories> listCategories = catInterface.getCategories();
		Product product = new Product();
		model.addAttribute("product", product);
		model.addAttribute("listCategories", listCategories);
		return "Admin/InsertProduct";
	}

	@RequestMapping("admin-insertProduct")
	public String insertProduct(@ModelAttribute("product") Product product, Model model,
								@RequestParam(name = "productImageName") MultipartFile fileImage, HttpServletRequest request) {
		String path = request.getServletContext().getRealPath("sources/img");
		File imageProductPath = new File(path);
		File destination = new File(imageProductPath.getAbsolutePath() + "/" + fileImage.getOriginalFilename());
		if (!destination.exists()) {
			try {
				Files.write(destination.toPath(), fileImage.getBytes(), StandardOpenOption.CREATE);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		String imageFileName = fileImage.getOriginalFilename();
		product.setImageName(imageFileName);

		boolean bl = productDAO.insertProduct(product);
		if (bl) {
			return "redirect:/admin-listProductAdmin";
		} else {
			model.addAttribute("err", "loi insert");
			model.addAttribute("product", product);
			return "Admin/InsertProduct";
		}
	}

	@RequestMapping("admin-listProductAdmin")
	public String loadProduct(@RequestParam(name = "page", required = false) Integer page,
							  @RequestParam(value = "mess", required = false)String mess,
							  HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
			if (page == null) page = 1;
			int maxResult = 15;
			int offset = (page - 1) * maxResult;

			long totalProduct = productDAO.getTotalProduct();
			int totalPages = (int) (totalProduct / maxResult + (totalProduct % maxResult == 0 ? 0 : 1));
			List<Product> listProduct = productDAO.getProductPaging(offset, maxResult);
			model.addAttribute("listProduct", listProduct);
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
			model.addAttribute("user", user);
			model.addAttribute("mess", mess);
			return "Admin/ListProductAdmin";
	}


	@RequestMapping("admin-preUpdateProduct")
	public String preUpdateProduct(@RequestParam("productId") Integer productId, Model model) {
		List<Categories> listCategories = catInterface.getCategories();
		Product product = productDAO.getProductById(productId);
		model.addAttribute("product", product);
		model.addAttribute("listCategories", listCategories);
		return "Admin/UpdateProduct";
	}

	@RequestMapping("admin-updateProduct")
	public String updateProduct(@ModelAttribute("product") Product product, Model model,
								@RequestParam(name = "productImageName") MultipartFile fileImage, HttpServletRequest request) {
		if(fileImage.getSize() == 0){
			product.setImageName(productDAO.getProductById(product.getProductId()).getImageName());
			productDAO.updateProduct(product);
		} else {
			String path = request.getServletContext().getRealPath("sources/img");
			File imageProductPath = new File(path);
			File destination = new File(imageProductPath.getAbsolutePath() + "/" + fileImage.getOriginalFilename());
			if (!destination.exists()) {
				try {
					Files.write(destination.toPath(), fileImage.getBytes(), StandardOpenOption.CREATE);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

			String imageFileName = fileImage.getOriginalFilename();
			product.setImageName(imageFileName);

			boolean bl = productDAO.updateProduct(product);
			if (bl) {
				return "redirect:/admin-listProductAdmin";
			} else {
				model.addAttribute("err", "Thêm sản phẩm không thành công");
				model.addAttribute("product", product);
				return "Admin/UpdateProduct";
			}
		}
		return "redirect:/admin-listProductAdmin";
	}

	@RequestMapping("admin-productDetailAdmin")
	public String productDetailAdmin(@RequestParam("productId") Integer productId, Model model) {
		Product product = productDAO.getProductById(productId);
		model.addAttribute("product", product);
		return "Admin/ProductDetailAdmin";
	}

	@RequestMapping("admin-deleteProduct")
	public String deleteProduct(@RequestParam("productId") Integer productId,RedirectAttributes ra, Model model) {
		boolean bl = productDAO.deleteProduct(productId);
		if (bl) {
			ra.addAttribute("mess", "Xóa sản phẩm thành công");
		} else {
			ra.addAttribute("mess", "Xóa sản phẩm không thành công");
		}
		List<Product> listProduct = productDAO.getProduct();
		model.addAttribute("listProduct", listProduct);
		return "redirect:/admin-listProductAdmin";
	}

	@RequestMapping("admin-searchProduct")
	public String searchProduct(@RequestParam("productName") String productName,
			@RequestParam(name = "page", required = false) Integer page, Model model) {
		if(page==null || page <1)
		page = 1;
		int maxResult = 15;
		int offset = (page-1)*maxResult;
	
		long totalProductByName = productDAO.getTotalProductByName(productName);
		int totalPages = (int) (totalProductByName/maxResult+(totalProductByName%maxResult==0?0:1));
		
		List<Product> listProduct = productDAO.getProductByName(productName,offset,maxResult);
		model.addAttribute("listProduct", listProduct);
		List<Integer> listPage = new ArrayList();
		for(int i=1;i<=totalPages;i++)
			listPage.add(i);
		int previous = page -1;
		int next = page +1;
		if(next>totalPages){
			next = totalPages;
		}
		model.addAttribute("next", next);
		model.addAttribute("previous",previous);
		model.addAttribute("nameSearch", productName);
		model.addAttribute("listPage", listPage);
		return "Admin/ListProductAdmin";
	}



}
