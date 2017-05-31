package magicgis.newssystem.services.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import magicgis.newssystem.daos.impl.CommentDaoImpl;
import magicgis.newssystem.daos.impl.NewsDaoImpl;
import magicgis.newssystem.models.Comment;
import magicgis.newssystem.models.News;
import magicgis.newssystem.models.User;
import magicgis.newssystem.services.CommentService;

@Service("commentService")
public class CommentServiceImpl extends BaseServiceImpl<Comment> implements
		CommentService {

	@Autowired
	private CommentDaoImpl commentDao;
	@Autowired
	private NewsDaoImpl newsDao;
	private News news = null;
	private Comment comment = null;

	@Override
	public List<Comment> getViewNewsAllComment(Integer newsId) {
		if (newsId != null) {
			List<Comment> allComments = commentDao
					.getViewNewsAllComment(newsId);
			for (Comment comment : allComments) {
				comment.getNews().setContent("");
			}
			return allComments;
		}
		return null;
	}

	@Override
	public void publishComment(String content, String ipAddress,
			Integer newsId, User user) {
		if (newsId != null && newsId > 0) {
			news = newsDao.getEntity(newsId);
		}
		comment = new Comment(content, new Date(), user, ipAddress, news);
		this.saveEntity(comment);
	}

	@Override
	public void deleteComment(Integer commentId) {
		if (commentId != null) {
			Comment comment = this.getEntity(commentId);
			this.deleteEntity(comment);
		}
	}

}
