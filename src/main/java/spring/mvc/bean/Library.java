package spring.mvc.bean;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="LIBRARY")
public class Library implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	@Column(name="ID")	
	private int id;
	
	@NotEmpty	
    @Size(min=5, max=100)
	@Column(name="LIB_NAME")	
	private String libName;
	
	@NotEmpty
    @Size(min=0, max=60)
	@Column(name="LIB_CREATOR")	
	private String libCreator;
	
	@NotEmpty
    @Size(min=5, max=20)
	@Column(name="LIB_CREATE_DATE")	
	private Date libCreateDt;

	@NotEmpty
    @Size(min=5, max=40)
	@Column(name="LIB_FILENAME")	
	private String libFilename;
	
	@NotEmpty
    @Size(min=5, max=400)
	@Column(name="LIB_DESCRITPION")	
	private String libDescription;

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the libName
	 */
	public String getLibName() {
		return libName;
	}

	/**
	 * @param libName the libName to set
	 */
	public void setLibName(String libName) {
		this.libName = libName;
	}

	/**
	 * @return the libCreator
	 */
	public String getLibCreator() {
		return libCreator;
	}

	/**
	 * @param libCreator the libCreator to set
	 */
	public void setLibCreator(String libCreator) {
		this.libCreator = libCreator;
	}

	/**
	 * @return the libCreateDt
	 */
	public Date getLibCreateDt() {
		return libCreateDt;
	}

	/**
	 * @param date the libCreateDt to set
	 */
	public void setLibCreateDt(Date date) {
		this.libCreateDt = date;
	}

	/**
	 * @return the libFilename
	 */
	public String getLibFilename() {
		return libFilename;
	}

	/**
	 * @param libFilename the libFilename to set
	 */
	public void setLibFilename(String libFilename) {
		this.libFilename = libFilename;
	}

	/**
	 * @return the libDescription
	 */
	public String getLibDescription() {
		return libDescription;
	}

	/**
	 * @param libDescription the libDescription to set
	 */
	public void setLibDescription(String libDescription) {
		this.libDescription = libDescription;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Library [id=" + id + ", libName=" + libName + ", libCreator=" + libCreator + ", libCreateDt="
				+ libCreateDt + ", libFilename=" + libFilename + ", libDescription=" + libDescription + "]";
	}
		
 
}