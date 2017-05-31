package magicgis.newssystem.actions.impl;

import java.io.ByteArrayInputStream;

import javassist.bytecode.stackmap.TypeData.ClassName;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import magicgis.newssystem.actions.BaseAction;
import magicgis.newssystem.models.User;
import magicgis.newssystem.services.UserService;
import magicgis.newssystem.utils.DataUtils;
import magicgis.newssystem.utils.ValidateUtils;

@Controller
@Scope("prototype")
public class RegAction extends BaseAction<User> {

	private static final long serialVersionUID = 9150110980384938836L;
	private String confirmPassword;
	private static Logger logger = Logger.getLogger(ClassName.class);
	private ByteArrayInputStream byteArrayInputStream;
	@Autowired
	private UserService userService;
	private String validationCode = null;
	
	/**
	 * 跳转到登录页面
	 */
	public String reg() {
		return "to_regPage";
	}

	/**
	 * 得到验证码
	 */
	public String getRandomPictrue() {
		this.setByteArrayInputStream(vcu.getImage());
		sessionMap.put("regRandom", vcu.getVerificationCodeValue());// 取得随机字符串放入HttpSession
		return "validationCode_success";
	}

	public String doneReg() {
		model.setPassword(DataUtils.md5(model.getPassword()));
		userService.saveEntity(model);
		sessionMap.put("user", model);
		logger.info("用户注册成功：" + model.getUsername());
		return "to_NewsAction_getAllPassedNews";
	}

	public void validateDoneReg() {
		String regRandom = ((String) sessionMap.get("regRandom")).toLowerCase();
		if (!ValidateUtils.isValid(model.getUsername())) {
			addFieldError("username", "用户名不能为空");
		}
		if (!ValidateUtils.isValid(model.getPassword())) {
			addFieldError("password", "密码不能为空");
		}
		if (!ValidateUtils.isValid(model.getEmail())) {
			addFieldError("email", "E-mail不能为空");
		}
		if (model.getUsername().length() < 4) {
			addFieldError("username", "用户名不能少于四个字符");
		}
		if (model.getPassword().length() < 6) {
			addFieldError("password", "密码不能少于六个字符");
		}
		if (hasErrors()) {
			return;
		}
		if (!model.getPassword().equals(confirmPassword)) {
			addFieldError("password", "两次密码输入不一致");
			return;
		}
		if (userService.isTokenUp(model.getUsername())) {
			addFieldError("email", "用户名已经被占用");
		}
		if (!regRandom.equals(validationCode.toLowerCase())) {
			addFieldError("validationCode","验证码错误");
			return;
		} else {
			System.out.println("注册成功");
		}
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public ByteArrayInputStream getByteArrayInputStream() {
		return byteArrayInputStream;
	}

	public void setByteArrayInputStream(
			ByteArrayInputStream byteArrayInputStream) {
		this.byteArrayInputStream = byteArrayInputStream;
	}

	public String getValidationCode() {
		return validationCode;
	}

	public void setValidationCode(String validationCode) {
		this.validationCode = validationCode;
	}

}
