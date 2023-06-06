package ProjectEnd.Controller.UserController;

import ProjectEnd.entities.Message;
import ProjectEnd.service.mail.MailAutoDao;
import ProjectEnd.service.message.MessageDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;

@Controller
public class MessageController {
    @Autowired
    private MessageDao messageDao;
    @Autowired
    private JavaMailSender mailSender;
    @Autowired
    private MailAutoDao mailAutoDao;

    @RequestMapping("insertMessage")
    private String insertMessage(@ModelAttribute("message") Message message,
                                 RedirectAttributes ra, Model model){
        message.setStatus(false);
        message.setMessageDate(new Date());
        boolean bl = messageDao.insertMessage(message);
        if(bl){
            Thread thread = new Thread(new Runnable() {
                @Override
                public void run() {
                    sendMail(message.getEmail(),mailAutoDao.getMailById(1).getMailType(),mailAutoDao.getMailById(1).getMailContent());
                }
            });
            thread.start();
            ra.addAttribute("mess","Gửi tin nhắn thành công");
            return "redirect:/contact";
        } else {
            ra.addAttribute("mess", "Gửi tin không thành công");
            model.addAttribute("message", message);
            return "redirect:/contact";
        }
    }
    public void sendMail(String to, String subject, String content){
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(to);
        mailMessage.setSubject(subject);
        mailMessage.setText(content);

        mailSender.send(mailMessage);
    }
}
