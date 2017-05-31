package magicgis.newssystem.models.security;

import java.util.HashSet;
import java.util.Set;

import magicgis.newssystem.models.BaseEntity;

public class Role extends BaseEntity{
	
	private static final long serialVersionUID = 596760102394542763L;
	private String roleName;
	private String roleValue;
	private String roleDesc;
	private Set<Right> rights = new HashSet<Right>();
	
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRoleValue() {
		return roleValue;
	}
	public void setRoleValue(String roleValue) {
		this.roleValue = roleValue;
	}
	public String getRoleDesc() {
		return roleDesc;
	}
	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}
	public Set<Right> getRights() {
		return rights;
	}
	public void setRights(Set<Right> rights) {
		this.rights = rights;
	}
	
}
