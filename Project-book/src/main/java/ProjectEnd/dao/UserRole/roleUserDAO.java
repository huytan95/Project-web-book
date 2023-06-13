package ProjectEnd.dao.UserRole;

import java.util.Set;

import ProjectEnd.entities.User;
import ProjectEnd.entities.User_role;

public interface roleUserDAO {
	public boolean insertRoleUser(User_role userRole);
	public User_role getUserRoleById(Long id);
	public boolean updateRoleUser(User_role userRole);
	public Set<User_role> getUserRoleByUser(User user);

	public boolean deleteAllRolesByUser(User user);
}
