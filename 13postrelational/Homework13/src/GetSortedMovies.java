import oracle.kv.*;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;

/**
 * Created by jrd58 on 5/10/2017.
 */
public class GetSortedMovies {

    public static void main(String[] args) throws SQLException {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        LoadDB.loadDatabase(store);

        Key majorKeyPathOnly = Key.createKey(Arrays.asList("movie"));
        Map<Key, ValueVersion> fields = store.multiGet(majorKeyPathOnly, null, null);

        ArrayList<String> years = new ArrayList<>();

        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            String movieId = field.getKey().getMinorPath().get(0);


        }

        System.out.println();



        store.close();
    }
}