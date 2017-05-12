package models;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by jrd58 on 5/12/2017.
 */
@Entity
public class Team {
    private long id;
    private String name;
    private String homecity;
    private String homestate;
    private String conference;
    private Long wins;
    private Long losses;

    @Id
    @Column(name = "ID")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "NAME")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "HOMECITY")
    public String getHomecity() {
        return homecity;
    }

    public void setHomecity(String homecity) {
        this.homecity = homecity;
    }

    @Basic
    @Column(name = "HOMESTATE")
    public String getHomestate() {
        return homestate;
    }

    public void setHomestate(String homestate) {
        this.homestate = homestate;
    }

    @Basic
    @Column(name = "CONFERENCE")
    public String getConference() {
        return conference;
    }

    public void setConference(String conference) {
        this.conference = conference;
    }

    @Basic
    @Column(name = "WINS")
    public Long getWins() {
        return wins;
    }

    public void setWins(Long wins) {
        this.wins = wins;
    }

    @Basic
    @Column(name = "LOSSES")
    public Long getLosses() {
        return losses;
    }

    public void setLosses(Long losses) {
        this.losses = losses;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Team team = (Team) o;

        if (id != team.id) return false;
        if (name != null ? !name.equals(team.name) : team.name != null) return false;
        if (homecity != null ? !homecity.equals(team.homecity) : team.homecity != null) return false;
        if (homestate != null ? !homestate.equals(team.homestate) : team.homestate != null) return false;
        if (conference != null ? !conference.equals(team.conference) : team.conference != null) return false;
        if (wins != null ? !wins.equals(team.wins) : team.wins != null) return false;
        if (losses != null ? !losses.equals(team.losses) : team.losses != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (homecity != null ? homecity.hashCode() : 0);
        result = 31 * result + (homestate != null ? homestate.hashCode() : 0);
        result = 31 * result + (conference != null ? conference.hashCode() : 0);
        result = 31 * result + (wins != null ? wins.hashCode() : 0);
        result = 31 * result + (losses != null ? losses.hashCode() : 0);
        return result;
    }
}
