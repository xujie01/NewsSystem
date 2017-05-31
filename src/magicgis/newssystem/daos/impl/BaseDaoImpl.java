package magicgis.newssystem.daos.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import magicgis.newssystem.daos.BaseDao;
import magicgis.newssystem.models.Page;
import magicgis.newssystem.utils.ReflectionUtils;

@SuppressWarnings("unchecked")
@Repository("baseDao")
public abstract class BaseDaoImpl<T> implements BaseDao<T> {

	@Autowired
	private SessionFactory sessionFactory;
	private Class<T> clazz;

	public BaseDaoImpl() {
		clazz = ReflectionUtils.getSuperGenericType(this.getClass());
	}

	public void saveEntity(T t) {
		getSession().save(t);
	}

	public void saveOrUpdateEntity(T t) {
		getSession().saveOrUpdate(t);
	}

	public void executeSQL(String sql, Object... objects) {
		SQLQuery sqlQuery = getSession().createSQLQuery(sql);
		for (int i = 0; i < objects.length; i++) {
			sqlQuery.setParameter(i, objects[i]);
		}
		sqlQuery.executeUpdate();
	}

	@SuppressWarnings("rawtypes")
	public List<T> executeSQLQuery(Class clazz, String sql, Object... objects) {
		SQLQuery sqlQuery = getSession().createSQLQuery(sql);
		// 添加实体类
		if (clazz != null) {
			sqlQuery.addEntity(clazz);
		}
		for (int i = 0; i < objects.length; i++) {
			sqlQuery.setParameter(i, objects[i]);
		}
		return sqlQuery.list();
	}

	public void updateEntity(T t) {
		getSession().update(t);
	}

	public void deleteEntity(T t) {
		getSession().delete(t);
	}

	public void batchEntityByHQL(String hql, Object... objects) {
		Query query = getSession().createQuery(hql);
		for (int i = 0; i < objects.length; i++) {
			query.setParameter(i, objects[i]);
		}
		query.executeUpdate();
	}

	public T loadEntity(Integer id) {
		return (T) getSession().load(clazz, id);
	}

	public T getEntity(Integer id) {
		return (T) getSession().get(clazz, id);
	}

	public List<T> findEntityByHQL(String hql, Object... objects) {
		Query query = getSession().createQuery(hql);
		for (int i = 0; i < objects.length; i++) {
			query.setParameter(i, objects[i]);
		}
		return query.list();
	}

	public List<T> findLimitEntityByHQL(String hql, int start, int end,
			Object... objects) {
		Query query = getSession().createQuery(hql);
		for (int i = 0; i < objects.length; i++) {
			query.setParameter(i, objects[i]);
		}
		query.setFirstResult(start);
		query.setMaxResults(end);
		return query.list();
	}

	public Object uniqueResult(String hql, Object... objects) {
		Query query = getSession().createQuery(hql);
		for (int i = 0; i < objects.length; i++) {
			query.setParameter(i, objects[i]);
		}
		return query.uniqueResult();
	}

	public Page<T> listPage(String hql, String hql2, int pageNo, int pageSize) {
		Page<T> page = null;
		int totalCount = new Long((Long) this.uniqueResult(hql2)).intValue();
		Query q = getSession().createQuery(hql);
		q.setFirstResult((pageNo - 1) * pageSize);
		q.setMaxResults(pageSize);
		List<T> list = q.list();
		page = new Page<T>(pageNo, pageSize, totalCount, list);
		if (totalCount == 0) {
			page.setCurrentPage(1);
			page.setPageCount(1);
		} else {
			if (totalCount % pageSize == 0) {
				page.setPageCount(totalCount / pageSize);
			} else {
				page.setPageCount(totalCount / pageSize + 1);
			}
		}
		return page;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

}
