package magicgis.newssystem.services;

import magicgis.newssystem.models.security.Admin;

public interface AdminService extends BaseService<Admin> {

	public void updateAuthorize(Admin model, Integer[] ownRoleIds);

	public void loginFailure(String username);

	public Admin findByUsername(String username);

	public Admin isAdmin(String username, String password);

}
