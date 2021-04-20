package hr.fer.apptownfunk.models;

public enum TypeOfExhibition {
	ART("Umjetnost"), AEROSPACE("Zrakoplovstvo"), ANTHROPOLOGY("Antropologija"), ARCHITECTURE("Arhitektura"),
	ASTRONOMY("Astronomija"), AUTOMOBILE("Automobili"), DINOSAUR("Dinosauri"), GEOLOGY("Geologija"), 
	HISTORY("Povijest"), INDUSTRY("Industrija"),LITERATURE("Književnost"),MUSIC("Glazba"), 
	SCIENCE("Znanost"), SPORT("Sportovi"), TECHNOLOGY("Tehnologija"),	MISCELLANEOUS("Razno");
	
	public String type;

	TypeOfExhibition(String type) {
		this.type = type;
	}

	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}

	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}
	
	
}
