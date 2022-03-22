/*
 *@Name:  
 *@Author:
 *@Description:
 *@Creation Histroy: Narendra Vatala (09-09-2021)
 *@Modification History: Narendra Vatala (10-10-2021): 
 *						 Narendra Vatala (20-10-2021): Added createcontact method
 */

public class TestDataFactory {  
    
    public static void processDellModels()
    {
        DellModels__c dm = new DellModels__c();
        dm.Name='DM98090';
        dm.IsExpired__c=false;
        dm.Made_In__c='India';
        dm.BasicPrice__c=3000;
        dm.Approval_Status__c='In Progress';
        insert dm;
    }    
    
    //Test data for user
    public static List<User> createUsers(Integer records, String profileName){
        Profile p = [select id from profile where name =:profileName];
        List<User> lst = new List<User>();        
        for(Integer i=0; i<records;i++){
            User u = new User();
            u.Alias = 'standt';
            u.Email='standarduser'+i+'@testorg.com';
            u.EmailEncodingKey='UTF-8';
            u.LastName='Testing'+i; 
            u.LanguageLocaleKey='en_US';
            u.LocaleSidKey='en_US';
            u.ProfileId = p.Id; 
            u.TimeZoneSidKey='America/Los_Angeles';
            u.UserName='standarduser'+i+'@testorg.com'+i;
            lst.add(u);
        }
        insert lst;
        return lst;
    }
     
    //Test data for lead
    public static list<lead> createLeads(Integer records){
        list<lead> ldList = new list<lead>();  
        for(integer i=0;i<records;i++){
            lead ld = new lead();
            ld.LastName='TestLastName';
            ld.FirstName='TestLastName';
            ld.Company='TestCompany';
            ld.Status='Open';
            ldList.add(ld);
        }
        insert ldList;
        return ldList;
    }
    
    //Test data for lead conversion  
    public static void testLeadConv() {  
        Lead objLead = new Lead(FirstName='Test',LastName='Sample',Company='Testing Sample Co');  
        insert objLead;  
        Database.LeadConvert lc = new database.LeadConvert();  
        lc.setLeadId( objLead.Id );  
        lc.setDoNotCreateOpportunity( true );  
        lc.setConvertedStatus( 'Closed - Converted' ); 
        Database.LeadConvertResult lcr = Database.convertLead(lc, false); 
        system.debug( 'Errors are ' + lcr.getErrors() );  
        system.assert( lcr.isSuccess() );           
    }  
    
    //Test data from account
    public static List<Account> createAccounts(Integer records){
        List<Account> lst = new List<Account>();
        RecordType rt = [Select Id From RecordType Where SobjectType = 'Account' and Name = 'Name of your recordType'];
        for(Integer i=0; i<records; i++){
            Account a = new Account();
            a.Name ='test-'+i;
            a.RecordTypeId=rt.Id;
            a.Industry = 'Global Energy';
            a.Phone = '123456789'+i;
            a.BillingStreet = 'Test Street';
            a.BillingCity = 'Test City';
            a.BillingState = 'Ontario';
            a.BillingCountry = 'United States';
            a.BillingPostalCode = '123456';
            lst.add(a);
        }        
        insert lst;
        return lst;
    }
    
    //Test data for contact
    public static List<Contact> createContacts(Integer records){
        list<account> accList = createAccounts(2);
        List<Contact> lst = new List<Contact>();
        for(Integer i=0; i<records;i++){
            Contact c = new Contact();
            c.FirstName = 'Test';
            c.LastName = 'Contact '+i;
            c.AccountId = accList[0].id;
            c.Email = 'test'+i+'@testorg.com';
            lst.add(c);
        }
        insert lst;
        return lst;
    }
    
    //Test data for opportunity
    public static list<opportunity> createOpportunities(integer records){
        list<account> accList = createAccounts(2);
        list<opportunity> oppList = new list<opportunity>();
        for(integer i;i<records;i++){
            Opportunity opp = new Opportunity();
            opp.StageName = 'Prospecting';
            opp.CloseDate = system.today();
            opp.AccountId = accList[0].id; 
            opp.Name = 'Test Opportunity'+i;
            oppList.add(opp); 
        }
        insert oppList;
        return oppList;
    }
    
    //Test data for Pricebooks
    public static list<Pricebook2> createPricebooks(integer records){
        list<Pricebook2> pbList=new list<Pricebook2>();
        for(integer i;i<records;i++){
            Pricebook2 pb = new Pricebook2();
            pb.Name = 'Standard Price Book 2009';
            pb.Description = 'Price Book 2009 Products';
            pb.IsActive = true;
            pbList.add(pb);
        }
        insert pbList;
        return pbList;
    }
    
    //Test data for products
    public static list<product2> createProducts(integer records){
        list<product2> proList=new list<product2>();
        for(integer i;i<records;i++){
            Product2 prod = new Product2();
            prod.Name = 'Product X';
            prod.ProductCode = 'Pro-X';
            prod.isActive = true;
            proList.add(prod);
        } 
        insert proList;
        return proList;	
    }
    
    //Create your pricebook entry
    public static list<PricebookEntry> createPricebookEntries(integer records){
        list<PricebookEntry> proList=new list<PricebookEntry>();
        list<product2> prodList = createProducts(2);
        list<Pricebook2> pbList = createPricebooks(2);
        for(integer i;i<records;i++){
            PricebookEntry prb=new PricebookEntry();   
            prb.Pricebook2Id = pbList[0].id;  
            prb.Product2Id = prodList[0].Id;
            prb.UnitPrice = 100.00;
            prb.IsActive = true;
            proList.add(prb); 
        }
        insert proList;
        return proList;
    }
    
    //Create your opportunity line items
    public static list<OpportunityLineItem> createOppLineItems(integer records){
        list<OpportunityLineItem> OppLineItemList = new list<OpportunityLineItem>();
        list<opportunity> oppList = createOpportunities(2);
        list<PricebookEntry> pbList = createPricebookEntries(2);
        for(integer i;i<records;i++){
            OpportunityLineItem oli = new OpportunityLineItem();
            oli.OpportunityId = oppList[0].Id;
            oli.Quantity = 5;
            oli.PricebookEntryId = pbList[0].Id;
            oli.TotalPrice = oli.Quantity * pbList[0].UnitPrice;
            OppLineItemList.add(oli);
        }
        insert OppLineItemList;
        return OppLineItemList;
    }
    
    //Test data for order
    public static list<order> createOrders(integer records){
        list<account> accList = createAccounts(2);
        list<order> ordList = new list<order>();
        for(integer i;i<records;i++){
            order ord = new order();
            ord.AccountId=accList[0].id;
            ord.EffectiveDate=system.today();
            ordList.add(ord);
        }
        insert ordList;
        return ordList;
    }

    //Test data for order line items
    public static list<OrderItem> createOrderLineItems(integer records){
        list<order> ordList=createOrders(2);
        list<product2> prdList=createProducts(2);
        list<PricebookEntry> pbeList=createPricebookEntries(2);
        list<OrderItem> ordpList = new list<OrderItem>();
        for(integer i;i<records;i++){
            OrderItem lineItem = new OrderItem();
            lineItem.OrderId = ordList[0].id;
            lineItem.Quantity = 24;
            lineItem.UnitPrice = 240;
            lineItem.Product2id = prdList[0].id;
            lineItem.PricebookEntryId=pbeList[0].id;
            ordpList.add(lineItem);
        }
        insert ordpList;
        return ordpList;
    }
    
    //Test data for contract
    public static list<Contract> createContracts(integer records){
        list<Account> accList=createAccounts(2);
        list<product2> prdList=createProducts(2);
        list<PricebookEntry> pbeList=createPricebookEntries(2);
        list<Contract> ctrList = new list<Contract>();
        for(integer i;i<records;i++){
            Contract c = new Contract();
            c.Name = 'Test Contract';
            c.AccountId = accList[i].Id;
            c.Status = 'Draft';
            ctrList.add(c);
        }
        insert ctrList;
        return ctrList;
    } 
    
    //Test data for events
    public static List<Event> createEvents(Integer records, String wtId, DateTime startDate, String contId, String userId){
        List<Event> lst = new List<Event>();
        for(Integer i=0; i<records; i++){
            Event e = new Event();
            e.Subject = 'Test Event'+i;
            //e.WhatId = wtId;
            e.WhoId = wtId;
            e.StartDateTime = startDate;
            e.Description = 'Test Description';
            e.DurationInMinutes = 60;
            lst.add(e);
        }
        insert lst;
        
        Boolean eventRelation = false;
        if(contId != null || userId != null)
            eventRelation = true;
        
        if(eventRelation){
            List<EventRelation> erLst = new List<EventRelation>();
            for(Event e: lst){
                if(contId != null){
                    EventRelation er = new EventRelation();
                    er.EventId = e.Id;
                    er.RelationId = contId;                    
                    erLst.add(er);
                }                
                if(userId != null){
                    EventRelation er = new EventRelation();
                    er.EventId = e.Id;
                    er.RelationId = userId;
                    erLst.add(er);
                }
            }
            insert erLst;
        }        
        return lst;
    }
    
    //Test data for contentversion
    public static list<contentversion> createcontentversion(Integer records){
        List<ContentVersion> cvl = new List<ContentVersion>(); 
        for(integer i;i<records;i++){
            ContentVersion cv = new Contentversion(); 
            cv.PathOnClient = 'test'; 
            cv.VersionData = EncodingUtil.base64Decode('Unit Test Attachment Body'); 
            cvl.add(cv); 
        }
        insert cvl;
        return cvl;
    }
    
    //create ContentDocumentLink 
    public static list<ContentDocumentLink> createContentDocumentLink(integer records){
        List<ContentDocument> doc = [SELECT Id, Title, LatestPublishedVersionId FROM ContentDocument];
        list<ContentDocumentLink> cdlList = new list<ContentDocumentLink>();
        list<opportunity> oppList = createOpportunities(1);
        for(integer i;i<records;i++){
            ContentDocumentLink cdl = new ContentDocumentLink();
            cdl.LinkedEntityId = oppList[0].Id;
            cdl.ContentDocumentId = doc[0].Id; 
            cdl.ShareType = 'V';
            cdl.Visibility = 'AllUsers';
            cdlList.add(cdl);
        }
        insert cdlList;
        return cdlList;
    }
    
}