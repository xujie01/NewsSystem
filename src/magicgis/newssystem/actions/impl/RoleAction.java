package magicgis.newssystem.actions.impl;

import java.util.ArrayList;
import java.util.List;

import javassist.bytecode.stackmap.TypeData.ClassName;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import magicgis.newssystem.actions.BaseAction;
import magicgis.newssystem.models.security.Right;
import magicgis.newssystem.models.security.Role;
import magicgis.newssystem.services.RightService;
import magicgis.newssystem.services.RoleService;

@Controller
@Scope("prototype")
public class RoleAction extends BaseAction<Role> {

	private static final long serialVersionUID = 1L;
	@Autowired
	private RoleService roleService;
	@Autowired
	private RightService rightService;

	private List<Right> noOwnRights = new ArrayList<Right>();
	private List<Role> allRoles = new ArrayList<Role>();
	private static Logger logger = Logger.getLogger(ClassName.class);
	// 角色拥有的权限id数组
	private Integer[] ownRightIds;

	/**
	 * 删除角色
	 */
	public String deleteRole() {
		model = roleService.getEntity(model.getId());
		roleService.deleteEntity(model);
		logger.info("删除角色：" + model.getRoleName());
		return "to_RoleAction_findAllRoles";
	}

	/**
	 * 编辑角色
	 */
	public String editRole() {
		model = roleService.getEntity(model.getId());
		this.noOwnRights = rightService.findRightsNotInRange(model.getRights());
		return "to_updateRolePage";
	}

	/**
	 * 保存或更新角色
	 */
	public String saveOrUpdateRole() {
		System.out.println(ownRightIds);
		roleService.saveOrUpdateRole(model, ownRightIds);
		logger.info("保存或更新角色：" + model.getRoleName());
		return "to_RoleAction_findAllRoles";
	}

	/**
	 * 查询出所有的角色
	 */
	public String findAllRoles() {
		setAllRoles(roleService.findAllEntities());
		return "to_roleListPage";
	}

	/**
	 * 跳转到增加角色的页面
	 */
	public String toAddRolePage() {
		setNoOwnRights(rightService.findAllEntities());
		return "to_addRolePage";
	}

	public List<Role> getAllRoles() {
		return allRoles;
	}

	public void setAllRoles(List<Role> allRoles) {
		this.allRoles = allRoles;
	}

	public List<Right> getNoOwnRights() {
		return noOwnRights;
	}

	public void setNoOwnRights(List<Right> noOwnRights) {
		this.noOwnRights = noOwnRights;
	}

	public Integer[] getOwnRightIds() {
		return ownRightIds;
	}

	public void setOwnRightIds(Integer[] ownRightIds) {
		this.ownRightIds = ownRightIds;
	}

}
