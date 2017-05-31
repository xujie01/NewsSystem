package magicgis.newssystem.daos.impl;

import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Repository;

import magicgis.newssystem.models.security.Role;
import magicgis.newssystem.utils.DataUtils;
import magicgis.newssystem.utils.StringUtils;

@Repository("roleDao")
public class RoleDaoImpl extends BaseDaoImpl<Role> {

	public List<Role> findRolesNotInRange(Set<Role> set) {
		String hql = "from Role r where r.id not in ("
				+ DataUtils.extractRoleIds(set) + ")";
		return this.findEntityByHQL(hql);
	}

	public List<Role> findRolesInRange(Integer[] ownRoleIds) {
		String hql = "from Role r where r.id in ("
				+ StringUtils.arr2String(ownRoleIds) + ")";
		return this.findEntityByHQL(hql);
	}

}
