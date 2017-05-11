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

        Key majorKeyPathOnly = Key.createKey(Arrays.asList("movie", movieId.toString()));
        Map<Key, ValueVersion> fields = store.multiGet(majorKeyPathOnly, null, null);
        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            String temp = new String(field.getValue().getValue().getValue());
            System.out.println("\t" + temp);
        }

        store.close();
    }
}