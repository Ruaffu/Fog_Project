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
        commands.put("profilepage", new CommandUnprotectedPage("profilepage"));
        commands.put("editprofilepage", new CommandUnprotectedPage("editprofilepage"));
        commands.put("editusercommand", new EditUserCommand("profilepage"));
        commands.put("logoutpage", new CommandUnprotectedPage("logoutpage"));
        commands.put("requestcarportpage", new CommandUnprotectedPage("requestcarportpage"));
        commands.put("requestcommand", new RequestCommand("requestconfirmationpage" ));
        commands.put("retrieverequestcommand", new RetrieveRequestCommand("allrequestpage", "employee"));
        commands.put("makeoffercommand", new MakeOfferCommand("makeofferinfopage", "employee"));
        commands.put("getrequestcommand", new GetRequestCommand("requestdetailspage"));
        commands.put("makeofferinfopage", new CommandProtectedPage("makeofferinfopage","employee"));
        commands.put("makeofferadjustmentpage", new CommandProtectedPage("makeofferadjustmentpage","employee"));
        commands.put("makeofferpriceadjustmentpage", new CommandProtectedPage("makeofferpriceadjustmentpage","employee"));
        commands.put("makeofferconfirmpage", new CommandProtectedPage("makeofferconfirmpage","employee"));
        commands.put("makeoffermateriallistpage", new BOMCopyCommand("makeoffermateriallistpage","employee"));
        commands.put("updatecarportcommand", new UpdateCarportCommand("makeofferadjustmentpage", "employee"));
        commands.put("updateordercommand", new UpdateOrderCommand("makeoffermateriallistpage", "employee"));
        commands.put("addtobomlistcommand", new AddToBOMListCommand("makeoffermateriallistpage", "employee"));
        commands.put("removefrombomlistcommand", new RemoveFromBOMListCommand("makeoffermateriallistpage", "employee"));
        commands.put("updateorderpricecommand", new UpdateOrderPriceCommand("makeofferpriceadjustmentpage", "employee"));
        commands.put("saveoffercommand", new SaveOfferCommand("index", "employee"));
        commands.put("rejectoffercommand", new RejectOfferCommand("offerpage", "customer"));
        commands.put("acceptoffercommand", new AcceptOfferCommand("paymentpage", "customer"));
        commands.put("paymentpage", new CommandProtectedPage("paymentpage", "customer"));
        commands.put("orderpage", new CommandProtectedPage("orderpage", "customer"));
        commands.put("getorderdetailcommand", new GetOrderDetailCommand("orderdetailinfopage"));
        commands.put("orderdetailinfopage", new CommandUnprotectedPage("orderdetailinfopage"));
        commands.put("orderdetailmateriallistpage", new CommandUnprotectedPage("orderdetailmateriallistpage"));
        commands.put("orderdetaildrawingpage", new DrawOrderSVGCommand("orderdetaildrawingpage"));
        commands.put("orderdetailstatuspage", new CommandUnprotectedPage("orderdetailstatuspage"));
        commands.put("updatestatuscommand", new UpdateStatusCommand("orderdetailstatuspage","employee"));
        commands.put("offerpage", new CommandProtectedPage("offerpage", "customer"));
        commands.put("allorderpage", new OrderListCommand("allorderpage", "employee"));
        commands.put("deleteordercommand", new DeleteOrderCommand("allorderpage", "employee"));
        commands.put("allcustomercommand", new AllCustomerCommand("allcustomerpage", "employee"));
        commands.put("allcustomerpage", new CommandProtectedPage("allcustomerpage","employee"));
        commands.put("admineditusercommand", new AdminEditUserCommand("customerdetailspage","employee"));
        commands.put("customerdetailspage", new CommandProtectedPage("customerdetailspage","employee"));
        commands.put("editprofileadminpage", new CommandUnprotectedPage( "editprofileadminpage"));
        commands.put("materiallistcommand", new MaterialListCommand("productpage", "employee"));
        commands.put("productpage", new CommandProtectedPage("productpage", "employee"));
        commands.put("editproductpage", new CommandProtectedPage("editproductpage", "employee"));
        commands.put("editmateriallistcommand", new EditMaterialListCommand("editproductpage", "employee"));
        commands.put("savemateriallistcommand", new SaveMaterialListCommand("productpage", "employee"));
        commands.put("addmaterialcommand", new AddMaterialCommand("editproductpage", "employee"));
        commands.put("removefrommateriallistcommand", new RemoveFromMaterialListCommand("editproductpage", "employee"));
        commands.put("makeofferdrawingpage", new DrawSVGCommand("makeofferdrawingpage"));
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
