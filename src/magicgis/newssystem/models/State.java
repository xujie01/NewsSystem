package magicgis.newssystem.models;

public class State extends BaseEntity{

	private static final long serialVersionUID = 5861527337652310418L;
	private String stateName;

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

}
