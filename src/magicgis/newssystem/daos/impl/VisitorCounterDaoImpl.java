package magicgis.newssystem.daos.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import magicgis.newssystem.models.VisitorCounter;

@Repository("visitorCounterDao")
public class VisitorCounterDaoImpl extends BaseDaoImpl<VisitorCounter> {

	public void deleteCounterByNewsId(Integer id) {
		String hql = "FROM VisitorCounter v where v.news.id = ?";
		List<VisitorCounter> counters = this.findEntityByHQL(hql, id);
		if (counters != null) {
			for (VisitorCounter visitorCounter : counters) {
				this.deleteEntity(visitorCounter);
			}
		}
	}

	public void deleteCounterByUserId(Integer id) {
		String hql = "FROM VisitorCounter v where v.user.id = ?";
		List<VisitorCounter> counters = this.findEntityByHQL(hql, id);
		if (counters != null) {
			for (VisitorCounter visitorCounter : counters) {
				this.deleteEntity(visitorCounter);
			}
		}
	}

}
