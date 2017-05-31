package magicgis.newssystem.services.impl;

import java.util.Date;
import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import magicgis.newssystem.daos.impl.AdminDaoImpl;
import magicgis.newssystem.models.security.Admin;
import magicgis.newssystem.models.security.Role;
import magicgis.newssystem.services.AdminService;
import magicgis.newssystem.services.RoleService;
import magicgis.newssystem.utils.ValidateUtils;

@Service("adminService")
public class AdminServiceImpl extends BaseServiceImpl<Admin> implements
		AdminService {

	@Autowired
	private AdminDaoImpl adminDao;
	@Autowired
	private RoleService roleService;

	/**
	 * ¸üÐÂÊÚÈ¨
	 */
	@Override
	public void updateAuthorize(Admin model, Integer[] ownRoleIds) {
		if (!ValidateUtils.isValid(ownRoleIds)) {
			model.getRoles().clear();
		} else {
			List<Role> rights = roleService.findRolesInRange(ownRoleIds);
			model.setRoles(new HashSet<Role>(rights));
		}
		this.saveOrUpdateEntity(model);
	}

	@Override
	public void loginFailure(String username) {
		Admin admin = adminDao.findAdminByUsername(username);
		if (admin != null && admin.getId() > 0) {
			if (admin.getLoginFailureCount() >= 5) {
				admin.setEnabled(false);
				admin.setLockedTime(new Date());
			}
			Integer count = admin.getLoginFailureCount();
			count++;
			admin.setLoginFailureCount(count);
			adminDao.updateEntity(admin);
		}
	}

	@Override
	public Admin findByUsername(String username) {
		if (ValidateUtils.isValid(username)) {
			return adminDao.findAdminByUsername(username);
		}
		return null;
	}

	@Override
	public Admin isAdmin(String username, String password) {
		if(ValidateUtils.isValid(username)&&ValidateUtils.isValid(password)){
			return adminDao.isAdmin(username, password);
		}
		return null;
	}

}
