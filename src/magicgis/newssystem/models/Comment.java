package magicgis.newssystem.models;

import java.util.Date;

/**
 * 评论
 */
public class Comment extends BaseEntity {

	private static final long serialVersionUID = -5811934855848613523L;
	private String content;
	// 评论时间
	private Date createTime = new Date();
	// 评论者
	private User user;
	// 评论者的IP地址
	private String ipAddress;
	// 评论的新闻
	private News news;
	
	public Comment() {
		
	}

	public Comment(String content, Date createTime, User user,
			String ipAddress, News news) {
		super();
		this.content = content;
		this.createTime = createTime;
		this.user = user;
		this.ipAddress = ipAddress;
		this.news = news;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
}
