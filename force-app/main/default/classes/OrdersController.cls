public with sharing class OrdersController {

    public List<Order> orderList {get;set;}
    
    public OrdersController(){
        orderList = new List<Order>();
    }
    
    public List<Order> getOrders(){
        return [SELECT OrderNumber,enddate,status FROM Order WHERE OwnerID=: UserInfo.getUserId()];
    }
}