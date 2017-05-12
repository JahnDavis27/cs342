import oracle.kv.*;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;

/**
 * Created by jrd58 on 5/12/2017.
 */
public class getPlayerTeams {
    public static void main(String[] args) throws SQLException {
    KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

    Scanner reader = new Scanner(System.in);
    System.out.print("Please enter id of a team: ");
    Integer teamId = reader.nextInt();

        System.out.println("Team ID: " + teamId);

    Key majorKeyPath = Key.createKey(Arrays.asList("playerTeam", teamId.toString()));
    Iterator<KeyValueVersion> it = store.storeIterator(Direction.UNORDERED, 0, majorKeyPath, null, null);

    Map<Key, ValueVersion> fields = store.multiGet(majorKeyPath, null, null);
        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
        String player = field.getKey().getMinorPath().get(0);
        String playerId = new String(field.getValue().getValue().getValue());
        System.out.println("\t" + playerId + "\t" + getNamesofPlayers(playerId, store) + "\t" + player);
    }

        store.close();
    }

    public static String getNamesofPlayers(String playerId, KVStore store) {
        String fullname = "";
        Key majorKeyPath = Key.createKey(Arrays.asList("player", playerId));
        Map<Key, ValueVersion> fields = store.multiGet(majorKeyPath, null, null);
        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            if (field.getKey().getMinorPath().get(0).equals("firstName")) {
                fullname += new String(field.getValue().getValue().getValue());
            }
            if (field.getKey().getMinorPath().get(0).equals("lastName")) {
                fullname += " " + new String(field.getValue().getValue().getValue());
            }
        }
        return fullname;
    }

}
