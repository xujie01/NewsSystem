package magicgis.newssystem.actions.impl;

import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javassist.bytecode.stackmap.TypeData.ClassName;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import magicgis.newssystem.actions.BaseAction;
import magicgis.newssystem.models.User;
import magicgis.newssystem.services.UserService;

@Controller
@Scope("prototype")
public class UserAction extends BaseAction<User> {

	private static final long serialVersionUID = 2206176605307115958L;
	@Autowired
	private UserService userService;
	private List<User> allUsers = null;
	private static Logger logger = Logger.getLogger(ClassName.class);

	public String loginout() {
		sessionMap.put("user", null);
		httpSession.invalidate();
		return "to_NewsAction_getAllPassedNews";
	}

	public String getAllUsers() {
		allUsers = userService.findAllEntities();
		requestMap.put("allUsers", allUsers);
		return "to_userListPage";
	}

	public String deleteUser() {
		try {
			if (model.getId() != null && model.getId() > 0) {
				userService.deleteUser(model.getId());
				inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
				logger.info("管理员删除用户：" + model.getUsername());
			}
		} catch (Exception e) {
			try {
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		}

		return "ajax_success";

	}

}
