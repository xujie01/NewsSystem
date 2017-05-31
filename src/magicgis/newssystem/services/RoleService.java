package magicgis.newssystem.services;

import java.util.List;
import java.util.Set;

import magicgis.newssystem.models.security.Role;

public interface RoleService extends BaseService<Role>{

	public void saveOrUpdateRole(Role model, Integer[] ownRightIds);

	public List<Role> findRolesNotInRange(Set<Role> set);

	public List<Role> findRolesInRange(Integer[] ownRoleIds);

}
