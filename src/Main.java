import Actions.ActionsWithCustomers;
import Actions.MAIN_COMMANDS;
import Database.CustomerHandler;
import Database.ItemHandler;
import Items.Device;
import Persons.Customer;

import java.sql.SQLException;
import java.util.ArrayList;


public class Main {

    public static void main(String[] args) throws SQLException {
        ArrayList<Customer> customers = new ArrayList<>();
        ArrayList<Device> items = new ArrayList<>();
        CustomerHandler customerHandler = new CustomerHandler();
        customerHandler.updateCustomers(customers);
        ItemHandler itemHandler = new ItemHandler();
        itemHandler.updateItems(items);
        ActionsWithCustomers actionsWithCustomers = new ActionsWithCustomers(customers);
        MAIN_COMMANDS MAINCOMMANDS = new MAIN_COMMANDS();
        //You can test below
        MAINCOMMANDS.application();
    }
}