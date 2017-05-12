import oracle.kv.*;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.Map;
import java.util.Scanner;

/**
 * Created by jrd58 on 5/10/2017.
 */
public class GetMovieActors {

    public static void main(String[] args) throws SQLException {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        //Reads in user inputs and queries the database for info based on the user's input
        Scanner reader = new Scanner(System.in);
        System.out.print("Please enter id of movie: ");
        Integer movieId = reader.nextInt();

        System.out.println("Movie ID: " + movieId);

        Key majorKeyPath = Key.createKey(Arrays.asList("role", movieId.toString()));

        Map<Key, ValueVersion> fields = store.multiGet(majorKeyPath, null, null);
        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            String roleName = field.getKey().getMinorPath().get(0);
            String actorId = new String(field.getValue().getValue().getValue());
            System.out.println("\t" + actorId + "\t" + getNamesOfActor(actorId, store) + "\t" + roleName);
        }

        store.close();
    }

    //Gets the names of all the actors in a movie based on the inputted movie ID
    public static String getNamesOfActor(String actorId, KVStore store) {
        String fullname = "";
        Key majorKeyPath = Key.createKey(Arrays.asList("actor", actorId));
        Map<Key, ValueVersion> fields = store.multiGet(majorKeyPath, null, null);
        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            fullname += " " + new String(field.getValue().getValue().getValue());
        }
        return fullname;
    }
}