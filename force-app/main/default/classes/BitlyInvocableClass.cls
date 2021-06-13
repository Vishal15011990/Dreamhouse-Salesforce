public with sharing class BitlyInvocableClass {

    @invocableMethod(label='Shorten URL' description='Genertae short url with bitly API')
    public static void shorten(list<id> courseIds)
    {
        shortenFuture(courseIds);
    }

    @future(callout=true)
    public static void shortenFuture(list<id> courseIds)
    {
        list<Course__c> courselist = [SELECT Id,Name,Course_Url__c ,Coupon_Code__c from Course__c where id in:courseIds WITH SECURITY_ENFORCED];

        BitlyIntegration bservice = new BitlyIntegration();

        for(Course__c course : courselist)
        {
            string fullURL = course.Course_Url__c;

            if(course.Coupon_Code__c!=null)
            {
                fullURL = fullURL +'?couponCode='+course.Coupon_Code__c;
            }
            string shorturl = bservice.shorten(fullURL);
            course.Short_Url__c = shorturl;

        }

        if(courselist.size()>0)
        {
            update courselist;     
        }

    }
}
