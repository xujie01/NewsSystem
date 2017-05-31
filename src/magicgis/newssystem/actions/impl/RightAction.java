package magicgis.newssystem.actions.impl;

import java.util.ArrayList;
import java.util.List;

import javassist.bytecode.stackmap.TypeData.ClassName;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import magicgis.newssystem.actions.BaseAction;
import magicgis.newssystem.constant.WebConstant;
import magicgis.newssystem.models.Page;
import magicgis.newssystem.models.security.Right;
import magicgis.newssystem.services.RightService;

@Controller
@Scope("prototype")
public class RightAction extends BaseAction<Right> {

	private static final long serialVersionUID = -757699664708338343L;
	@Autowired
	private RightService rightService;
	private List<Right> allRights = new ArrayList<Right>();
	private static Logger logger = Logger.getLogger(ClassName.class);
	private Page<Right> p = null;
	private Integer page;
	private int pageSize = WebConstant.PAGE_SIZE;

	/**
	 * 批量更新权限
	 */
	public String batchUpdateRights() {
		rightService.batchSaveRight(allRights);
		return "to_RightAction_findAllRights";
	}

	/**
	 * 删除权限
	 */
	public String deleteRight() {
		Right right = rightService.getEntity(model.getId());
		rightService.deleteEntity(right);
		logger.info("删除权限：" + right.getRightName());
		return "to_RightAction_findAllRights";
	}

	/**
	 * 编辑权限
	 */
	public String editRight() {
		model = rightService.getEntity(model.getId());
		return "to_editRightPage";
	}

	/**
	 * 保存或更新权限
	 */
	public String saveOrUpdateRight() {
		rightService.saveOrUpdateRight(model);
		logger.info("保存或更新权限：" + model.getRightName());
		return "to_RightAction_findAllRights";
	}

	/**
	 * 查询出所有的权限
	 */
	public String findAllRights() {
		p = new Page<Right>();
		if (page == null) {
			p = rightService.listAllRightPage(1, pageSize);
		} else {
			p = rightService.listAllRightPage(page, pageSize);
		}
		requestMap.put("page", p);
		return "to_rightListPage";
	}

	/**
	 * 跳转到增加权限的页面
	 */
	public String toAddRightPage() {
		return "to_addRightPage";
	}

	public List<Right> getAllRights() {
		return allRights;
	}

	public void setAllRights(List<Right> allRights) {
		this.allRights = allRights;
	}
	
	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

}
