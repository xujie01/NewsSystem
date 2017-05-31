package magicgis.newssystem.services.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import magicgis.newssystem.daos.impl.RoleDaoImpl;
import magicgis.newssystem.models.security.Right;
import magicgis.newssystem.models.security.Role;
import magicgis.newssystem.services.RightService;
import magicgis.newssystem.services.RoleService;
import magicgis.newssystem.utils.ValidateUtils;

@Service("roleService")
public class RoleServiceImpl extends BaseServiceImpl<Role> implements
		RoleService {

	@Autowired
	private RightService rightService;
	@Autowired
	private RoleDaoImpl roleDao;

	/**
	 * 保存或更新角色
	 */
	@Override
	public void saveOrUpdateRole(Role model, Integer[] ownRightIds) {
		if (!ValidateUtils.isValid(ownRightIds)) {
			model.getRights().clear();
		} else {
			List<Right> rights = rightService.findRightsInRange(ownRightIds);
			model.setRights(new HashSet<Right>(rights));
		}
		this.saveOrUpdateEntity(model);

	}

	/**
	 * 查找不在范围内的角色
	 */
	@Override
	public List<Role> findRolesNotInRange(Set<Role> set) {
		if (set == null || set.size() == 0) {
			return this.findAllEntities();
		} else {
			return roleDao.findRolesNotInRange(set);
		}
	}

	/**
	 * 查找在范围内的角色
	 */
	@Override
	public List<Role> findRolesInRange(Integer[] ownRoleIds) {
		if (ValidateUtils.isValid(ownRoleIds)) {
			return roleDao.findRolesInRange(ownRoleIds);
		}
		return null;
	}

}
