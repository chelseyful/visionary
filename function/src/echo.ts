import {HttpFunction} from '@google-cloud/functions-framework';

export const httpFunction: HttpFunction = (req, res) => {

    // build some echo response...
    res.contentType('Application/json');
    res.setHeader('x-favorite-color', 'purple');

    // ship it!
    res.send(JSON.stringify({message: "It works!"}));
};
