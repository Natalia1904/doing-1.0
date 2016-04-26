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

@Entity
@Table(name="roles")
public class Role {

	private Integer id;

	private String roleName;
	
	private Set<User> users = new HashSet<>();

	public Role() {
		super();
	}

	public Role(Integer id, String roleName) {
		this.id = id;
		this.roleName = roleName;
	}

	@Id
    @Column
    @GeneratedValue (strategy = GenerationType.IDENTITY)
	public Integer  getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	@Column(name="role_name")
	public String getRoleName() {
		return roleName;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "role")
	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}
}
