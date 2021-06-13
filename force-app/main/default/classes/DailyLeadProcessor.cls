public  class DailyLeadProcessor implements  Schedulable {
    public DailyLeadProcessor() {

    }
    public void execute(SchedulableContext sc){
        List<Lead> lList = [Select Id, LeadSource from Lead where LeadSource = null];
        List<Lead> ld=new List<Lead>();
        if(!lList.isEmpty()) {
			for(Lead l: lList) {
				l.LeadSource = 'Dreamforce';
                ld.add(l);
			}
			update ld;
		}
    }
}