import java.util.Arrays;
import java.util.Map;

import oracle.kv.*;

/**
 * Created by jrd58 on 5/5/2017.
 */

public class HelloRecords {
    public static void main(String[] args) {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));
        System.out.println("New movie record: ");

        Integer movieId = 92616;
        String movieName = "Dr. Strangelove";
        String year = "1964";
        Double rating = 8.7;

        // Create key and value pair for movie Name and put it to the store
        Key nameKey = Key.createKey(Arrays.asList("movie", movieId.toString()), Arrays.asList("name"));
        Value value = Value.createValue(movieName.getBytes());
        store.put(nameKey, value);

        // Create key and value pair for movie Year and put it to the store
        Key yearKey = Key.createKey(Arrays.asList("movie", movieId.toString()), Arrays.asList("year"));
        Value yearValue = Value.createValue(year.getBytes());
        store.put(yearKey, yearValue);

        // Create key and value pair for movie Rating and put it to the store
        Key ratingKey = Key.createKey(Arrays.asList("movie", movieId.toString()), Arrays.asList("rating"));
        Value ratingValue = Value.createValue(rating.toString().getBytes());
        store.put(ratingKey, ratingValue);

        // R(ead)
        // This queries KVLite using the same key.
        // The result, a byte array, is converted into a string.
        //Done for name, year, and rating keys.
        String result = new String(store.get(nameKey).getValue().getValue());
        System.out.println(nameKey.toString() + " : " + result);

        String resultYear = new String(store.get(yearKey).getValue().getValue());
        System.out.println(yearKey.toString() + " : " + resultYear);

        String resultRating = new String(store.get(ratingKey).getValue().getValue());
        System.out.println(ratingKey.toString() + " : " + resultRating);

        Key majorKeyPathOnly = Key.createKey(Arrays.asList("movie", movieId.toString()));
        Map<Key, ValueVersion> fields = store.multiGet(majorKeyPathOnly, null, null);
        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            String fieldName = field.getKey().getMinorPath().get(0);
            String fieldValue = new String(field.getValue().getValue().getValue());
            System.out.println("\t" + fieldName + "\t: " + fieldValue);
        }

        //D(elete)
        //This deletes the key-value pair.
        store.delete(nameKey);
        if (store.get(nameKey) == null) {
            System.out.println("Good, nameKey successfully deleted...");
        } else {
            System.out.println("Oops, nameKey not deleted...");
        }

        store.delete(yearKey);
        if (store.get(yearKey) == null) {
            System.out.println("Good, yearKey successfully deleted...");
        } else {
            System.out.println("Oops, yearKey not deleted...");
        }

        store.delete(ratingKey);
        if (store.get(ratingKey) == null) {
            System.out.println("Good, ratingKey successfully deleted...");
        } else {
            System.out.println("Oops, ratingKey not deleted...");
        }
    }
}
