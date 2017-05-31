package magicgis.newssystem.services.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import magicgis.newssystem.models.State;
import magicgis.newssystem.services.StateService;

@Service("stateService")
public class StateServiceImpl extends BaseServiceImpl<State> implements StateService{

	@Override
	public List<State> getAllStates() {
		return this.findAllEntities();
	}

}
