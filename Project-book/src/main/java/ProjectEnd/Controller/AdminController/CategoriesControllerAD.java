package ProjectEnd.Controller.AdminController;

import ProjectEnd.entities.User;
import ProjectEnd.entities.Categories;
import ProjectEnd.service.Product.ProductDAO;
import ProjectEnd.service.User.userDAO;
import ProjectEnd.service.categories.categoriesInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;
@Controller
public class CategoriesControllerAD {
    @Autowired
    private userDAO userDao;
    @Autowired
    private categoriesInterface catInterface;
    @Autowired
    private ProductDAO productDAO;

    @RequestMapping("admin-loadCategories")
    public String loadCategories(@RequestParam(value = "mess", required = false)String mess, HttpSession session, Model model) {

        List<Categories> list = catInterface.getCategories();
        model.addAttribute("list", list);
        model.addAttribute("mess", mess);
        return "Admin/Categories";
    }

    @RequestMapping("preUpdateCategory")
    public String preUpdateCategory(@RequestParam("cateId") Integer cateId,
                                    HttpSession session, Model model) {

            Categories categories = catInterface.getCategoryById(cateId);
            model.addAttribute("categories", categories);
            return "Admin/UpdateCategories";
    }

    @RequestMapping("updateCategories")
    public String updateCategories(@ModelAttribute("categories") Categories categories, Model model) {

        boolean bl = catInterface.updateCategory(categories);
        if (bl) {
            return "redirect:/admin-loadCategories";
        } else {
            model.addAttribute("err", "Update failed!");
            model.addAttribute("categories", categories);
            return "Admin/UpdateCategories";
        }
    }

    @RequestMapping("initInsertCategories")
    public String initInsertCategories(Model model) {
        Categories categories = new Categories();
        model.addAttribute("categories", categories);
        return "Admin/InsertCategories";
    }

    @RequestMapping("insertCategories")
    public String insertStudent(@ModelAttribute("categories") Categories categories, Model model) {
        boolean bl = catInterface.insertCategory(categories);
        if (bl) {
            return "redirect:/admin-loadCategories";
        } else {
            model.addAttribute("err", "loi insert");
            model.addAttribute("categories", categories);
            return "Admin/InsertCategories";
        }
    }

    @RequestMapping("deleteCategories")
    public String deleteBook(@RequestParam("cateId")Integer cateId,
                             RedirectAttributes ra, Model model) {
        Long total = productDAO.getTotalProductByCateId(cateId);
        if(total!=0){
            ra.addAttribute("mess", "Không thể xóa danh mục có chứa sản phẩm.");
        } else {
            boolean bl = catInterface.deteleCategory(cateId);
            if(bl) {
                ra.addAttribute("mess", "Xóa danh mục thành công!");
            }else {
                ra.addAttribute("mess", "Xóa danh mục không thành công");
            }
        }
        return "redirect:/admin-loadCategories";
    }
}
