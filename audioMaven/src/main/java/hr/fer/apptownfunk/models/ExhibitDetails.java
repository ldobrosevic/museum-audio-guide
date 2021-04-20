package hr.fer.apptownfunk.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ExhibitDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int detailId;

	@Column(nullable = false)
	private int exhibitId;

	@Column(nullable = false, length = 10000)
	private String description;
	
	@Column(nullable = false)
	private String name;

	@Column(nullable = false)
	private String audio_path;

	@Column(nullable = false)
	private String image_path;

	protected ExhibitDetails() {

	}

	public ExhibitDetails(int detailId, int exhibitionId, String description, String audio_path, String image_path,
			String name) {
		super();
		this.detailId = detailId;
		this.exhibitId = exhibitionId;
		this.description = description;
		this.audio_path = audio_path;
		this.image_path = image_path;
		this.name = name;
	}

	/**
	 * @return the exhibitionId
	 */
	public int getExhibitId() {
		return exhibitId;
	}

	/**
	 * @param exhibitionId
	 *            the exhibitionId to set
	 */
	public void setExhibitId(int exhibitionId) {
		this.exhibitId = exhibitionId;
	}

	/**
	 * @return the audio_path
	 */
	public String getAudio_path() {
		return audio_path;
	}

	/**
	 * @param audio_path
	 *            the audio_path to set
	 */
	public void setAudio_path(String audio_path) {
		this.audio_path = audio_path;
	}

	/**
	 * @return the image_path
	 */
	public String getImage_path() {
		return image_path;
	}

	/**
	 * @param image_path
	 *            the image_path to set
	 */
	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}

	/**
	 * @return the detailId
	 */
	public int getDetailId() {
		return detailId;
	}

	/**
	 * @param detailId
	 *            the detailId to set
	 */
	public void setDetailId(int detailId) {
		this.detailId = detailId;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description
	 *            the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "ExhibitDetails [detailId=" + detailId + ", exhibitId=" + exhibitId + ", audio_path=" + audio_path
				+ ", image_path=" + image_path + "]";
	}
}
