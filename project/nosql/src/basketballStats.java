/**
 * Created by jrd58 on 5/12/2017.
 */

import oracle.kv.*;

import java.sql.*;
import java.util.Arrays;

/**This class defines three methods for getting the keys and values from the Oracle database for my project.
 * These methods populate keys and values which can then be used for the other java programs in this noSQL 
 *     implementation.
 */
public class basketballStats {

    private static KVStore store;
    private static Connection jdbcConnection;

    public static void main(String[] args) throws SQLException {

        // Instantiate the kvStore and connect to Oracle database
        store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));
        jdbcConnection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jrd58", "bjarne");

        getPlayers();
        getTeams();
        getPlayerTeam();

        // Close the kvStore and jdbcConnection
        store.close();

    }

    /**
	 * getPlayers has the following key-value structure for storing players:
     *      /player/{playerId}/-/firstName/{firstName}
     *      /player/{playerId}/-/lastName/{lastName}
     *      /player/{playerId}/-/heightInches/{heightInches}
     *      /player/{playerId}/-/weightLbs/{weightLbs}
     *      /player/{playerId}/-/position/{position}
	 *		/player/{playerId}/-/salary/{salary}
	 *
     * Populates the keys and values of the players in the NBA database.
     * Grabs all player attributes and organizes them in an orderly format.
     * An SQL exception is thrown if no data is found.
     * @param: none
     * @throws SQLException
     **/
    public static void getPlayers() throws SQLException {

        Statement jdbcStatement = jdbcConnection.createStatement();
        ResultSet resultSet = jdbcStatement.executeQuery("SELECT id, firstName, lastName, heightInches, weightLbs, position, salary FROM Player");
        while (resultSet.next()) {

            Integer playerId = resultSet.getInt(1);

            Key firstNameKey = Key.createKey(Arrays.asList("player", playerId.toString()), Arrays.asList("firstName"));
            Value firstNameValue = Value.createValue(resultSet.getString(2).getBytes());
            store.put(firstNameKey, firstNameValue);

            Key lastNameKey = Key.createKey(Arrays.asList("player", playerId.toString()), Arrays.asList("lastName"));
            Value lastNameValue = Value.createValue(resultSet.getString(3).getBytes());
            store.put(lastNameKey, lastNameValue);

            Key heightKey = Key.createKey(Arrays.asList("player", playerId.toString()), Arrays.asList("heightInches"));
            Value heightValue = Value.createValue(resultSet.getString(4).getBytes());
            store.put(heightKey, heightValue);

            Key weightKey = Key.createKey(Arrays.asList("player", playerId.toString()), Arrays.asList("weightLbs"));
            Value weightValue = Value.createValue(resultSet.getString(5).getBytes());
            store.put(weightKey, weightValue);

            Key positionKey = Key.createKey(Arrays.asList("player", playerId.toString()), Arrays.asList("position"));
            Value positionValue = Value.createValue(resultSet.getString(6).getBytes());
            store.put(positionKey, positionValue);

            Key salaryKey = Key.createKey(Arrays.asList("player", playerId.toString()), Arrays.asList("salary"));
            Value salaryValue = Value.createValue(resultSet.getString(7).getBytes());
            store.put(salaryKey, salaryValue);
        }
        resultSet.close();
        jdbcStatement.close();
    }

    /**
	* getTeams has the following the key-value structure for storing fantasy teams:
     *      /team/{teamId}/-/name/{name}
	 *		/team/{teamId}/-/homeCity/{homeCity}
	 *		/team/{teamId}/-/homeState/{homeState}
	 *		/team/{teamId}/-/conference/{conference}
     *      /team/{teamId}/-/wins/{wins}
     *      /team/{teamId}/-/losses/{losses}
     * 
     * Populates the keys and values of the teams in the NBA database.
     * Grabs all player attributes and organizes them in an orderly format.
     * An SQL exception is thrown if no data is found.
     * @param: none
     * @throws SQLException
     **/
    public static void getTeams() throws SQLException {

        Statement jdbcStatement = jdbcConnection.createStatement();
        ResultSet resultSet = jdbcStatement.executeQuery("SELECT id, name, homeCity, homeState, conference, wins, losses FROM Team");
        while (resultSet.next()) {

            Integer teamId = resultSet.getInt(1);

            Key nameKey = Key.createKey(Arrays.asList("team", teamId.toString()), Arrays.asList("name"));
            Value nameValue = Value.createValue(resultSet.getString(2).getBytes());
            store.put(nameKey, nameValue);

            Key homeCityKey = Key.createKey(Arrays.asList("team", teamId.toString()), Arrays.asList("homeCity"));
            Value homeCityValue = Value.createValue(resultSet.getString(3).getBytes());
            store.put(homeCityKey, homeCityValue);

            Key homeStateKey = Key.createKey(Arrays.asList("team", teamId.toString()), Arrays.asList("homeState"));
            Value homeStateValue = Value.createValue(resultSet.getString(4).getBytes());
            store.put(homeStateKey, homeStateValue);

            Key conferenceKey = Key.createKey(Arrays.asList("team", teamId.toString()), Arrays.asList("conference"));
            Value conferenceValue = Value.createValue(resultSet.getString(5).getBytes());
            store.put(conferenceKey, conferenceValue);

            Key winsKey = Key.createKey(Arrays.asList("team", teamId.toString()), Arrays.asList("wins"));
            Value winsValue = Value.createValue(resultSet.getString(6).getBytes());
            store.put(winsKey, winsValue);

            Key lossesKey = Key.createKey(Arrays.asList("team", teamId.toString()), Arrays.asList("losses"));
            Value lossesValue = Value.createValue(resultSet.getString(7).getBytes());
            store.put(lossesKey, lossesValue);
        }
        resultSet.close();
        jdbcStatement.close();

    }

    /**
	 * getPlayerTeam has the following key-value structure for storing the player_Team records
     *      /playerTeam/{teamId}/{playerId}/-/NO-VALUE
	 *
     * Populates the keys and values of the team rosters in the NBA database.
     * Grabs all player attributes and organizes them in an orderly format.
     * An SQL exception is thrown if no data is found.
     * @param: none
     * @throws SQLException
     **/
    public static void getPlayerTeam() throws SQLException {

        Statement jdbcStatement = jdbcConnection.createStatement();
        ResultSet resultSet = jdbcStatement.executeQuery("SELECT playerID, teamID FROM PlayerTeam");

        while (resultSet.next()) {

            Key key = Key.createKey(Arrays.asList("playerTeam", resultSet.getString(1)), Arrays.asList("player"));
            Value value = Value.createValue(resultSet.getString(2).getBytes());
            store.put(key, value);
        }
    }
}
