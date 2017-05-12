import oracle.kv.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;

/**
 * Created by jrd58 on 5/10/2017.
 */
public class LoadDB {

    private static KVStore store;
    private static Connection jdbcConnection;

    //Creates the store and jdbcConnection
    public static void main(String[] args) throws SQLException {

        store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        jdbcConnection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "imdb", "bjarne");

        getMovies();
        getActors();
        getRoles();

        jdbcConnection.close();
        store.close();
    }

    //Gets the movies and their info from the database
    public static void getMovies() throws SQLException {

        Statement jdbcStatement = jdbcConnection.createStatement();
        ResultSet resultSet = jdbcStatement.executeQuery("SELECT id, name, year, rank FROM Movie");
        while (resultSet.next()) {

            Integer movieId = resultSet.getInt(1);
            String rank = resultSet.getString(4);

            Key nameKey = Key.createKey(Arrays.asList("movie", movieId.toString()), Arrays.asList("name"));
            Value nameValue = Value.createValue(resultSet.getString(2).getBytes());
            store.put(nameKey, nameValue);

            Key yearKey = Key.createKey(Arrays.asList("movie", movieId.toString()), Arrays.asList("year"));
            Value yearValue = Value.createValue(resultSet.getString(3).getBytes());
            store.put(yearKey, yearValue);

            Key rankKey = Key.createKey(Arrays.asList("movie", movieId.toString()), Arrays.asList("rank"));
            Value rankValue = Value.createValue("".getBytes());
            if (rank != null) {
                rankValue = Value.createValue(rank.getBytes());
            }
            store.put(rankKey, rankValue);
        }

        resultSet.close();
        jdbcStatement.close();
    }

    //Gets the actors from the database
    public static void getActors() throws SQLException {

        Statement jdbcStatement = jdbcConnection.createStatement();
        ResultSet resultSet = jdbcStatement.executeQuery("SELECT id, firstName, lastName FROM Actor");
        while (resultSet.next()) {

            Integer actorId = resultSet.getInt(1);

            Key nameKey = Key.createKey(Arrays.asList("actor", actorId.toString()), Arrays.asList("firstName"));
            Value nameValue = Value.createValue(resultSet.getString(2).getBytes());
            store.put(nameKey, nameValue);

            Key yearKey = Key.createKey(Arrays.asList("actor", actorId.toString()), Arrays.asList("lastName"));
            Value yearValue = Value.createValue(resultSet.getString(3).getBytes());
            store.put(yearKey, yearValue);
        }

        resultSet.close();
        jdbcStatement.close();
    }

    //Gets the roles from the database
    public static void getRoles() throws SQLException {

        Statement jdbcStatement = jdbcConnection.createStatement();
        ResultSet resultSet = jdbcStatement.executeQuery("SELECT actorId, movieId, role FROM Role");

        while (resultSet.next()) {
            Key key = Key.createKey(Arrays.asList("role", resultSet.getString(2)), Arrays.asList(resultSet.getString(3)));
            Value value = Value.createValue(resultSet.getString(1).getBytes());
            store.put(key, value);

            Map<Key, ValueVersion> fields = store.multiGet(key, null, null);
            for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
                String fieldName = field.getKey().getMinorPath().get(0);
                String fieldValue = new String(field.getValue().getValue().getValue());
                System.out.println("\t" + fieldName + "\t" + fieldValue);
            }
        }

        resultSet.close();
        jdbcStatement.close();
    }

}