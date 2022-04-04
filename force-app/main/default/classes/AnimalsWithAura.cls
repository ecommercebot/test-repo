
public with sharing class AnimalsWithAura {

    @AuraEnabled(cacheable=true)
    public static List<Object> getCalloutResult() {
        HttpResponse response = ServiceLayer.makeGetCallout();
        List<Object> animals;

        if(response.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            animals = (List<Object>) results.get('animals');
            System.debug(animals);
        }
        return animals;

    }




    @AuraEnabled(cacheable=true)
    public static List<Object> postCalloutResult() {
        HttpResponse response = ServiceLayer.makePostCallout();
        List<Object> animals;

        if(response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus());
        } else {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            animals = (List<Object>) results.get('animals');
            System.debug(animals);
        }
        return animals;

    }

}
