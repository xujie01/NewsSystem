package magicgis.newssystem.services;

import java.util.List;

import magicgis.newssystem.models.NewsType;

public interface NewsTypeService extends BaseService<NewsType> {

	public List<NewsType> getAllNewsTypes();

	public void deleteNewsType(Integer id);

	public void saveNewsType(NewsType model, Integer adminId);

}
