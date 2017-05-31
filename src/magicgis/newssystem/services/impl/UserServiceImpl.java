package magicgis.newssystem.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import magicgis.newssystem.daos.impl.CommentDaoImpl;
import magicgis.newssystem.daos.impl.UserDaoImpl;
import magicgis.newssystem.daos.impl.VisitorCounterDaoImpl;
import magicgis.newssystem.models.User;
import magicgis.newssystem.services.UserService;
import magicgis.newssystem.utils.ValidateUtils;

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements
		UserService {

	@Autowired
	private UserDaoImpl userDao;
	@Autowired
	private CommentDaoImpl commentDao;
	@Autowired
	private VisitorCounterDaoImpl visitorCounterDao;
	/**
	 * 检测用户名是否被占用
	 */
	public boolean isTokenUp(String str) {
		List<User> list = userDao.isTokenUp(str);
		if (!ValidateUtils.isValid(list)) {
			return false;
		}
		return true;
	}

	/**
	 * 检测是否为用户
	 */
	@Override
	public User isUser(String username, String password) {
		User user = userDao.isUser(username, password);
		return user;
	}

	@Override
	public void deleteUser(Integer id) {
		if (id != null && id > 0) {
			commentDao.deleteAllCommentByUserId(id);
			visitorCounterDao.deleteCounterByUserId(id);
			User user = userDao.getEntity(id);
			if (user != null) {
				userDao.deleteEntity(user);
			}
		}
	}
}
