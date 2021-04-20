package hr.fer.apptownfunk.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Exhibits {
	/**
	 * Id of the exhibition object
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int exhibitId;

	/**
	 * Detailed description of exhibition object
	 */
	@Column(nullable = false, length = 10000)

	private String description;

	/**
	 * Name of exhibition object
	 */
	@Column(nullable = false)
	private String name;

	@Column(nullable = false)
	private String audio_path;

	@Column(nullable = false)
	private String image_path;

	protected Exhibits() {
		super();
	}

	public Exhibits(int exhibitId, String description, String name, String audio_path, String image_path) {
		super();
		this.exhibitId = exhibitId;
		this.description = description;
		this.name = name;
		this.audio_path = audio_path;
		this.image_path = image_path;
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
	 * @param name
	 *            the name to set
	 */
	public void setName(String name) {
		this.name = name;
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

}
