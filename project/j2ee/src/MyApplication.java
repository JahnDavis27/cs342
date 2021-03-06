/**
 * Gets the basketballStats class and adds it to the HashSet.
 * Created by jrd58 on 5/11/2017.
 */
import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;
import java.util.HashSet;
import java.util.Set;


@ApplicationPath("/")
public class MyApplication extends Application {

    @Override
    public Set<Class<?>> getClasses() {
        HashSet h = new HashSet<Class<?>>();
        h.add(basketballStats.class);
        return h;
    }
}
