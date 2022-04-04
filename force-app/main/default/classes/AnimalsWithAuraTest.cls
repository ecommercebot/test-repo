@isTest
public with sharing class AnimalsWithAuraTest {

    @isTest 
    static  void testGetresults() {

        Test.setMock(HttpCalloutMock.class, new AnimalsGETHttpCalloutMock());

        List<Object> result = AnimalsWithAura.getCalloutResult();
        System.assertEquals(3, result.size());     
    }

    @isTest 
    static  void testPostresults() {

        Test.setMock(HttpCalloutMock.class, new AnimalsPOSTHttpCalloutMock()); 
        
        List<Object> result = AnimalsWithAura.postCalloutResult();
        List<Object> testList = new List<Object> { 'majestic badger', 'fluffy bunny', 'scary bear', 'chicken', 'mighty moose'};
        System.assertEquals(testList, result);

    }



}