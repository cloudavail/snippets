import java.util.Vector;

public class MemoryEater
{
  public static void main(String[] args)
  {
    Vector v = new Vector();
    while (true)
    {
      byte b[] = new byte[1048576];
      v.add(b);
      Runtime rt = Runtime.getRuntime();
      System.out.println( "free memory: " + rt.freeMemory() );
    }
  }
}
