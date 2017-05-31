package magicgis.newssystem.services.impl;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import magicgis.newssystem.daos.BaseDao;
import magicgis.newssystem.models.Page;
import magicgis.newssystem.services.BaseService;

@Service("baseService")
public abstract class BaseServiceImpl<T> implements BaseService<T> {
	@Autowired
	private BaseDao<T> baseDao;
	private Class<T> clazz;

	@SuppressWarnings("unchecked")
	public BaseServiceImpl() {
		ParameterizedType type = (ParameterizedType) this.getClass()
				.getGenericSuperclass();
		clazz = (Class<T>) type.getActualTypeArguments()[0];
	}

	@SuppressWarnings("rawtypes")
	public List executeSQLQuery(Class clazz, String sql, Object... objects) {
		return baseDao.executeSQLQuery(clazz, sql, objects);
	}

	public void saveEntity(T t) {
		baseDao.saveEntity(t);
	}

	public void saveOrUpdateEntity(T t) {
		baseDao.saveOrUpdateEntity(t);
	}

	public void executeSQL(String sql, Object... objects) {
		baseDao.executeSQL(sql, objects);
	}

	public void updateEntity(T t) {
		baseDao.updateEntity(t);
	}

	public void deleteEntity(T t) {
		baseDao.deleteEntity(t);
	}

	public void batchEntityByHQL(String hql, Object... objects) {
		baseDao.batchEntityByHQL(hql, objects);
	}

	public T loadEntity(Integer id) {
		return baseDao.loadEntity(id);
	}

	public T getEntity(Integer id) {
		return baseDao.getEntity(id);
	}

	public List<T> findEntityByHQL(String hql, Object... objects) {
		return baseDao.findEntityByHQL(hql, objects);
	}

	public List<T> findAllEntities() {
		String hql = "from " + clazz.getSimpleName();
		return this.findEntityByHQL(hql);
	}

	@Override
	public Page<T> listPage(String hql,String hql2,int pageNo, int pageSize) {
		return baseDao.listPage(hql, hql2, pageNo, pageSize);
	}
}
