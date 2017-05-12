package models;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by jrd58 on 5/12/2017.
 */
public class PlayerteamPK implements Serializable{
    private long playerid;
    private long teamid;

    @Column(name = "PLAYERID")
    @Id
    public long getPlayerid() {
        return playerid;
    }

    public void setPlayerid(long playerid) {
        this.playerid = playerid;
    }

    @Column(name = "TEAMID")
    @Id
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

        PlayerteamPK that = (PlayerteamPK) o;

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
