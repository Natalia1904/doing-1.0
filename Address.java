package by.burim.doing.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name= "address")
public class Address {
	
	private Integer id;
	
	private City sity;
	
	private Street street;
	
	private Integer house;
	
	private Integer flat;
	
	private Integer corps;

	public Address() {
		super();
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "city_id")
	public City getSity() {
		return sity;
	}

	public void setSity(City sity) {
		this.sity = sity;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "street_id")
	public Street getStreet() {
		return street;
	}

	public void setStreet(Street street) {
		this.street = street;
	}

	@Column
	public Integer getHouse() {
		return house;
	}
	
	
	public void setHouse(Integer house) {
		this.house = house;
	}

	@Column
	public Integer getFlat() {
		return flat;
	}

	
	public void setFlat(Integer flat) {
		this.flat = flat;
	}

	@Column
	public Integer getCorps() {
		return corps;
	}

	public void setCorps(Integer corps) {
		this.corps = corps;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((corps == null) ? 0 : corps.hashCode());
		result = prime * result + ((flat == null) ? 0 : flat.hashCode());
		result = prime * result + ((house == null) ? 0 : house.hashCode());
		result = prime * result + ((sity == null) ? 0 : sity.hashCode());
		result = prime * result + ((street == null) ? 0 : street.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Address other = (Address) obj;
		if (corps == null) {
			if (other.corps != null)
				return false;
		} else if (!corps.equals(other.corps))
			return false;
		if (flat == null) {
			if (other.flat != null)
				return false;
		} else if (!flat.equals(other.flat))
			return false;
		if (house == null) {
			if (other.house != null)
				return false;
		} else if (!house.equals(other.house))
			return false;
		if (sity == null) {
			if (other.sity != null)
				return false;
		} else if (!sity.equals(other.sity))
			return false;
		if (street == null) {
			if (other.street != null)
				return false;
		} else if (!street.equals(other.street))
			return false;
		return true;
	}
}
