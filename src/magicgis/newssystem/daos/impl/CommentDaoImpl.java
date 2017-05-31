package magicgis.newssystem.daos.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import magicgis.newssystem.models.Comment;

@Repository("commentDao")
public class CommentDaoImpl extends BaseDaoImpl<Comment> {

	public List<Comment> getViewNewsAllComment(Integer newsId) {
		String hql = "FROM Comment c WHERE c.news.id = ?";
		return this.findEntityByHQL(hql, newsId);
	}

	public void deleteCommentByNewsId(Integer id) {
		String hql = "FROM Comment c WHERE c.news.id = ?";
		List<Comment> comments = this.findEntityByHQL(hql, id);
		if (comments != null) {
			for (Comment comment : comments) {
				this.deleteEntity(comment);
			}
		}
	}

	public void deleteAllCommentByUserId(Integer id) {
		String hql = "FROM Comment c WHERE c.user.id = ?";
		List<Comment> list = this.findEntityByHQL(hql, id);
		if (list != null) {
			for (Comment comment : list) {
				this.deleteEntity(comment);
			}
		}
	}

}
