package ProjectEnd.dao.authentication;

import ProjectEnd.entities.Authentication;

public interface AuthenticationDao {
    public Authentication getAuthenticationCodeById(int id);
    public boolean updateAuthCode(Authentication authCode);
    public boolean insertAuthCode(Authentication authcode);
    public Authentication getAuthByUserId(long userId);
}
