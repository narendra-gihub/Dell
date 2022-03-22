global class schedulebt implements Schedulable {
    global void execute(SchedulableContext ctx) {
        updateAccNameBatch bth = new updateAccNameBatch();
        database.executebatch(bth);
    }
}