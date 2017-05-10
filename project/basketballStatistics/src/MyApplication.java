import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;
import java.util.HashSet;
import java.util.Set;


/**
 * Created by Jahn Davis on 5/8/2017.
 * CS342 Final Project
 * Keith Vander Linden
 *
 * Initialize the basketballStats class.
 */


@ApplicationPath("/")
public class MyApplication extends Application {
    @Override
    public Set<Class<?>> getClasses() {
        HashSet h = new HashSet<Class<?>>();
        h.add(basketballStats.class);
        return h;
    }
}
