package magicgis.newssystem.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import magicgis.newssystem.daos.impl.VisitorCounterDaoImpl;
import magicgis.newssystem.models.VisitorCounter;
import magicgis.newssystem.services.VisitorCounterService;

@Service("visitorCounterService")
public class VisitorCounterServiceImpl extends BaseServiceImpl<VisitorCounter>
		implements VisitorCounterService {

	@Autowired
	private VisitorCounterDaoImpl visitorCounterDao;

}
