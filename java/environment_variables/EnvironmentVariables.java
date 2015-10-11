// to compile:
// $ javac EnvironmentVariables
// to execute the bytecode
// $ java EnvironmentVariables
public class EnvironmentVariables {

    public static void main(String[] args) {
        // an Environment Variable that likely exists
        String user = System.getenv("USER");
        // an Environment Variable that likely exists
        String home = System.getenv("HOME");
        System.out.println("Username is " + user);
        System.out.println("Home is " + home);

        String myVar = System.getenv("MY_VAR");
        if ( myVar != null ) {
            System.out.println("MY_VAR is " + myVar);
        } else {
            System.out.println("MY_VAR is not found.");
        }

    }

}
