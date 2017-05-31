package magicgis.newssystem.daos.impl;

import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Repository;

import magicgis.newssystem.models.Page;
import magicgis.newssystem.models.security.Right;
import magicgis.newssystem.utils.DataUtils;
import magicgis.newssystem.utils.StringUtils;

@Repository("rightDao")
public class RightDaoImpl extends BaseDaoImpl<Right> {

	public Object[] findMaxRight() {
		String hql = "select max(r.rightPos),max(r.rightCode) from Right r "
				+ "where r.rightPos = (select max(rr.rightPos) from Right rr)";
		return (Object[]) this.uniqueResult(hql);
	}

	public Right appendRightByURL(String url) {
		String hql = "from Right r where r.rightUrl = ?";
		return (Right) this.uniqueResult(hql, url);
	}

	public void batchSaveRight(String rightName, boolean common, Integer id) {
		String hql = "update Right r set r.rightName = ? , r.common = ? where r.id = ? ";
		this.batchEntityByHQL(hql, rightName, common, id);
	}

	public List<Right> findRightsInRange(Integer[] ownRightIds) {
		String hql = "from Right r where r.id in ("
				+ StringUtils.arr2String(ownRightIds) + ")";
		return this.findEntityByHQL(hql);
	}

	public List<Right> findRightsNotInRange(Set<Right> rights) {
		String hql = "from Right r where r.id not in ("
				+ DataUtils.extractRightIds(rights) + ")";
		return this.findEntityByHQL(hql);
	}

	public Integer getMaxRightPos() {
		String hql = "select max(r.rightPos) from Right r";
		return (Integer) this.uniqueResult(hql);
	}

	public Page<Right> listAllNewsPage(int pageNo, int pageSize) {
		String hql = "FROM Right r";
		String hql2 = "SELECT count(*) FROM Right";
		return this.listPage(hql, hql2, pageNo, pageSize);
	}

}
