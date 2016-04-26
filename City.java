package by.burim.doing.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity //сохр. об. автомат. в базу данных
@Table(name="cities") // !!!указывать имя, если оно не совпадает с названием таб. обязательно
public class City {

	private Integer id;

	private String name;

	Set<Street> streets = new HashSet<>();

	public City() {
		super();
	}

	public City(Integer id) {
		this.id = id;
	}
	
	@Id //для id обязательно
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column // для каждого элемента
	public Integer getId() {
		return id;
	}
	
	@Column
	public String getName() {
		return name;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "city")
	public Set<Street> getStreets() {
		return streets;
	}

	public void setStreets(Set<Street> streets) {
		this.streets = streets;
	}
}
