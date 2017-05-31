package magicgis.newssystem.services.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;
import org.springframework.stereotype.Service;

import magicgis.newssystem.daos.impl.AdminDaoImpl;
import magicgis.newssystem.daos.impl.CommentDaoImpl;
import magicgis.newssystem.daos.impl.NewsDaoImpl;
import magicgis.newssystem.daos.impl.StateDaoImpl;
import magicgis.newssystem.daos.impl.VisitorCounterDaoImpl;
import magicgis.newssystem.models.News;
import magicgis.newssystem.models.Page;
import magicgis.newssystem.models.State;
import magicgis.newssystem.models.security.Admin;
import magicgis.newssystem.services.NewsService;

@Service("newsService")
public class NewsServiceImpl extends BaseServiceImpl<News> implements
		NewsService {

	@Autowired
	private NewsDaoImpl newsDao;
	@Autowired
	private CommentDaoImpl commentDao;
	@Autowired
	private AdminDaoImpl adminDao;
	@Autowired
	private VisitorCounterDaoImpl visitorCounterDao;
	@Autowired
	private StateDaoImpl stateDao;
	@Autowired
	private TaskExecutor taskExecutor;

	private News news = null;
	private Admin admin = null;
	private State state = null;
	private Page<News> page = null;

	@Override
	public Page<News> getNews(Integer id, int pageNo, int pageSize) {
		page = newsDao.getNews(id, pageNo, pageSize);
		return page;
	}

	@Override
	public News getViewNews(Integer id) {
		news = newsDao.getEntity(id);
		return news;
	}

	@Override
	public void deleteNews(Integer id) {
		news = this.getEntity(id);
		commentDao.deleteCommentByNewsId(id);
		visitorCounterDao.deleteCounterByNewsId(id);
		this.deleteEntity(news);
	}

	@Override
	public void saveNews(News model, Integer adminId) {
		admin = adminDao.getEntity(adminId);
		state = stateDao.getEntity(3);
		if (model.getId() != null && model.getId() > 0) {
			model.setAdmin(admin);
		} else if (model.getId() == null) {
			model.setCreateTime(new Date());
			model.setAdmin(admin);
			model.setCount(0);
			model.setState(state);
		}
		this.saveOrUpdateEntity(model);
	}

	// 所有的新闻分页操作
	@Override
	public Page<News> listAllNewsPage(int pageNo, int pageSize) {
		page = newsDao.listAllNewsPage(pageNo, pageSize);
		if (page.getList() != null && page.getList().size() > 0) {
			for (News news : page.getList()) {
				news.getNewsType().getTypeName();
				news.getAdmin().getUsername();
				news.getState().getStateName();
			}
		}
		return page;
	}

	// 未通过的新闻分页操作
	@Override
	public Page<News> listAllNotPassedNewsPage(int pageNo, int pageSize) {
		page = newsDao.listAllNotPassedNewsPage(pageNo, pageSize);
		if (page.getList() != null && page.getList().size() > 0) {
			for (News news : page.getList()) {
				news.getNewsType().getTypeName();
				news.getAdmin().getUsername();
				news.getState().getStateName();
			}
		}
		return page;
	}

	@Override
	public List<News> getHotNews() {
		return newsDao.geHotNews();
	}

	@Override
	public List<News> getRecentNews(int id, int maxResult) {
		return newsDao.getRecentNews(id, maxResult);
	}
}
