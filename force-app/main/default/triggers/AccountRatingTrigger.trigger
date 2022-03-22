trigger AccountRatingTrigger on Account (before insert) {
    for(account acc:trigger.new){
        if(acc.Rating=='Hot'){
            acc.Rating.addError('Can not choose rating as Hot');
        }
    }
}