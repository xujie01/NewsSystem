package magicgis.newssystem.services;

import java.util.List;
import java.util.Set;

import magicgis.newssystem.models.Page;
import magicgis.newssystem.models.security.Right;

public interface RightService extends BaseService<Right> {

	public void saveOrUpdateRight(Right model);

	public void appendRightByURL(String url);

	public void batchSaveRight(List<Right> allRights);

	public List<Right> findRightsInRange(Integer[] ownRightIds);

	public List<Right> findRightsNotInRange(Set<Right> rights);

	public int getMaxRightPos();

	public Page<Right> listAllRightPage(int i, int pageSize);

}
