package business.services;

import business.entities.Order;
import business.persistence.BOMMapper;
import business.persistence.Database;
import business.persistence.OrderMapper;

public class OrderFacade {
    OrderMapper orderMapper;
    BOMMapper bomMapper;

    public OrderFacade(Database database) {
        orderMapper = new OrderMapper(database);
        bomMapper = new BOMMapper(database);
    }

    public void saveOrder(Order order){
        orderMapper.saveOrder(order);
        bomMapper.saveBOM(order);
    }


}
