package magicgis.newssystem.models;

import java.util.Date;

import magicgis.newssystem.models.security.Admin;

/**
 * 栏目
 */
public class NewsType extends BaseEntity{

	private static final long serialVersionUID = 8881138029228255355L;
	// 栏目名称
	private String typeName;
	//栏目介绍
	private String introduction;
	// 创建者
	private Admin admin;
	// 栏目创建时间
	private Date createTime = new Date();

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

}
