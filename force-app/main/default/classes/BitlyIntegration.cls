public with sharing class BitlyIntegration {

   //pass URL as paramaetr and same will be passed to Bitly for shorten

   public string shorten(String courseURL)
   {

    //HTTP post call 1- HTTP Object, 2- HTTp Requesr, 3 HTTP response

        Http h = new HTTP();

        HttpRequest req = new HttpRequest();
        req.setMethod('POST');

        //named cred - callout:credname/url

        req.setEndpoint('callout:Bitly/v4/shorten');
        req.setHeader('Authorization', 'Bearer {!$Credential.Password}');
        req.setHeader('Accept','application/json');
        req.setHeader('Content-Type', 'application/json');
        req.setBody(JSON.serialize(new Map<string,Object>
        {
            'group_guid'=>'{!$Credential.Username}',
            'long_url'=> courseURL,
            'domain'=>'bit.ly' 
        }));

        HttpResponse res = h.send(req);

        Map<string,Object> response = (Map<string,Object>)JSON.deserializeUntyped(res.getBody());
        string surl = (string ) response.get('link');

        return surl ;
    }
}
