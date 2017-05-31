package magicgis.newssystem.models;

import java.util.Date;

import magicgis.newssystem.models.security.Admin;

/**
 * 新闻
 */
public class News extends BaseEntity {

	private static final long serialVersionUID = 6136633977314509659L;
	// 标题
	private String title;
	// 关键词
	private String keyword;
	// 缩略图，用于轮播器
	private String thumbnail;
	// 作者
	private String author;
	// 来源
	private String source;
	// 正文
	private String content;
	// 创建时间
	private Date createTime = new Date();
	// 创建者
	private Admin admin;
	// 新闻栏目
	private NewsType newsType;
	// 状态
	private State state;
	// 访问次数
	private Integer count;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public NewsType getNewsType() {
		return newsType;
	}

	public void setNewsType(NewsType newsType) {
		this.newsType = newsType;
	}

	public State getState() {
		return state;
	}

	public void setState(State state) {
		this.state = state;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
}
