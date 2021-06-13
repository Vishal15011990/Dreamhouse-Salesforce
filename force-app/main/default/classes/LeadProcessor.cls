public  class LeadProcessor implements Database.Batchable<SObject> 
{
    public LeadProcessor() {

    }
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([Select LeadSource from Lead]);
    }
    
    public void execute(Database.BatchableContext bc, List<Lead> lds)
    {
        for(Lead ls:lds){
            ls.LeadSource='Dreamforce';
        }
        update lds;
    }

    public void finish(Database.BatchableContext bc){

    }
}