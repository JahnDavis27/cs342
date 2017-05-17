import models.*;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

/**
 * Created by Jahn Davis on 5/9/2017.
 * CS 342 - Final Project
 * Extensions Deliverable
 *
 * Stateless session serves as a RESTful resource handler for the basketballStats database
 * It uses a container-managed entity manager
 *
 * See readme.txt in this j2ee directory for more information regarding what data gets served
 *      up through this RESTful web service.
 */

/**Class designed to execute GET, PUT, POST, and DELETE for the NBA database.
 *Designed to carry out all commands for data that is formatted as JSON data.
 */
@Stateless
@Path("ballStats")
public class basketballStats {
    @PersistenceContext
    private EntityManager em;

    /*************************************GET section of HTTP requests**************************************/
    @GET
    @Path("hello")
    @Produces("text/plain")
    public String getIntroductionMessage() {
        return "Welcome to the statistics database for the 2016 NBA Playoffs!";
    }

    /**
     * Gets a specific player in the database.
     * @param id
     * @return
     */
    @GET
    @Path("player/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Player getPlayer(@PathParam("id") long id) {
        return em.find(Player.class, id);
    }

    /**
     * Gets all the players in the database.
     * @return
     */
    @GET
    @Path("players")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Player> getAthletes() {
        return em.createQuery(em.getCriteriaBuilder().createQuery(Player.class)).getResultList();
    }

    /**
     * Gets a specific team in the database.
     * @param id
     * @return
     */
    @GET
    @Path("team/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Team getTeam(@PathParam("id") long id) {
        return em.find(Team.class, id);
    }

    /**
     * Gets all teams in the database.
     * @return
     */
    @GET
    @Path("teams")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Team> getTeams() {
        return em.createQuery(em.getCriteriaBuilder().createQuery(Team.class)).getResultList();
    }

    /**
     * Gets a specific game in the database.
     * @param id
     * @return
     */
    @GET
    @Path("game/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Games getGame(@PathParam("id") long id) {
        return em.find(Games.class, id);
    }

    /**
     * Gets all games in the database.
     * @return
     */
    @GET
    @Path("games")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Games> getGames() {
        return em.createQuery(em.getCriteriaBuilder().createQuery(Games.class)).getResultList();
    }

    /**
     * Gets the specific statistical data for a certain performance/gameStats in the database.
     * @param id
     * @return
     */
    @GET
    @Path("gamestats/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Gamestats getSingleGameStats(@PathParam("id") long id) {
        return em.find(Gamestats.class, id);
    }

    /**
     * Gets all the data for GameStats from the database.
     * @return
     */
    @GET
    @Path("gamestats")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Gamestats> getGameStats() {
        return em.createQuery(em.getCriteriaBuilder().createQuery(Gamestats.class)).getResultList();
    }

    /**
     * Gets data for a specific season in the database.
     * @param id
     * @return
     */
    @GET
    @Path("season/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Season getSeason(@PathParam("id") long id) {
        return em.find(Season.class, id);
    }

    /**
     * Get all seasons in the database.
     * @return
     */
    @GET
    @Path("seasons")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Season> getSeasons() {
        return em.createQuery(em.getCriteriaBuilder().createQuery(Season.class)).getResultList();
    }

    /**
     * Gets data for a specific position in the database.
     * @param id
     * @return
     */
    @GET
    @Path("position/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Position getPosition(@PathParam("id") long id){
        return em.find(Position.class,id);
    }

    /**
     * Gets all position data from the database.
     * @return
     */
    @GET
    @Path("positions")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Position> getPositions(){
        return em.createQuery(em.getCriteriaBuilder().createQuery(Position.class)).getResultList();
    }

    /*****************************POST section of HTTP requests******************************************/

    /**
     * Posts Player data.
     * @param player
     * @return
     */
    @POST
    @Path("players")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Player postPlayer(Player player) {
        Player newPlayer = new Player();
        player.setId(newPlayer.getId());
        player.setFirstname(newPlayer.getFirstname());
        player.setLastname(newPlayer.getLastname());
        player.setHeightinches(newPlayer.getHeightinches());
        player.setWeightlbs(newPlayer.getWeightlbs());
        player.setSalary(newPlayer.getSalary());
        em.persist(player);
        return newPlayer;
    }

    /**
     * Posts team data.
     * @param team
     * @return
     */
    @POST
    @Path("teams")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Team postTeam(Team team) {
        Team newTeam = new Team();
        team.setId(newTeam.getId());
        team.setConference(newTeam.getConference());
        team.setName(newTeam.getName());
        team.setHomecity(newTeam.getHomecity());
        team.setHomestate(newTeam.getHomestate());
        em.persist(team);
        return team;
    }

    /**
     * Posts game data.
     * @param game
     * @return
     */
    @POST
    @Path("games")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Games postGames(Games game) {
        Games newGame = new Games();
        game.setId(newGame.getId());
        game.setCityplayedin(newGame.getCityplayedin());
        game.setGamedate(newGame.getGamedate());
        game.setTeamonescore(newGame.getTeamonescore());
        game.setTeamtwoscore(newGame.getTeamtwoscore());
        //game.
        em.persist(game);
        return game;
    }

    /**
     * Posts a new gameStats record to the database.
     * @param gameStat
     * @return
     */
    @POST
    @Path("gamestats")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Gamestats postGameStats(Gamestats gameStat){
        Gamestats newGameStats = new Gamestats();
        gameStat.setId(newGameStats.getId());
        gameStat.setAssists(newGameStats.getAssists());
        gameStat.setBlocks(newGameStats.getBlocks());
        gameStat.setFieldgoalsattempted(newGameStats.getFieldgoalsattempted());
        gameStat.setFieldgoalsmade(newGameStats.getFieldgoalsmade());
        gameStat.setFouls(newGameStats.getFouls());
        gameStat.setFreethrowsattempted(newGameStats.getFreethrowsattempted());
        gameStat.setFreethrowsmade(newGameStats.getFreethrowsmade());
        gameStat.setMinutesplayed(newGameStats.getMinutesplayed());
        gameStat.setPoints(newGameStats.getPoints());
        gameStat.setRebounds(newGameStats.getRebounds());
        gameStat.setSteals(newGameStats.getSteals());
        gameStat.setThreepointattempted(newGameStats.getThreepointattempted());
        gameStat.setThreepointmade(newGameStats.getThreepointmade());
        gameStat.setTurnovers(newGameStats.getTurnovers());
        em.persist(gameStat);
        return gameStat;
    }

    /**
     * Posts a new Season record to the database.
     * @param season
     * @return
     */
    @POST
    @Path("seasons")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Season postSeason(Season season){
        Season newSeason = new Season();
        season.setId(newSeason.getId());
        season.setStartyear(newSeason.getStartyear());
        season.setEndyear(newSeason.getEndyear());
        em.persist(season);
        return season;
    }

    /**
     * Posts a new position to the database.
     * @param position
     * @return
     */
    @POST
    @Path("positions")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Position postPosition(Position position){
        Position newPosition = new Position();
        position.setId(newPosition.getId());
        position.setName(newPosition.getName());
        em.persist(position);
        return position;
    }

    /**********************************PUT section of the HTTP requests**************************************/
    /**
     * Modifies a specific player in the database.
     * @param id
     * @param player
     * @return
     */
    @PUT
    @Path("player/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Player putPlayer(@PathParam("id") long id, Player player) {
        Player tempPlayer = em.find(Player.class, id);
        if (tempPlayer != null) {
            em.merge(player);
        }
        return player;
    }

    /**
     * Modifies a specific team in the database.
     * @param id
     * @param team
     * @return
     */
    @PUT
    @Path("team/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Team putTeam(@PathParam("id") long id, Team team){
        Team tempTeam = em.find(Team.class, id);
        if (tempTeam != null) {
            em.merge(team);
        }
        return team;
    }

    /**
     * Modifies a specific game in the database.
     * @param id
     * @param game
     * @return
     */
    @PUT
    @Path("game/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Games putGame(@PathParam("id") long id, Games game) {
        Games tempGame = em.find(Games.class, id);
        if (tempGame != null) {
            em.merge(game);
        }
        return game;
    }

    /**
     * Modifies a specific season in the database.
     * @param id
     * @param season
     * @return
     */
    @PUT
    @Path("season/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Season putSeason(@PathParam("id") long id, Season season){
        Season tempSeason = em.find(Season.class, id);
        if (tempSeason != null) {
            em.merge(season);
        }
        return season;
    }

    /**
     * Modifies a specific performance/GameStats in the database.
     * @param id
     * @param gameStats
     * @return
     */
    @PUT
    @Path("gamestats/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Gamestats putGameStats(@PathParam("id") long id, Gamestats gameStats){
        Gamestats tempStats = em.find(Gamestats.class, id);
        if (tempStats != null){
            em.merge(gameStats);
        }
        return gameStats;
    }

    /**
     * Modifies a specific position in the database.
     * @param id
     * @param position
     * @return
     */
    @PUT
    @Path("position/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Position putPosition(@PathParam("id") long id, Position position){
        Position tempPosition = em.find(Position.class, id);
        if (tempPosition != null){
            em.merge(position);
        }
        return position;
    }

    /*********************************DELETE section of HTTP requests************************************/
    /**
     *
     * Deletes a specific player from the database.
     * @param id
     * @return
     */
    @DELETE
    @Path("player/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Player deletePlayer(@PathParam("id") long id) {
        Player player = em.find(Player.class, id);
        if (player != null) {
            em.remove(player);
        }
        return player;
    }

    /**
     * Deletes a specific team from the database.
     * @param id
     * @return
     */
    @DELETE
    @Path("team/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Team deleteTeam(@PathParam("id") long id) {
       Team team = em.find(Team.class, id);
        if (team != null) {
            em.remove(team);
        }
        return team;
    }

    /**
     * Removes a specific season from the database.
     * @param id
     * @return
     */
    @DELETE
    @Path("season/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Season deleteSeason(@PathParam("id") long id) {
        Season season = em.find(Season.class, id);
        if (season != null) {
            em.remove(season);
        }
        return season;
    }

    /**
     * Removes a specific game from the database.
     * @param id
     * @return
     */
    @DELETE
    @Path("games/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Games deleteGame(@PathParam("id") long id) {
        Games game = em.find(Games.class, id);
        if (game != null) {
            em.remove(game);
        }
        return game;
    }

    /**
     * Removes a specific performance/GameStats from the database.
     * @param id
     * @return
     */
    @DELETE
    @Path("gamestats/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Gamestats deleteGameStats(@PathParam("id") long id) {
        Gamestats gameStats = em.find(Gamestats.class, id);
        if (gameStats != null) {
            em.remove(gameStats);
        }
        return gameStats;
    }

    /**
     * Removes a specific position from the database.
     * @param id
     * @return
     */
    @DELETE
    @Path("position/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Position deletePosition(@PathParam("id") long id) {
        Position position = em.find(Position.class, id);
        if (position != null) {
            em.remove(position);
        }
        return position;
    }
}
