package magicgis.newssystem.services;

import java.util.List;

import magicgis.newssystem.models.Comment;
import magicgis.newssystem.models.User;

public interface CommentService extends BaseService<Comment> {

	public List<Comment> getViewNewsAllComment(Integer newsId);

	public void publishComment(String content, String ipAddress,
			Integer newsId, User user);

	public void deleteComment(Integer commentId);

}
