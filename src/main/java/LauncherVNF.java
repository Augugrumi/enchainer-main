import enchainer.Enchainer;

import java.io.IOException;
import java.util.Arrays;

public class LauncherVNF {
    public static void main(String[] args) {
        for (String s : args)
            System.out.println(s);
        String[] chain = Arrays.copyOfRange(args, 1, args.length);
        try {
            new Enchainer(Integer.parseInt(args[0]), chain).execute();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
