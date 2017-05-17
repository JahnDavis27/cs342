package models;

import javax.persistence.*;

/**
 * Gets all the data and columns for the GameStats table in the NBA database.
 * Uses the Oracle database source.
 * Created by jrd58 on 5/12/2017.
 */
@Entity
@Table(name = "GAMESTATS", schema = "JRD58", catalog = "")
public class Gamestats {
    private long id;
    private Long playerid;
    private Long gameid;
    private Long positionid;
    private Long seasonid;
    private Long fieldgoalsattempted;
    private Long fieldgoalsmade;
    private Long threepointattempted;
    private Long threepointmade;
    private Long freethrowsattempted;
    private Long freethrowsmade;
    private Long points;
    private Long assists;
    private Long rebounds;
    private Long steals;
    private Long blocks;
    private Long turnovers;
    private Long fouls;
    private Long minutesplayed;

    @Id
    @Column(name = "ID")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "PLAYERID")
    public Long getPlayerid() {
        return playerid;
    }

    public void setPlayerid(Long playerid) {
        this.playerid = playerid;
    }

    @Basic
    @Column(name = "GAMEID")
    public Long getGameid() {
        return gameid;
    }

    public void setGameid(Long gameid) {
        this.gameid = gameid;
    }

    @Basic
    @Column(name = "POSITIONID")
    public Long getPositionid() {
        return positionid;
    }

    public void setPositionid(Long positionid) {
        this.positionid = positionid;
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
    @Column(name = "FIELDGOALSATTEMPTED")
    public Long getFieldgoalsattempted() {
        return fieldgoalsattempted;
    }

    public void setFieldgoalsattempted(Long fieldgoalsattempted) {
        this.fieldgoalsattempted = fieldgoalsattempted;
    }

    @Basic
    @Column(name = "FIELDGOALSMADE")
    public Long getFieldgoalsmade() {
        return fieldgoalsmade;
    }

    public void setFieldgoalsmade(Long fieldgoalsmade) {
        this.fieldgoalsmade = fieldgoalsmade;
    }

    @Basic
    @Column(name = "THREEPOINTATTEMPTED")
    public Long getThreepointattempted() {
        return threepointattempted;
    }

    public void setThreepointattempted(Long threepointattempted) {
        this.threepointattempted = threepointattempted;
    }

    @Basic
    @Column(name = "THREEPOINTMADE")
    public Long getThreepointmade() {
        return threepointmade;
    }

    public void setThreepointmade(Long threepointmade) {
        this.threepointmade = threepointmade;
    }

    @Basic
    @Column(name = "FREETHROWSATTEMPTED")
    public Long getFreethrowsattempted() {
        return freethrowsattempted;
    }

    public void setFreethrowsattempted(Long freethrowsattempted) {
        this.freethrowsattempted = freethrowsattempted;
    }

    @Basic
    @Column(name = "FREETHROWSMADE")
    public Long getFreethrowsmade() {
        return freethrowsmade;
    }

    public void setFreethrowsmade(Long freethrowsmade) {
        this.freethrowsmade = freethrowsmade;
    }

    @Basic
    @Column(name = "POINTS")
    public Long getPoints() {
        return points;
    }

    public void setPoints(Long points) {
        this.points = points;
    }

    @Basic
    @Column(name = "ASSISTS")
    public Long getAssists() {
        return assists;
    }

    public void setAssists(Long assists) {
        this.assists = assists;
    }

    @Basic
    @Column(name = "REBOUNDS")
    public Long getRebounds() {
        return rebounds;
    }

    public void setRebounds(Long rebounds) {
        this.rebounds = rebounds;
    }

    @Basic
    @Column(name = "STEALS")
    public Long getSteals() {
        return steals;
    }

    public void setSteals(Long steals) {
        this.steals = steals;
    }

    @Basic
    @Column(name = "BLOCKS")
    public Long getBlocks() {
        return blocks;
    }

    public void setBlocks(Long blocks) {
        this.blocks = blocks;
    }

    @Basic
    @Column(name = "TURNOVERS")
    public Long getTurnovers() {
        return turnovers;
    }

    public void setTurnovers(Long turnovers) {
        this.turnovers = turnovers;
    }

    @Basic
    @Column(name = "FOULS")
    public Long getFouls() {
        return fouls;
    }

    public void setFouls(Long fouls) {
        this.fouls = fouls;
    }

    @Basic
    @Column(name = "MINUTESPLAYED")
    public Long getMinutesplayed() {
        return minutesplayed;
    }

    public void setMinutesplayed(Long minutesplayed) {
        this.minutesplayed = minutesplayed;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Gamestats gamestats = (Gamestats) o;

        if (id != gamestats.id) return false;
        if (playerid != null ? !playerid.equals(gamestats.playerid) : gamestats.playerid != null) return false;
        if (gameid != null ? !gameid.equals(gamestats.gameid) : gamestats.gameid != null) return false;
        if (positionid != null ? !positionid.equals(gamestats.positionid) : gamestats.positionid != null) return false;
        if (seasonid != null ? !seasonid.equals(gamestats.seasonid) : gamestats.seasonid != null) return false;
        if (fieldgoalsattempted != null ? !fieldgoalsattempted.equals(gamestats.fieldgoalsattempted) : gamestats.fieldgoalsattempted != null)
            return false;
        if (fieldgoalsmade != null ? !fieldgoalsmade.equals(gamestats.fieldgoalsmade) : gamestats.fieldgoalsmade != null)
            return false;
        if (threepointattempted != null ? !threepointattempted.equals(gamestats.threepointattempted) : gamestats.threepointattempted != null)
            return false;
        if (threepointmade != null ? !threepointmade.equals(gamestats.threepointmade) : gamestats.threepointmade != null)
            return false;
        if (freethrowsattempted != null ? !freethrowsattempted.equals(gamestats.freethrowsattempted) : gamestats.freethrowsattempted != null)
            return false;
        if (freethrowsmade != null ? !freethrowsmade.equals(gamestats.freethrowsmade) : gamestats.freethrowsmade != null)
            return false;
        if (points != null ? !points.equals(gamestats.points) : gamestats.points != null) return false;
        if (assists != null ? !assists.equals(gamestats.assists) : gamestats.assists != null) return false;
        if (rebounds != null ? !rebounds.equals(gamestats.rebounds) : gamestats.rebounds != null) return false;
        if (steals != null ? !steals.equals(gamestats.steals) : gamestats.steals != null) return false;
        if (blocks != null ? !blocks.equals(gamestats.blocks) : gamestats.blocks != null) return false;
        if (turnovers != null ? !turnovers.equals(gamestats.turnovers) : gamestats.turnovers != null) return false;
        if (fouls != null ? !fouls.equals(gamestats.fouls) : gamestats.fouls != null) return false;
        if (minutesplayed != null ? !minutesplayed.equals(gamestats.minutesplayed) : gamestats.minutesplayed != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (playerid != null ? playerid.hashCode() : 0);
        result = 31 * result + (gameid != null ? gameid.hashCode() : 0);
        result = 31 * result + (positionid != null ? positionid.hashCode() : 0);
        result = 31 * result + (seasonid != null ? seasonid.hashCode() : 0);
        result = 31 * result + (fieldgoalsattempted != null ? fieldgoalsattempted.hashCode() : 0);
        result = 31 * result + (fieldgoalsmade != null ? fieldgoalsmade.hashCode() : 0);
        result = 31 * result + (threepointattempted != null ? threepointattempted.hashCode() : 0);
        result = 31 * result + (threepointmade != null ? threepointmade.hashCode() : 0);
        result = 31 * result + (freethrowsattempted != null ? freethrowsattempted.hashCode() : 0);
        result = 31 * result + (freethrowsmade != null ? freethrowsmade.hashCode() : 0);
        result = 31 * result + (points != null ? points.hashCode() : 0);
        result = 31 * result + (assists != null ? assists.hashCode() : 0);
        result = 31 * result + (rebounds != null ? rebounds.hashCode() : 0);
        result = 31 * result + (steals != null ? steals.hashCode() : 0);
        result = 31 * result + (blocks != null ? blocks.hashCode() : 0);
        result = 31 * result + (turnovers != null ? turnovers.hashCode() : 0);
        result = 31 * result + (fouls != null ? fouls.hashCode() : 0);
        result = 31 * result + (minutesplayed != null ? minutesplayed.hashCode() : 0);
        return result;
    }
}
