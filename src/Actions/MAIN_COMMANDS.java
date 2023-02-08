package Actions;

import Database.DBhandler;
import Items.Device;
import Persons.Customer;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

public class MAIN_COMMANDS {
    Scanner scanner = new Scanner(System.in);
    ArrayList<Customer> customers = new ArrayList<>();
    ArrayList<Device> items = new ArrayList<>();
    ActionsWithCustomers actionsWithCustomers = new ActionsWithCustomers(customers);
    ActionsWithItems actionsWithItems = new ActionsWithItems(items);
    ActionsWithCart actionsWithCart = new ActionsWithCart();
    private String login;

    public MAIN_COMMANDS() throws SQLException {
    }

    public void application() throws SQLException {
        Scanner input = new Scanner(System.in);
        int menu;
        while (true) {
            System.out.println("1 -> Administrator");
            System.out.println("2 -> Costumer");
            System.out.println("0 -> Exit");
            menu = input.nextInt();
            switch (menu) {
                case 1 -> verificationForAdministrator();
                case 2 -> verificationForCustomer();
                case 0 -> toExit();
            }

        }
    }

    public void verificationForAdministrator() throws SQLException {
        System.out.println("Enter login:");
        String login = scanner.next().trim();
        System.out.println("Enter password:");
        String password = scanner.next().trim();
        if (DBhandler.isExist(login, password, "\"Administrators\"")) {
            System.out.println("Accessed!");
            adminCommands();
        } else {
            System.out.println("Access failed. Incorrect login or password");
        }
    }

    public void verificationForCustomer() throws SQLException {
        System.out.println("Enter login:");
        String login = scanner.next().trim();
        System.out.println("Enter password:");
        String password = scanner.next().trim();
        if (DBhandler.isExist(login, password, "\"Customers\"")) {
            System.out.println("Accessed!");
            this.login = login;
            customerCommands();
        } else {
            System.out.println("Access failed. Incorrect login or password");
        }
    }

   /* public void verificationForCustomer() throws SQLException {
        System.out.println("Enter login:");
        String login = scanner.next().trim();
        System.out.println("Enter password:");
        String password = scanner.next().trim();
        int checker = 0;
        for (Customer c : customers) {
            if (c.getLogin() == login && c.getPassword() == password) {
                customerCommands(c);
            }
            checker++;
        }
        if (checker == customers.size()) {
            System.out.println("Access failed. Incorrect login or password");
        }
        }
    */

    public void toExit() {
        System.out.println("Goodbye.");
        System.exit(0);
    }

    public void adminCommands() throws SQLException {
        boolean working = true;
        while (working) {
            System.out.println("1 -> Delete a customer \n2 -> Add a customer \n3 -> List of Costumers \n4 -> Change the Costumer \n5 -> Delete an Item \n6 -> Add an Item \n7 -> List of all Items \n8 -> Log out");
            int choice = scanner.nextInt();
            switch (choice) {
                case 1 -> actionsWithCustomers.deleteCustomer();
                case 2 -> actionsWithCustomers.addCustomer();
                case 3 -> actionsWithCustomers.listOfCustomers();
                case 4 -> changeCostumer(); // некрасиво
                case 5 -> actionsWithItems.deleteItem();
                case 6 -> actionsWithItems.addItem();
                case 7 -> actionsWithItems.listOfItems();
                case 8 -> working = false;
                default -> System.out.println("Unknown command! Try again!");
            }
        }
    }

    public void changeCostumer() throws SQLException {
        System.out.println("What to change? \n1 -> First Name \n2 -> Second Name \n3 -> Login \n4 -> Password \n5 -> Balance");
        int choice = scanner.nextInt();
        switch (choice) {
            case 1 -> actionsWithCustomers.changeFirstName();
            case 2 -> actionsWithCustomers.changeSecondName();
            case 3 -> actionsWithCustomers.changeLogin();
            case 4 -> actionsWithCustomers.changePassword();
            case 5 -> actionsWithCustomers.changeBalance();
        }

    }

    public void customerCommands() throws SQLException {
        boolean working = true;
        while (working) {
            System.out.println("Choose command: ");
            System.out.println("1 -> View list of available items");
            System.out.println("2 -> Search item by category");
            System.out.println("3 -> Add item to cart");
            System.out.println("4 -> Delete item from cart");
            System.out.println("5 -> Buy items from cart");
            System.out.println("6 -> View list of cart");
            System.out.println("7 -> Log out");
            int menu = scanner.nextInt();
            switch (menu) {
                case 1 -> actionsWithItems.listOfItems();
                case 2 -> actionsWithItems.searchItem();
                case 3 -> actionsWithCart.addToCart(login, customers.get(findCustomer()).getCart());
                case 4 -> actionsWithCart.removeFromCart(login, customers.get(findCustomer()).getCart());
                case 5 ->
                        actionsWithCart.buyItems(login, customers.get(findCustomer()).getCart(), customers.get(findCustomer()).getBalance());
                case 6 -> actionsWithCart.listOfCart(login);
                case 7 -> working = false;
                default -> System.out.println("Unknown command! Try again!");
            }
        }
    }

    public int findCustomer() {
        int index = 0;
        for (Customer c : customers) {
            if (login.equals(c.getLogin())) {
                index = customers.indexOf(c);
            }
        }
        return index;
    }
}