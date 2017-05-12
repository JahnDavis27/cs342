import javafx.geometry.Pos;
import models.*;


import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.print.attribute.standard.Media;
import javax.ws.rs.*;
import javax.ws.rs.container.PreMatching;
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

    //Get a specific player from the database
    @GET
    @Path("player/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Player getPlayer(@PathParam("id") long id) {
        return em.find(Player.class, id);
    }

    //Get all the players from the database
    @GET
    @Path("players")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Player> getAthletes() {
        return em.createQuery(em.getCriteriaBuilder().createQuery(Player.class)).getResultList();
    }

    //Get a specific team from the database
    @GET
    @Path("team/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Team getTeam(@PathParam("id") long id) {
        return em.find(Team.class, id);
    }

    //Get all the teams from the database
    @GET
    @Path("teams")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Team> getTeams() {
        return em.createQuery(em.getCriteriaBuilder().createQuery(Team.class)).getResultList();
    }

    //Get a specific game from the database
    @GET
    @Path("game/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Games getGame(@PathParam("id") long id) {
        return em.find(Games.class, id);
    }

    //Get all games in the database
    @GET
    @Path("games")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Games> getGames() {
        return em.createQuery(em.getCriteriaBuilder().createQuery(Games.class)).getResultList();
    }

    //Get a specific statistics record for a single game
    @GET
    @Path("gamestats/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Gamestats getSingleGameStats(@PathParam("id") long id) {
        return em.find(Gamestats.class, id);
    }

    //Get all the game statistics in the database
    @GET
    @Path("gamestats")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Gamestats> getGameStats() {
        return em.createQuery(em.getCriteriaBuilder().createQuery(Gamestats.class)).getResultList();
    }

    //Get a specific season in the database
    @GET
    @Path("season/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Season getSeason(@PathParam("id") long id) {
        return em.find(Season.class, id);
    }

    //Get all seasons in the database
    @GET
    @Path("seasons")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Season> getSeasons() {
        return em.createQuery(em.getCriteriaBuilder().createQuery(Season.class)).getResultList();
    }

    //Get a specific position in the database
    @GET
    @Path("position/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Position getPosition(@PathParam("id") long id){
        return em.find(Position.class,id);
    }

    //Get all positions in the database
    @GET
    @Path("positions")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Position> getPositions(){
        return em.createQuery(em.getCriteriaBuilder().createQuery(Position.class)).getResultList();
    }

    /*****************************POST section of HTTP requests******************************************/

    // Add a new athlete to the database
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

    // Add a new team to the database
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

    //Add a new game to the database
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

    //Add a new season to the database
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

    //Add a new position to the database
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
    // Modify an existing athlete in the database
    @PUT
    @Path("athlete/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Player putPlayer(@PathParam("id") long id, Player player) {
        Player tempPlayer = em.find(Player.class, id);
        if (tempPlayer != null) {
            em.merge(player);
        }
        return player;
    }

    // Modify an existing team in the database
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

    //Modify an existing game in the database
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

    //Modify an existing season in the database
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

    //Modify an existing gameStats record in the database
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

    //Modify an existing position in the database
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
    // Remove a player from the database
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

    //Remove a team from the database
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

    //Remove a season from the database
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

    //Remove a game from the database
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

    //Remove a gameStats record from the database
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

    //Remove a position from the database
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
