package magicgis.newssystem.services;

import java.util.List;

import magicgis.newssystem.models.State;

public interface StateService extends BaseService<State>{

	public List<State> getAllStates();

}
