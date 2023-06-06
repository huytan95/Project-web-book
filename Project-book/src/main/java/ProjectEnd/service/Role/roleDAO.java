package ProjectEnd.service.Role;

import java.util.List;

import ProjectEnd.entities.Role;

public interface roleDAO {
	public Role getRoleById(Long id);
	public List<Role> getRole();
	/*public Role getRoleByName(String name);*/
}
