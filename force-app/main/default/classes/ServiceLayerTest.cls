@isTest
private class ServiceLayerTest {
    
    @isTest 
    static  void testGetCallout() {

        Test.setMock(HttpCalloutMock.class, new AnimalsGETHttpCalloutMock());

        HttpResponse result = ServiceLayer.makeGetCallout();
        System.assertNotEquals(null,result, 'The callout returned a null response.');
        System.assertEquals(200,result.getStatusCode(), 'The status code is not 200.');
        System.assertEquals('application/json', result.getHeader('Content-Type'), 'The content type value is not expected.');     
        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(result.getBody());
        List<Object> animals = (List<Object>) results.get('animals');
        System.assertEquals(3, animals.size(), 'The array should only contain 3 items.');          
    }   

        @isTest 
    static void testPostCallout() {

        Test.setMock(HttpCalloutMock.class, new AnimalsPOSTHttpCalloutMock());  

        HttpResponse response = ServiceLayer.makePostCallout();
        String contentType = response.getHeader('Content-Type');
        System.assert(contentType == 'application/json');
        String actualValue = response.getBody();
        System.debug(response.getBody());
        String expectedValue = '{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}';
        System.assertEquals(expectedValue, actualValue);
        System.assertEquals(201, response.getStatusCode());
    }


}
