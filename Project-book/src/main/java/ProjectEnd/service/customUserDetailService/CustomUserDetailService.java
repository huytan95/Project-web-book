package ProjectEnd.service.customUserDetailService;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import ProjectEnd.entities.User;
import ProjectEnd.entities.User_role;
import ProjectEnd.entities.CustomUserDetails;
import ProjectEnd.service.User.userDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailService implements UserDetailsService{
	@Autowired
	private userDAO userDAO;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		return loadUser(username);
	}

	
	private UserDetails loadUser(String username) {
		User user = userDAO.findByUserName(username);

        if (user==null){
            return null;
        }
        Collection<GrantedAuthority> grantedAuthoritySet = new HashSet<>();

        Set<User_role> roles = user.getUserRoles();
        for (User_role account_Role : roles) {
        	grantedAuthoritySet.add(new SimpleGrantedAuthority(account_Role.getRole().getName()));
		}       
        return new CustomUserDetails(grantedAuthoritySet, user.getEmail(), user.getFullName(),
					user.getPassword(), user.getUserName(), user.getGender(), user.getAddress(),
					user.getPhoneNumber(), user.getEnabled(),true,true,true);
	}
}
