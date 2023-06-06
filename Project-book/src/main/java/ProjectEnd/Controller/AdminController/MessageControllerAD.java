package ProjectEnd.Controller.AdminController;

import ProjectEnd.entities.User;
import ProjectEnd.entities.Message;
import ProjectEnd.service.User.userDAO;
import ProjectEnd.service.mail.MailAutoDao;
import ProjectEnd.service.message.MessageDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MessageControllerAD {

    @Autowired
    private MessageDao messageDao;
    @Autowired
    private JavaMailSender mailSender;
    @Autowired
    private MailAutoDao mailAutoDao;
    @Autowired
    private userDAO userDao;


    @RequestMapping("admin-listMessageAdmin")
    public String listMessageAdmin(@RequestParam(name = "page", required = false) Integer page,
                                   @RequestParam(value = "mess", required = false)String mess, Model model) {
            if (page == null)
                page = 1;
            int maxResult = 15;
            int offset = (page - 1) * maxResult;
            long totalMessage = messageDao.totalMessage();
            int totalPages = (int) (totalMessage / maxResult + (totalMessage % maxResult == 0 ? 0 : 1));
            List<Message> listMessage  = messageDao.getMessage(offset, maxResult);
            model.addAttribute("listMessage", listMessage);
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
            model.addAttribute("mess", mess);
            return "Admin/ListMessageAdmin";
    }

    @RequestMapping("admin-updateStatus")
    public String updateStatus (@RequestParam("messId")long messId, RedirectAttributes ra, Model model){
        Message message = messageDao.getMessageById(messId);
        message.setStatus(true);
        boolean bl = messageDao.updateMessage(message);
        if (bl){
            ra.addAttribute("mess", "Cập nhật thành công");
        } else {
            ra.addAttribute("mess", "Cập nhật không thành công");
        }
        return "redirect:/admin-listMessageAdmin";
    }
    @RequestMapping("admin-messageDetailAdmin")
    public String messageDetailAdmin(@RequestParam("messId")Long messId, Model model){
        Message message = messageDao.getMessageById(messId);
        model.addAttribute("message", message);
        return "Admin/MessageDetailAdmin";
    }
    @RequestMapping("admin-deleteMessage")
    public String deleteMessage(@RequestParam("messId")Long messId,RedirectAttributes ra, Model model){
        Message message = messageDao.getMessageById(messId);
        boolean bl = messageDao.deleteMessage(messId);
        if(bl){
            ra.addAttribute("mess", "Xóa tin nhắn thành công");
        } else {
            ra.addAttribute("mess", "Xóa tin nhắn không thành công");
        }
        return "redirect:/admin-listMessageAdmin";
    }
    @RequestMapping("admin-repMessage")
    public String repMessage(@RequestParam("messId")Long messId, Model model){
        Message message = messageDao.getMessageById(messId);
        model.addAttribute("message", message);
        return "Admin/RepMessage";
    }
    @RequestMapping("admin-sendMail")
    public String sendMessage(@RequestParam("sendTo")String sendTo,
                                @RequestParam("title")String title,
                                @RequestParam("content")String content,
                                @RequestParam("messId")Long messId,
                                RedirectAttributes ra){
        sendMail(sendTo,title,content);
        ra.addAttribute("messId", messId);
        return "redirect:/admin-updateStatus";
    }
    public void sendMail(String to, String subject, String content){
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(to);
        mailMessage.setSubject(subject);
        mailMessage.setText(content);

        mailSender.send(mailMessage);
    }
    }

