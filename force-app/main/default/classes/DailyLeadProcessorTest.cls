@isTest
public with sharing class DailyLeadProcessorTest {

    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    static testMethod void testDailyLeadProcessorTest() {
        List<Lead> listLead = new List<Lead>();
        for (Integer i=0; i<200; i++) {
            Lead ll = new Lead();
            ll.LastName = 'Test' + i;
            ll.Company = 'Company' + i;
            ll.Status = 'Open - Not Contacted';
            listLead.add(ll);
        }
        insert listLead;
        
        Test.startTest();
            DailyLeadProcessor daily = new DailyLeadProcessor();
            String jobId = System.schedule('Update LeadSource to Dreamforce', CRON_EXP, daily);
        
            List<Lead> liss = new List<Lead>([SELECT Id, LeadSource FROM Lead WHERE LeadSource != 'Dreamforce']);
        Test.stopTest();
    }   
}