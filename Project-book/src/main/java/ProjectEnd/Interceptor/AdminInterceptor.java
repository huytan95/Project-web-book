package ProjectEnd.Interceptor;

import ProjectEnd.entities.User;
import ProjectEnd.service.User.userDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@Component
public class AdminInterceptor implements HandlerInterceptor {
    @Autowired
    private userDAO userDao;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return false;
        } else

            if (userDao.getRoleUser(user).equals("Admin")){
            return true;
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/FrontEnd/Err.jsp");
            dispatcher.forward(request, response);
            return false;
        }
    }
}
