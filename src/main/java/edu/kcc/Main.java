
package edu.kcc;

import edu.kcc.animal.Animal;
import edu.kcc.ui.UIUtility;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.net.Socket;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Scanner;
import java.util.function.Function;

/**
 *
 * @author k0519415
 */
public class Main {

    private static final int PORT = 5555;
    private static final String HOST_NAME = "localhost";

    private static Animal getAnimalFromServer(String prompt) throws IOException {
        Socket socket = new Socket(HOST_NAME, PORT);

        DataInputStream inputStream
                = new DataInputStream(socket.getInputStream());
        DataOutputStream outputStream
                = new DataOutputStream(socket.getOutputStream());

        outputStream.writeUTF(prompt);//animal?
        outputStream.flush();

        Animal animal = new Animal() {
            String id = inputStream.readUTF();
            String name = inputStream.readUTF();
            String species = inputStream.readUTF();
            String gender = inputStream.readUTF();
            int age = inputStream.readInt();
            boolean fixed = inputStream.readBoolean();
            int legs = inputStream.readInt();
            int weight = inputStream.readInt();
            String dateAdded = inputStream.readUTF();
            String lastFeedingTime = inputStream.readUTF();
        };

        inputStream.close();
        outputStream.close();
        System.out.println(animal);
        return animal;

    }

    private static String getChoice() {
        System.out.print("Please enter an Animal's name: ");
        Scanner in = new Scanner(System.in);
        return in.nextLine();
    }
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        UIUtility.showMessage("Program starting...");

        String menuTitle = "Main Menu";
        String[] menuOptions = {
            "1) Find an Animal",
            "2) Show lookup history",
            "3) Exit"
        };
        String prompt = "Your choice:";
        String errorMessage = "Invalid option.  Please try again.";
        String userChoice;
        // AnimalDAO dao = AnimalDAOFactory.getAnimalDAO();

        boolean working = true;
        while (working) {
            userChoice = UIUtility.showMenuOptions(menuTitle,
                    prompt, menuOptions);
            switch (userChoice) {
                case "1":
                    String opt1 = getChoice();
                    Animal animal = getAnimalFromServer(opt1);
                    System.out.println("Animal: " + animal);
                    break;
                case "2":
                    // show lookup history
                    break;
                case "3":
                    working = false;
                    break;
                default:
                    UIUtility.showErrorMessage(errorMessage, true);
            }

        }
    }

}