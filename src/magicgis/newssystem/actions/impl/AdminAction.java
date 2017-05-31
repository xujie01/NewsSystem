package magicgis.newssystem.actions.impl;

import java.io.ByteArrayInputStream;
import java.util.Date;
import java.util.List;

import javassist.bytecode.stackmap.TypeData.ClassName;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import magicgis.newssystem.actions.BaseAction;
import magicgis.newssystem.models.security.Admin;
import magicgis.newssystem.models.security.Role;
import magicgis.newssystem.services.AdminService;
import magicgis.newssystem.services.RightService;
import magicgis.newssystem.services.RoleService;
import magicgis.newssystem.utils.DataUtils;
import magicgis.newssystem.utils.ValidateUtils;

@Controller
@Scope("prototype")
public class AdminAction extends BaseAction<Admin> {

	private static final long serialVersionUID = 4486181060405450749L;
	@Autowired
	private AdminService adminService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private RightService rightService;

	private List<Admin> allAdmins = null;
	private List<Role> noOwnRoles = null;
	private Integer[] ownRoleIds = null;
	private Admin admin = null;
	private String validationCode = null;
	private ByteArrayInputStream byteArrayInputStream;
	private static Logger logger = Logger.getLogger(ClassName.class);
	
	public String homePage(){
		logger.info("注销管理员:" + ((Admin) sessionMap.get("admin")).getUsername());
		sessionMap.put("admin", null);
		httpSession.invalidate();
		return "to_NewsAction_getAllPassedNews";
	}

	/**
	 * 得到验证码
	 */
	public String getRandomPictrue() {
		this.setByteArrayInputStream(vcu.getImage());
		sessionMap.put("adminRandom", vcu.getVerificationCodeValue());// 取得随机字符串放入HttpSession
		return "validationCode_success";
	}

	/**
	 * 添加管理员
	 */
	public String toAddAdminPage() {
		setNoOwnRoles(roleService.findAllEntities());
		return "to_addAdminPage";
	}

	/**
	 * 删除管理员
	 */
	public String deleteAdmin() {
		model = adminService.getEntity(model.getId());
		adminService.deleteEntity(model);
		logger.info("删除管理员:" + model.getUsername());
		return "to_AdminAction_getAllAdmins";
	}

	/**
	 * 保存管理员
	 */
	public String saveOrUpdatAdmin() {
		if (model.getId() == null) {
			model.setPassword(DataUtils.md5(model.getPassword()));
			model.setLoginFailureCount(0);
			adminService.updateAuthorize(model, ownRoleIds);
			logger.info("添加管理员:" + model.getUsername());
		} else {
			admin = adminService.getEntity(model.getId());
			admin.setEmail(model.getEmail());
			admin.setEnabled(model.isEnabled());
			if (model.isEnabled()) {
				admin.setLockedTime(null);
			}
			admin.setRoles(model.getRoles());
			adminService.updateAuthorize(admin, ownRoleIds);
			logger.info("更新管理员:" + model.getUsername());
		}
		return "to_AdminAction_getAllAdmins";
	}

	/**
	 * 更新管理员
	 */
	public String editAdmin() {
		model = adminService.getEntity(model.getId());
		this.noOwnRoles = roleService.findRolesNotInRange(model.getRoles());
		return "to_updateAdminPage";
	}
	
	public String home() {
		return "to_homePage";
	}

	/**
	 * 得到所有的管理员
	 */
	public String getAllAdmins() {
		allAdmins = adminService.findAllEntities();
		requestMap.put("allAdmins", allAdmins);
		return "to_adminListPage";
	}

	/**
	 * 管理员注销
	 */
	public String doneLogout() {
		logger.info("注销管理员:" + ((Admin) sessionMap.get("admin")).getUsername());
		sessionMap.put("admin", null);
		httpSession.invalidate();
		return "to_indexPage";

	}
	
	/**
	 * 系统配置
	 */
	public String sysConfig(){
		return "to_configPage";
	}

	/**
	 * 登录成功
	 */
	public String doneLogin() {
		return "to_AdminAction_home";
	}

	/**
	 * 登录校检
	 */
	public void validateDoneLogin() {
		Admin admin = adminService.isAdmin(model.getUsername(),
				model.getPassword());
		String adminRandom = ((String) sessionMap.get("adminRandom"))
				.toLowerCase();
		if (!(ValidateUtils.isValid(model.getUsername()) && ValidateUtils
				.isValid(model.getPassword()))) {
			addActionError("用户名或密码不能为空");
			return;
		} else if (admin == null || admin.getId() == null || admin.getId() <= 0) {
			adminService.loginFailure(model.getUsername());
			addActionError("用户名或密码错误!若连续五次登录失败,该账号将被锁定");
			return;
		} else if (!adminRandom.equals(validationCode.toLowerCase())) {
			addActionError("验证码错误");
			return;
		} else if (admin != null && admin.getId() > 0) {
			if (!admin.isEnabled()) {
				addActionError("该账号已被禁用，请联系超级管理员");
				return;
			}
			admin.setLoginFailureCount(0);
			sessionMap.put("lastIPAddress", admin.getIpAddress());
			sessionMap.put("lastLoginTime", admin.getLoginTime());
			admin.setIpAddress(httpRequest.getRemoteAddr());
			admin.setLoginTime(new Date());
			adminService.updateEntity(admin);
			// 初始化权限总和数组
			int maxPos = rightService.getMaxRightPos();
			admin.setRightSum(new long[maxPos + 1]);
			// 计算用户权限总和
			admin.calculateRightSum();
			sessionMap.put("admin", admin);

			logger.info("管理员登录:" + admin.getUsername());
		}
	}

	public List<Role> getNoOwnRoles() {
		return noOwnRoles;
	}

	public void setNoOwnRoles(List<Role> noOwnRoles) {
		this.noOwnRoles = noOwnRoles;
	}

	public Integer[] getOwnRoleIds() {
		return ownRoleIds;
	}

	public void setOwnRoleIds(Integer[] ownRoleIds) {
		this.ownRoleIds = ownRoleIds;
	}

	public String getValidationCode() {
		return validationCode;
	}

	public void setValidationCode(String validationCode) {
		this.validationCode = validationCode;
	}

	public ByteArrayInputStream getByteArrayInputStream() {
		return byteArrayInputStream;
	}

	public void setByteArrayInputStream(
			ByteArrayInputStream byteArrayInputStream) {
		this.byteArrayInputStream = byteArrayInputStream;
	}

}
