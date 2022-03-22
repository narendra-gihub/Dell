global class AccountBatchSchedule implements Schedulable {
   global void execute(SchedulableContext sc) {
      BatchAccountUpdate bt = new BatchAccountUpdate(); 
      database.executebatch(bt); 
   }
}