package magicgis.newssystem.daos.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import magicgis.newssystem.models.News;
import magicgis.newssystem.models.Page;

@Repository("newsDao")
public class NewsDaoImpl extends BaseDaoImpl<News> {

	public List<News> getAllNewsByNewsType(Integer typeId) {
		String hql = "FROM News n WHERE n.newsType.id = ?";
		return this.findEntityByHQL(hql, typeId);
	}

	public Page<News> listAllNotPassedNewsPage(int pageNo, int pageSize) {
		String hql = "FROM News n WHERE n.state.id != 1 ORDER BY n.createTime desc";
		String hql2 = "SELECT count(*) FROM News n WHERE n.state.id != 1";
		return this.listPage(hql, hql2, pageNo, pageSize);
	}

	public Page<News> listAllNewsPage(int pageNo, int pageSize) {
		String hql = "FROM News n ORDER BY n.createTime desc";
		String hql2 = "SELECT count(*) FROM News";
		return this.listPage(hql, hql2, pageNo, pageSize);
	}

	public Page<News> getNews(Integer id, int pageNo, int pageSize) {
		String hql = "FROM News n WHERE n.newsType.id = " + id
				+ " and n.state.id = 1 ORDER BY n.createTime DESC";
		String hql2 = "SELECT count(*) FROM News n WHERE n.newsType.id = " + id
				+ " and n.state.id = 1";
		return this.listPage(hql, hql2, pageNo, pageSize);
	}

	public List<News> geHotNews() {
		String hql = "FROM News n WHERE n.state.id = 1 ORDER BY n.count DESC, n.createTime DESC";
		return this.findLimitEntityByHQL(hql, 0, 10);
	}

	public List<News> getRecentNews(int id, int maxResult) {
		String hql = "FROM News n where n.newsType.id = ? and n.state.id = 1 ORDER BY n.createTime DESC";
		return this.findLimitEntityByHQL(hql, 0, maxResult, id);
	}
}
