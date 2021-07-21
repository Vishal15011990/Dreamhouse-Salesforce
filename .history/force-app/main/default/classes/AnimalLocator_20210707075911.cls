public with sharing class AnimalLocator {

    public static String  getAnimalNameById(Integer id){
        String res;
        Http h =new Http();
        HttpRequest req=new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        req.setMethod('GET');
        req.setHeader('Content-Type','application/json');
        HttpResponse response=h.send(req);
        if(response.getStatusCode()==200)
        {
            Map<String,Object> results=(Map<String,Object>)JSON.deserializeUntyped(response.getBody());
            Object animals=(Object)results.get('name');
            res=string.valueOf(animals);
        }
        return res;
    }
}
