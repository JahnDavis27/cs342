package models;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Gets all the data and columns for the PlayerTeam table in the NBA database.
 * Uses the Oracle database source.
 * Created by jrd58 on 5/12/2017.
 */
@Entity
@Table(name = "PLAYERTEAM", schema = "JRD58", catalog = "")
@IdClass(PlayerteamPK.class)
public class Playerteam implements Serializable{
    private long playerid;
    private long teamid;

    @Id
    @Column(name = "PLAYERID")
    public long getPlayerid() {
        return playerid;
    }

    public void setPlayerid(long playerid) {
        this.playerid = playerid;
    }

    @Id
    @Column(name = "TEAMID")
    public long getTeamid() {
        return teamid;
    }

    public void setTeamid(long teamid) {
        this.teamid = teamid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Playerteam that = (Playerteam) o;

        if (playerid != that.playerid) return false;
        if (teamid != that.teamid) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (playerid ^ (playerid >>> 32));
        result = 31 * result + (int) (teamid ^ (teamid >>> 32));
        return result;
    }
}
