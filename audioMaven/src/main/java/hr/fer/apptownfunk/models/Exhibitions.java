package hr.fer.apptownfunk.models;


import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Exhibitions {
	/**
	 * Id of the exhibit
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int exhibitionId;

	/**
	 * Name of the exhibit
	 */
	@Column(nullable = false)
	private String nameOfExhibition;

	/**
	 * Description of the exhibit
	 */
	@Column(nullable = false, length = 10000)
	private String description;

	/**
	 * When does exhibit start
	 */
	@Column(nullable = false)
	private Date dateBegin;

	/**
	 * When does exhibit end
	 */
	@Column(nullable = false)
	private Date dateEnd;

	@Column(nullable = false)
	private TypeOfExhibition typeofExhibition;

	protected Exhibitions() {
		super();
	}

	public Exhibitions(int exhibitionId, String nameOfExhibition, String description, Date dateBegin, Date dateEnd,
			TypeOfExhibition typeofExhibition) {
		super();
		this.exhibitionId = exhibitionId;
		this.nameOfExhibition = nameOfExhibition;
		this.description = description;
		this.dateBegin = dateBegin;
		this.dateEnd = dateEnd;
		this.typeofExhibition = typeofExhibition;
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

	/**
	 * @return the nameOfExhibition
	 */
	public String getNameOfExhibition() {
		return nameOfExhibition;
	}

	/**
	 * @param nameOfExhibition
	 *            the nameOfExhibition to set
	 */
	public void setNameOfExhibition(String nameOfExhibition) {
		this.nameOfExhibition = nameOfExhibition;
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
	 * @return the dateBegin
	 */
	public Date getDateBegin() {
		return dateBegin;
	}

	/**
	 * @param dateBegin
	 *            the dateBegin to set
	 */
	public void setDateBegin(Date dateBegin) {
		this.dateBegin = dateBegin;
	}

	/**
	 * @return the dateEnd
	 */
	public Date getDateEnd() {
		return dateEnd;
	}

	/**
	 * @param dateEnd
	 *            the dateEnd to set
	 */
	public void setDateEnd(Date dateEnd) {
		this.dateEnd = dateEnd;
	}

	/**
	 * @return the type
	 */
	public TypeOfExhibition getTypeofExhibition() {
		return typeofExhibition;
	}

	/**
	 * @param type
	 *            the type to set
	 */
	public void setTypeofExhibition(TypeOfExhibition type) {
		this.typeofExhibition = type;
	}

}
