trigger InsertAfterPreQoute on Pre_Quote__c (after insert,after update,after delete,after undelete) {
 
    if(trigger.isAfter){
        if(trigger.isInsert){
            System.debug('Inserted Successfully');

             PreQouteHandler.afterInsertPreQoute(Trigger.new);
        }
        else if(trigger.isUpdate){
            System.debug('Updated Successfully');

             PreQouteHandler.afterUpdatePreQoute(Trigger.new,Trigger.oldMap);
        }

       else if(trigger.isDelete){
           System.debug('Deleted Successfully');
        PreQouteHandler.afterInsertPreQoute(Trigger.old); 
        }
       else  if(trigger.isUndelete){
            System.debug('Undeleted Successfuly');
            PreQouteHandler.afterundeletepreqoute(Trigger.new);
        }

    }

}