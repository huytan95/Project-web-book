package ProjectEnd.service.User;

import java.util.List;

import ProjectEnd.entities.User;


public interface userDAO {
	public List<User> getUser(Integer offset, Integer maxResult);
	public User getUserById(Long id);
	public boolean insertUser(User user);
	public boolean updateUser(User user);
	public boolean deleteUser(int userId);
	public Long getTotalUser();
	public List<User> getUserByUserName(String userName, Integer offset, Integer maxResult);
	public Long getTotalUserByUserName(String userName);
	public User findByUserName(String username);
	public String getRoleUser(User user);
	public User findByMail(String mail);
}
