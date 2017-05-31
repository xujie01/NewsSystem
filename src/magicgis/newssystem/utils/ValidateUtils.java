package magicgis.newssystem.utils;

import java.util.Collection;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import magicgis.newssystem.actions.BaseAction;
import magicgis.newssystem.aware.AdminAware;
import magicgis.newssystem.models.security.Admin;
import magicgis.newssystem.models.security.Right;
import magicgis.newssystem.utils.ValidateUtils;

public final class ValidateUtils {
	
	private ValidateUtils(){
		
	}

	/**
	 * 判断字符串的有效性
	 */
	public static boolean isValid(String str) {
		if (str == null || "".equals(str.trim())) {
			return false;
		}
		return true;
	}

	/**
	 * 判断集合的有效性
	 */
	@SuppressWarnings("rawtypes")
	public static boolean isValid(Collection collection) {
		if (collection == null || collection.isEmpty()) {
			return false;
		}
		return true;
	}

	/**
	 * 判断数组是否有效
	 */
	public static boolean isValid(Object[] arr) {
		if (arr == null || arr.length == 0) {
			return false;
		}
		return true;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static boolean hasRight(String nameSpace, String actionName,
			HttpServletRequest req, BaseAction baseAction) {
		if (!ValidateUtils.isValid(nameSpace) || "/".equals(nameSpace)) {
			nameSpace = "";
		}
		// 将超链接的参数部分滤掉 ?xxxx
		if (actionName != null && actionName.contains("?")) {
			actionName = actionName.substring(0, actionName.indexOf("?"));
		}
		String url = nameSpace + "/" + actionName;
		HttpSession session = req.getSession();

		ServletContext sc = session.getServletContext();
		Map<String, Right> map = (Map<String, Right>) sc
				.getAttribute("all_rights_map");
		Right r = map.get(url);
		// 公共资源?
		if (r == null || r.isCommon()) {
			return true;
		} else {
			Admin admin = (Admin) session.getAttribute("admin");
			// 登陆?
			if (admin == null) {
				return false;
			} else {
				// userAware处理
				if (baseAction != null && baseAction instanceof AdminAware) {
					((AdminAware) baseAction).setAdmin(admin);
				}
				// 有权限?
				if (admin.hasRight(r)) {
					return true;
				} else {
					return false;
				}
			}
		}
	}
}
