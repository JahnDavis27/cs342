package models;

import javax.persistence.*;
import java.sql.Time;

/**
 * Grabs all the data on Games from the NBA database.
 * Uses the Oracle database source.
 * Created by jrd58 on 5/12/2017.
 */
@Entity
public class Games {
    private long id;
    private Long teamoneid;
    private Long teamtwoid;
    private Long teamonescore;
    private Long teamtwoscore;
    private Time gamedate;
    private Long seasonid;
    private String cityplayedin;


    @ManyToOne
    @JoinColumn(name = "SEASONID", referencedColumnName = "ID")
    private Season season;


    public Season getSeason() {return season;}
    public void setSeason(Season newSeason) {this.season = newSeason;}

    @Id
    @Column(name = "ID")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "TEAMONEID")
    public Long getTeamoneid() {
        return teamoneid;
    }

    public void setTeamoneid(Long teamoneid) {
        this.teamoneid = teamoneid;
    }

    @Basic
    @Column(name = "TEAMTWOID")
    public Long getTeamtwoid() {
        return teamtwoid;
    }

    public void setTeamtwoid(Long teamtwoid) {
        this.teamtwoid = teamtwoid;
    }

    @Basic
    @Column(name = "TEAMONESCORE")
    public Long getTeamonescore() {
        return teamonescore;
    }

    public void setTeamonescore(Long teamonescore) {
        this.teamonescore = teamonescore;
    }

    @Basic
    @Column(name = "TEAMTWOSCORE")
    public Long getTeamtwoscore() {
        return teamtwoscore;
    }

    public void setTeamtwoscore(Long teamtwoscore) {
        this.teamtwoscore = teamtwoscore;
    }

    @Basic
    @Column(name = "GAMEDATE")
    public Time getGamedate() {
        return gamedate;
    }

    public void setGamedate(Time gamedate) {
        this.gamedate = gamedate;
    }

    @Basic
    @Column(name = "SEASONID")
    public Long getSeasonid() {
        return seasonid;
    }

    public void setSeasonid(Long seasonid) {
        this.seasonid = seasonid;
    }

    @Basic
    @Column(name = "CITYPLAYEDIN")
    public String getCityplayedin() {
        return cityplayedin;
    }

    public void setCityplayedin(String cityplayedin) {
        this.cityplayedin = cityplayedin;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Games games = (Games) o;

        if (id != games.id) return false;
        if (teamoneid != null ? !teamoneid.equals(games.teamoneid) : games.teamoneid != null) return false;
        if (teamtwoid != null ? !teamtwoid.equals(games.teamtwoid) : games.teamtwoid != null) return false;
        if (teamonescore != null ? !teamonescore.equals(games.teamonescore) : games.teamonescore != null) return false;
        if (teamtwoscore != null ? !teamtwoscore.equals(games.teamtwoscore) : games.teamtwoscore != null) return false;
        if (gamedate != null ? !gamedate.equals(games.gamedate) : games.gamedate != null) return false;
        if (seasonid != null ? !seasonid.equals(games.seasonid) : games.seasonid != null) return false;
        if (cityplayedin != null ? !cityplayedin.equals(games.cityplayedin) : games.cityplayedin != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (teamoneid != null ? teamoneid.hashCode() : 0);
        result = 31 * result + (teamtwoid != null ? teamtwoid.hashCode() : 0);
        result = 31 * result + (teamonescore != null ? teamonescore.hashCode() : 0);
        result = 31 * result + (teamtwoscore != null ? teamtwoscore.hashCode() : 0);
        result = 31 * result + (gamedate != null ? gamedate.hashCode() : 0);
        result = 31 * result + (seasonid != null ? seasonid.hashCode() : 0);
        result = 31 * result + (cityplayedin != null ? cityplayedin.hashCode() : 0);
        return result;
    }
}
