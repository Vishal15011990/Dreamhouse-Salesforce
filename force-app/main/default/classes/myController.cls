public with sharing class myController {

    @AuraEnabled
    public static void SystemError(){

        Integer a=5/0;
    }
}