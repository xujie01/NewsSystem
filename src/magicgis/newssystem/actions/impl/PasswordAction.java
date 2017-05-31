package magicgis.newssystem.actions.impl;

import java.io.ByteArrayInputStream;

import javassist.bytecode.stackmap.TypeData.ClassName;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import magicgis.newssystem.actions.BaseAction;
import magicgis.newssystem.models.security.Admin;
import magicgis.newssystem.services.AdminService;
import magicgis.newssystem.utils.DataUtils;
import magicgis.newssystem.utils.ValidateUtils;

@Controller
@Scope("prototype")
public class PasswordAction extends BaseAction<Admin> {

	private static final long serialVersionUID = 6927353605936609243L;

	@Autowired
	private AdminService adminService;
	private static Logger logger = Logger.getLogger(ClassName.class);
	private String validationCode = null;
	private ByteArrayInputStream byteArrayInputStream = null;
	private String newpassword = null;
	private String newpassword2 = null;

	/**
	 * 得到验证码
	 */
	public String getRandomPictrue() {
		this.setByteArrayInputStream(vcu.getImage());
		sessionMap.put("changePasswordRandom", vcu.getVerificationCodeValue());// 取得随机字符串放入HttpSession
		return "validationCode_success";
	}
	
	public String transfer(){
		return "to_successChangePage";
	}

	/**
	 * 修改密码
	 */
	public String changePassword() {
		return "to_PasswordAction_transfer";
	}

	/**
	 * 修改密码校检
	 */
	public void validateChangePassword() {
		Admin admin = (Admin) sessionMap.get("admin");
		String changePasswordRandom = ((String) sessionMap
				.get("changePasswordRandom")).toLowerCase();
		if (!ValidateUtils.isValid(model.getPassword())) {
			addActionError("原密码不能为空");
			return;
		} else if (!(ValidateUtils.isValid(newpassword) && ValidateUtils
				.isValid(newpassword2))) {
			addActionError("新密码不能为空");
			return;
		} else if (!admin.getPassword().equals(
				DataUtils.md5(model.getPassword()))) {
			addActionError("原密码输入错误");
			return;
		} else if (!newpassword.equals(newpassword2)) {
			addActionError("新密码两次输入不一致");
			return;
		} else if (newpassword.length() < 6) {
			addActionError("新密码长度不能少于六个字符");
			return;
		} else if (!changePasswordRandom.equals(validationCode.toLowerCase())) {
			addActionError("验证码错误");
			return;
		} else {
			admin.setPassword(DataUtils.md5(newpassword));
			adminService.updateEntity(admin);
			sessionMap.put("admin", admin);
			logger.info("管理员修改密码:" + admin.getUsername());
		}
	}

	/**
	 * 跳转到修改密码的页面
	 */
	public String toChangePassword() {
		return "to_changePasswordPage";
	}

	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	public String getNewpassword2() {
		return newpassword2;
	}

	public void setNewpassword2(String newpassword2) {
		this.newpassword2 = newpassword2;
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
