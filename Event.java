package by.burim.doing.entities;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Event {

	private Integer id;

	private String title;

	private Date startDate;

	private String description;
	
	//@Column(name ="address")
	/*@ManyToMany(fetch = FetchType.LAZY, cascade = {javax.persistence.CascadeType.ALL})//связующая таблица
	@JoinTable (name= "address_to_event", joinColumns = {
			@JoinColumn(name = "users", nullable = false, updatable = false)},
			inverseJoinColumns = {@JoinColumn(name = "address", nullable = false, updatable = false)})*/
	//private List<Address> address;
	
	//private Set<User> users;
	
	public Event() {
	}

	@Id
	@Column 
    @GeneratedValue (strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column (name="start_date")
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	@Column(name="title")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name="description")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	//@ManyToMany(mappedBy = "events")
	/*public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}*/

}
