import oracle.kv.*;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;


/**
 * Created by jrd58 on 5/10/2017.
 */
public class GetMovieActorRoles {

    public static void main(String[] args) throws SQLException {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        //Gets the movie's ID based on user input
        Scanner reader = new Scanner(System.in);
        System.out.print("Please enter id of movie: ");
        Integer movieId = reader.nextInt();

        //Gets the actor's ID based on user input
        System.out.print("Please enter id of actor: ");
        Integer actorId = reader.nextInt();

        //Shows info for movie and actor
        System.out.println("\nMovie ID: " + movieId);
        System.out.println("Actor ID: " + actorId);

        Key majorKeyPath = Key.createKey(Arrays.asList("role", movieId.toString()));

        //Prints out all the roles that an actor plays in the inputted movie
        Map<Key, ValueVersion> fields = store.multiGet(majorKeyPath, null, null);
        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            String roleName = field.getKey().getMinorPath().get(0);
            String actorIdValue = new String(field.getValue().getValue().getValue());
            if (actorIdValue.equals(actorId.toString())) {
                System.out.println("\t" + roleName);
            }
        }

        store.close();
    }
}