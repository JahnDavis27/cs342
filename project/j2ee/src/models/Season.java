package models;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Gets all the data and columns for the Season table in the NBA database.
 * Uses the Oracle database source.
 * Created by jrd58 on 5/12/2017.
 */
@Entity
public class Season {
    private long id;
    private Long startyear;
    private Long endyear;
    private Long championid;
    private Long mostvaluableplayerid;

    @Id
    @Column(name = "ID")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "STARTYEAR")
    public Long getStartyear() {
        return startyear;
    }

    public void setStartyear(Long startyear) {
        this.startyear = startyear;
    }

    @Basic
    @Column(name = "ENDYEAR")
    public Long getEndyear() {
        return endyear;
    }

    public void setEndyear(Long endyear) {
        this.endyear = endyear;
    }

    @Basic
    @Column(name = "CHAMPIONID")
    public Long getChampionid() {
        return championid;
    }

    public void setChampionid(Long championid) {
        this.championid = championid;
    }

    @Basic
    @Column(name = "MOSTVALUABLEPLAYERID")
    public Long getMostvaluableplayerid() {
        return mostvaluableplayerid;
    }

    public void setMostvaluableplayerid(Long mostvaluableplayerid) {
        this.mostvaluableplayerid = mostvaluableplayerid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Season season = (Season) o;

        if (id != season.id) return false;
        if (startyear != null ? !startyear.equals(season.startyear) : season.startyear != null) return false;
        if (endyear != null ? !endyear.equals(season.endyear) : season.endyear != null) return false;
        if (championid != null ? !championid.equals(season.championid) : season.championid != null) return false;
        if (mostvaluableplayerid != null ? !mostvaluableplayerid.equals(season.mostvaluableplayerid) : season.mostvaluableplayerid != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (startyear != null ? startyear.hashCode() : 0);
        result = 31 * result + (endyear != null ? endyear.hashCode() : 0);
        result = 31 * result + (championid != null ? championid.hashCode() : 0);
        result = 31 * result + (mostvaluableplayerid != null ? mostvaluableplayerid.hashCode() : 0);
        return result;
    }
}
