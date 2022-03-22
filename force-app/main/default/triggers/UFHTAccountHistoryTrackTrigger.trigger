trigger UFHTAccountHistoryTrackTrigger On Account (before Update, after Update, after Delete) { 
 if(UserInfo.isCurrentUserLicensed('UFHT')) {
if(trigger.isBefore && trigger.isUpdate) { 
 new UFHT.DynamicTriggerGenericHandler().storeOldmapInBeforeUpdate(trigger.newMap, trigger.oldMap, 'Account'); }
 if(trigger.isAfter && trigger.isUpdate) { 
 new UFHT.DynamicTriggerGenericHandler().processDataInAfterUpdate(trigger.newMap, trigger.oldMap, 'Account'); }

if(trigger.isAfter && trigger.isDelete) { 
 new UFHT.DynamicTriggerGenericHandler().processRecordInAfterDelete(trigger.newMap, trigger.oldMap, 'Account'); }

 }

}