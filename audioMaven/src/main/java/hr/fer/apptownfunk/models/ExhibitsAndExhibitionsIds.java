package hr.fer.apptownfunk.models;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;

@Entity
@IdClass(ExhObjKeys.class)
public class ExhibitsAndExhibitionsIds {

	/**
	 * object id
	 */
	@Id
	private int exhibitId;

	/**
	 * exhibit id
	 */
	@Id
	private int exhibitionId;

	protected ExhibitsAndExhibitionsIds() {
	}

	public ExhibitsAndExhibitionsIds(int exhibitionId, int exhibitId) {
		this.exhibitId = exhibitId;
		this.exhibitionId = exhibitionId;
	}

	/**
	 * @return the exhibitId
	 */
	public int getExhibitId() {
		return exhibitId;
	}

	/**
	 * @param exhibitId
	 *            the exhibitId to set
	 */
	public void setExhibitId(int exhibitId) {
		this.exhibitId = exhibitId;
	}

	/**
	 * @return the exhibitionId
	 */
	public int getExhibitionId() {
		return exhibitionId;
	}

	/**
	 * @param exhibitionId
	 *            the exhibitionId to set
	 */
	public void setExhibitionId(int exhibitionId) {
		this.exhibitionId = exhibitionId;
	}

}