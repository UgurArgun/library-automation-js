export class BrowserUtility {

    static async sleep(seconds){
        await new Promise((resolve) => setTimeout(resolve, seconds * 1000));
    }

    // ADD YOUR OWN BROWSER UTILITY FUNCTIONS HERE...
    
    //create a function that can verify expected and actual messages are equal, and use promises
    static async verifyMessages(actualMessage, expectedMessage) {
        return new Promise((resolve) => {
                resolve(actualMessage.toString() === expectedMessage.toString);
        });
    }

}