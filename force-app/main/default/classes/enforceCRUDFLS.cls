public with sharing class enforceCRUDFLS {
    public String getGetRandomName() {
        // Check if the user has read access on the Contact.Name field
        if (!Schema.sObjectType.Contact.fields.Name.isAccessible()){
          return '';
        }
        
        Contact [] myList = [SELECT Name FROM Contact LIMIT 1000];
        // Pick a list entry at random
        Integer index = Math.mod(Math.abs(Crypto.getRandomInteger()),myList.size());
        Contact selected = myList.get(index);
        return selected.Name;
    }
}