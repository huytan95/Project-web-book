package ProjectEnd.Controller.AdminController;

import ProjectEnd.entities.MailAuto;
import ProjectEnd.dao.User.userDAO;
import ProjectEnd.dao.mail.MailAutoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class MailControllerAD {
    @Autowired
    private MailAutoDao mailAutoDao;
    @Autowired
    private userDAO userDao;

    @RequestMapping("admin-getMail")
    private String mail(Model model){
            List<MailAuto> list = mailAutoDao.getMailAuto();
            model.addAttribute("listMail", list);
            return "Admin/ListMail";
    }
    @RequestMapping("admin-preUpdateMail")
    private String preUpdateMail(@RequestParam("mailId") Integer mailId, Model model){
        MailAuto mailAuto = mailAutoDao.getMailById(mailId);
        model.addAttribute("mailAuto", mailAuto);
        return "Admin/UpdateMail";
    }
    @RequestMapping("admin-updateMail")
    private String updateMail(@ModelAttribute("mailAuto") MailAuto mailAuto, Model model){
        boolean bl = mailAutoDao.updateMailAuto(mailAuto);
        if (bl) {
            return "redirect:/admin-getMail";
        } else {
            model.addAttribute("err", "Update failed!");
            model.addAttribute("mailAuto", mailAuto);
            return "Admin/UpdateMail";
        }
    }

}
