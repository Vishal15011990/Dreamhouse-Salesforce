@isTest
global class AnimalLocatorMock implements HttpCalloutMock{
     global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"animal":[{"id":1,"name":"chicken"},{"id":2,"name":"duck"}]}');
        response.setStatusCode(200);
        return response; 
    }
}