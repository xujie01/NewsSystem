package magicgis.newssystem.daos.impl;

import org.springframework.stereotype.Repository;

import magicgis.newssystem.models.security.Admin;
import magicgis.newssystem.utils.DataUtils;

@Repository("adminDao")
public class AdminDaoImpl extends BaseDaoImpl<Admin> {

	public Admin isAdmin(String username, String password) {
		String hql = "FROM Admin WHERE username = ? AND password= ?";
		Admin admin = (Admin) getSession().createQuery(hql).setString(0, username)
				.setString(1, DataUtils.md5(password)).uniqueResult();
		return admin;
	}

	public Admin findAdminByUsername(String username) {
		String hql = "FROM Admin a where a.username = ?";
		return (Admin) this.uniqueResult(hql, username);
	}

}
