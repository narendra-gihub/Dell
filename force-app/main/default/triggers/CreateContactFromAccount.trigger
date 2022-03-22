trigger CreateContactFromAccount on Account (after insert) {
    /*for(account acc:trigger.new){
        CreateContact.prepareData(acc.Id);
    }*/
}