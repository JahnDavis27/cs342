package models;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by jrd58 on 5/12/2017.
 */
@Entity
public class Player {
    private long id;
    private String firstname;
    private String lastname;
    private Double heightinches;
    private Long weightlbs;
    private Long position;
    private Long salary;

    @Id
    @Column(name = "ID")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "FIRSTNAME")
    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    @Basic
    @Column(name = "LASTNAME")
    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    @Basic
    @Column(name = "HEIGHTINCHES")
    public Double getHeightinches() {
        return heightinches;
    }

    public void setHeightinches(Double heightinches) {
        this.heightinches = heightinches;
    }

    @Basic
    @Column(name = "WEIGHTLBS")
    public Long getWeightlbs() {
        return weightlbs;
    }

    public void setWeightlbs(Long weightlbs) {
        this.weightlbs = weightlbs;
    }

    @Basic
    @Column(name = "POSITION")
    public Long getPosition() {
        return position;
    }

    public void setPosition(Long position) {
        this.position = position;
    }

    @Basic
    @Column(name = "SALARY")
    public Long getSalary() {
        return salary;
    }

    public void setSalary(Long salary) {
        this.salary = salary;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Player player = (Player) o;

        if (id != player.id) return false;
        if (firstname != null ? !firstname.equals(player.firstname) : player.firstname != null) return false;
        if (lastname != null ? !lastname.equals(player.lastname) : player.lastname != null) return false;
        if (heightinches != null ? !heightinches.equals(player.heightinches) : player.heightinches != null)
            return false;
        if (weightlbs != null ? !weightlbs.equals(player.weightlbs) : player.weightlbs != null) return false;
        if (position != null ? !position.equals(player.position) : player.position != null) return false;
        if (salary != null ? !salary.equals(player.salary) : player.salary != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (firstname != null ? firstname.hashCode() : 0);
        result = 31 * result + (lastname != null ? lastname.hashCode() : 0);
        result = 31 * result + (heightinches != null ? heightinches.hashCode() : 0);
        result = 31 * result + (weightlbs != null ? weightlbs.hashCode() : 0);
        result = 31 * result + (position != null ? position.hashCode() : 0);
        result = 31 * result + (salary != null ? salary.hashCode() : 0);
        return result;
    }
}
