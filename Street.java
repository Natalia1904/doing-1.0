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

@Entity //сохр. об. автомат. в базу данных
@Table(name="streets")
public class Street {

	private Integer id;

	private String name;

	private City city;

	public Street() {
		super();
		city = new City();
	}

	public Street(Integer id, String name) {
		this.id = id;
		this.name = name;
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

	@Column
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "city_id", unique=false, nullable=true, insertable=true, updatable=true)
	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}
}
