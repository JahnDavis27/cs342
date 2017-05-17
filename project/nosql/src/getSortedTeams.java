import oracle.kv.*;

import java.sql.SQLException;
import java.util.*;


/**
 * Sorts the teams in the database based upon the number of wins they recorded
 *      during the 2015-16  NBA regular season.
 * Refer to basketballStats.java to see the key-value structure being used.
 * Created by jrd58 on 5/12/2017.
 */
public class getSortedTeams {

    public static void main(String[] args) throws SQLException {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        HashMap<String, List<List<String>>> teams = new HashMap<>();
        SortedSet<Integer> ints = new TreeSet<>();

        Key key = Key.createKey(Arrays.asList("team"));
        Iterator<KeyValueVersion> it = store.storeIterator(Direction.UNORDERED, 0, key, null, null);

        while (it.hasNext()) {
            List<String> currentTeam = new ArrayList<>();
            KeyValueVersion kv = it.next();
            if (kv.getKey().getMinorPath().get(0).equals("wins")) {
                String teamId = kv.getKey().getMajorPath().get(1);
                String wins = new String(kv.getValue().getValue());
                currentTeam.add(teamId);
                currentTeam.add(getNameOfTeam(teamId, store));
                if (!ints.contains(Integer.parseInt(wins))) {
                    ints.add(Integer.parseInt(wins));
                }
                if (teams.containsKey(wins)) {
                    teams.get(wins).add(currentTeam);
                } else {
                    List<List<String>> extra = new ArrayList<>();
                    extra.add(currentTeam);
                    teams.put(wins, extra);
                }
            }
        }

        /**
         * Outputs data in the form (wins, teamID, name)
         * Ordered by wins from lowest to highest
         */
        for (Integer win : ints) {
            for (List<String> teamInfo : teams.get(win.toString())) {
                for (String data : teamInfo) {
                    System.out.print(data + "\t");
                }
                System.out.print("\t" + win + " wins");
                System.out.print("\n");
            }
        }

        store.close();
    }

    /**
     * Gets the name of a team from their id
     * @param(String teamId, KVStore store)
     * Returns team ID and name
     */
    public static String getNameOfTeam(String teamId, KVStore store) {
        String temp = "";
        Key majorKeyPath = Key.createKey(Arrays.asList("team", teamId));
        Map<Key, ValueVersion> fields = store.multiGet(majorKeyPath, null, null);
        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            if (field.getKey().getMinorPath().get(0).equals("name")) {
                temp = new String(field.getValue().getValue().getValue());
            }
        }
        return temp;
    }
}