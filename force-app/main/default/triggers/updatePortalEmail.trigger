trigger updatePortalEmail on Contact (after update) {
    list<user> uList = new list<user>();
    for(contact con:trigger.new){
        if(con.email!=null || con.email!=''){
            user u = [select id,email,userName from user where contactId=:con.id];
            u.email=con.email;
            uList.add(u);
        }    
    }
    if(uList.size()>0){
        update uList;
    }
}