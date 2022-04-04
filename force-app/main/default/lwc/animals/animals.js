import { LightningElement, wire } from 'lwc';
import getCalloutResult from '@salesforce/apex/AnimalsWithAura.getCalloutResult';
import postCalloutResult from '@salesforce/apex/AnimalsWithAura.postCalloutResult';

export default class Animals extends LightningElement {
    animalsGet 
    animalsPost
    spinner = false 

    @wire(getCalloutResult)
    animalsArray({ error, data }) {
        if (data) {
            console.log(data)
            this.animalsGet = data
        } else if (error) {
            console.log(error)
        }
    }

    handleClick() {

        this.spinner = true

        postCalloutResult()
        .then(data => {
            console.log(data)
            this.spinner = false
            this.animalsPost = data
        }) 
        .catch(error => {
            console.log(error)
            this.spinner = false
        })

    }

}