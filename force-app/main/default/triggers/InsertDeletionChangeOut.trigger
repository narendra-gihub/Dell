trigger InsertDeletionChangeOut on Order (before insert,before update) {
	list<opportunity> opplist = new list<opportunity>(); 
}