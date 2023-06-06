package ProjectEnd.entities;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "role")
public class Role {
	@Id
	@Column(name = "Id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(name = "name")
	private String name;
	
	@OneToMany(mappedBy = "role")
	private Set<User_role> roleUsers;

	public Role() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Role(Long id, String name, Set<User_role> roleUsers) {
		super();
		this.id = id;
		this.name = name;
		this.roleUsers = roleUsers;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<User_role> getRoleUsers() {
		return roleUsers;
	}

	public void setRoleUsers(Set<User_role> roleUsers) {
		this.roleUsers = roleUsers;
	}	

}
