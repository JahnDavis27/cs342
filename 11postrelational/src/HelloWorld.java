/**
 * Created by jrd58 on 4/21/2017.
 */
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

// The Java class will be hosted at the URI path "/helloworld"
@Path("/helloworld")
public class HelloWorld {
    // The Java method will process HTTP GET requests
    @GET
    // The Java method will produce content identified by the MIME Media type "text/plain"
    @Produces("text/plain")
    public String getClichedMessage() {
        // Return some cliched textual content
        return "Hello World";
    }
}

  /*
     * HTTP GET request to url Lab11_war/hello/api
     * Return the simple message "Getting..."
     */
    @Path("/api")
    @GET
    @Produces("text/plain")
    public String getHomeworkMessage() {
        return "Getting...";
    }

    /*
     * HTTP POST request that posts data/resources (typically for updating resources according to online resources)
     */
    @Path("/api/{message}")
    @POST
    @Consumes("text/plain")
    @Produces("text/plain")
    public String postClichedMessage(@PathParam("message") String temp_message) {
        return "Posting: " + temp_message;
    }

    /*
     * HTTP PUT request that puts data/resources (typically for creating resources according to online sources)
     */
    @Path("/api/{integer}")
    @PUT
    @Consumes("text/plain")
    @Produces("text/plain")
    public String putClichedMessage(@PathParam("integer") int temp_int) {
        return "Putting: " + temp_int;
    }

    /*
     * HTTP DELETE request that deletes a given integer
     */
    @Path("api/{integer}")
    @DELETE
    @Consumes("text/plain")
    @Produces("text/plain")
    public String deleteIntegerMessage(@PathParam("integer") int temp_int) {
        return "Deleting: " + temp_int;
    }
}
