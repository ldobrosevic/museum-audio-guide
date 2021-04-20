package hr.fer.apptownfunk.models;

import java.io.Serializable;

public class ExhObjKeys implements Serializable {
	private static final long serialVersionUID = 7556018637857109843L;

	private int exhibitionId;
	private int exhibitId;

	public ExhObjKeys() {
		
	}
	public ExhObjKeys(int exhibitionId, int exhibitId) {
		super();
		this.exhibitionId = exhibitionId;
		this.exhibitId = exhibitId;
	}

	public int getExhibitId() {
		return exhibitId;
	}

	public void setExhibitId(int exhibitId) {
		this.exhibitId = exhibitId;
	}

	public int getExhibitionId() {
		return exhibitionId;
	}

	public void setExhibitionId(int exhibitionId) {
		this.exhibitionId = exhibitionId;
	}

}