package magicgis.newssystem.models;

import java.util.List;

public class Page<T> extends BaseEntity {

	private static final long serialVersionUID = -5688752889754349099L;
	// 当前页
	private int currentPage;
	// 每页个个数
	private int pageSize;
	// 总条数
	private int totalCount;
	// 总页数
	private int pageCount;
	// 实体类
	private List<T> list;

	public Page() {

	}

	public Page(int currentPage, int pageSize, int totalCount, List<T> list) {
		super();
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.list = list;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize <= 0 ? 10 : pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

}