package magicgis.newssystem.services;

import java.util.List;

import magicgis.newssystem.models.Page;

public interface BaseService<T> {

	public void saveEntity(T t);

	public void saveOrUpdateEntity(T t);

	public void updateEntity(T t);

	public void deleteEntity(T t);

	public void batchEntityByHQL(String hql, Object... objects);

	public T loadEntity(Integer id);

	public T getEntity(Integer id);

	public List<T> findEntityByHQL(String hql, Object... objects);

	public List<T> findAllEntities();

	public void executeSQL(String sql, Object... objects);

	@SuppressWarnings("rawtypes")
	public List executeSQLQuery(Class clazz, String sql, Object... objects);

	public Page<T> listPage(String hql, String hql2, int pageNo, int pageSize);

}
