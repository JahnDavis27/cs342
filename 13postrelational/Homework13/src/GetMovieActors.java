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

        LoadDB.loadDatabase(store);

        Scanner reader = new Scanner(System.in);
        System.out.print("Please enter id of movie: ");
        Integer movieId = reader.nextInt();

        System.out.println("Movie ID: " + movieId);

        //Key actorMovieKey = Key.createKey(Arrays.asList("actor", movieId.toString()));

        Key key = Key.createKey(Arrays.asList("movie", movieId.toString()), Arrays.asList("actorInMovie"));
        Map<Key, ValueVersion> fields = store.multiGet(key, null, null);

        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            String actorId = field.getKey().getMinorPath().get(1);
            String first="";
            String last="";
            Map<Key, ValueVersion> actor = store.multiGet(Key.createKey(Arrays.asList("actor", actorId)), null, null);
            for (Map.Entry<Key, ValueVersion> field1 : actor.entrySet()){
                if (field1.getKey().getMinorPath().get(0).equals("firstName")){
                    first = new String(field.getValue().getValue().getValue());
                }
                if (field1.getKey().getMinorPath().get(0).equals("lastName")){
                    last = new String(field.getValue().getValue().getValue());
                }
            }

            String role = new String(field.getValue().getValue().getValue());
            String cleanRole = role.substring(1, role.length()-1);

            String[] array = cleanRole.split(",");

            for (String actorRole: array){
                System.out.println("\n" + actorId + "\t" + first + " " + last + "\t" + actorRole);
            }

        }

        store.close();
    }
}