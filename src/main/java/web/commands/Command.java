package web.commands;

import business.exceptions.UserException;
import business.persistence.Database;

import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class Command
{
    //Return a token string from the execute method to make a client side redirect,
    // instead of a server side (forward) redirect
    public final static String REDIRECT_INDICATOR = "#*redirect*#_###_";
    public final static String WAS_NOT_FOUND_COMMAND ="404_NOT_FOUND";

    private static HashMap<String, Command> commands;
    public static Database database;

    private static void initCommands(Database database)
    {
        commands = new HashMap<>();
        commands.put("index", new CommandUnprotectedPage("index"));

        commands.put("loginpage", new CommandUnprotectedPage("loginpage"));
        commands.put("logincommand", new LoginCommand("index"));
        commands.put("logoutcommand", new LogoutCommand(""));

        commands.put("registerpage", new CommandUnprotectedPage("registerpage"));
        commands.put("registercommand", new RegisterCommand("index"));

        commands.put("requestcommand", new RequestCommand("requestconfirmationpage", "customer"));
        commands.put("makeoffercommand", new MakeOfferCommand("createofferpage", "employee"));
        commands.put("sendoffercommand", new SendOfferCommand("retrieverequestcommand", "employee"));
        commands.put("acceptoffercommand", new AcceptOfferCommand("paymentpage", "customer"));

        commands.put("retrieverequestcommand", new RetrieveRequestCommand("makeofferpage", "employee"));

        commands.put("allorderpage", new OrderListCommand("allorderpage", "employee"));
        commands.put("requestpage", new CommandUnprotectedPage("requestcarportpage"));

        commands.put("paymentpage", new CommandProtectedPage("paymentpage", "customer"));
        commands.put("orderpage", new CommandProtectedPage("orderpage", "customer"));
        commands.put("offerpage", new CommandProtectedPage("offerpage", "customer"));

        commands.put("drawsvgcommand", new DrawSVGCommand("svgpage"));

        commands.put("bompage", new CommandProtectedPage("bompage", "employee"));

        commands.put("finduspage", new CommandUnprotectedPage("finduspage"));

        commands.put("profilepage", new CommandUnprotectedPage("profilepage"));
        commands.put("editprofilepage", new CommandUnprotectedPage("editprofilepage"));
        commands.put("editprofileadminpage", new CommandUnprotectedPage( "editprofileadminpage"));
        commands.put("editusercommand", new EditUserCommand("profilepage"));

        commands.put("allcustomercommand", new AllCustomerCommand("allcustomerpage", "employee"));
        commands.put("allcustomerpage", new CommandProtectedPage("allcustomerpage","employee"));
        commands.put("admineditusercommand", new AdminEditUserCommand("customerdetailspage","employee"));
        commands.put("customerdetailspage", new CommandProtectedPage("customerdetailspage","employee"));

        commands.put("bomcopycommand", new BOMCopyCommand("bompage", "employee"));

        commands.put("removefrombomlistcommand", new RemoveFromBOMListCommand("", "employee"));
        commands.put("updateordercommand", new UpdateOrderCommand("createofferpage", "employee"));
        commands.put("addtobomlistcommand", new AddToBOMListCommand("bompage", "employee"));

        commands.put("createofferpage", new CommandProtectedPage("createofferpage","employee"));
        commands.put("orderdetailcommand", new OrderDetailCommand("orderdetailspage", "employee"));
        commands.put("updatestatuscommand", new UpdateStatusCommand("allorderpage","employee"));
        commands.put("productpage", new CommandProtectedPage("productpage", "employee"));
        commands.put("editproductpage", new CommandProtectedPage("editproductpage", "employee"));
        commands.put("addmaterialcommand", new AddMaterialCommand("productpage", "employee"));
    }

    public static Command fromPath(
            HttpServletRequest request,
            Database db)
    {
        String action = request.getPathInfo().replaceAll("^/+", "");
        System.out.println("--> " + action);

        if (commands == null)
        {
            database = db;
            initCommands(database);
        }

        return commands.getOrDefault(action, new CommandUnknown());   // unknowncommand is default
    }

    public abstract String execute(
            HttpServletRequest request,
            HttpServletResponse response)
            throws UserException;

}
