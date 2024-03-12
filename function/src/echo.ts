import {
    HttpFunction,
} from '@google-cloud/functions-framework';

export const httpFunction: HttpFunction = (req, res) => {

    res.contentType('Application/json');
    res.setHeader('x-favorite-color', 'purple');
    res.setHeader('Cache-Control', 'no-cache');

    switch (req.method) {
        case "GET":
            get(req, res);
            break;
        default:
            unsupported(req, res);
            break;
    }
};

const get: HttpFunction = (req, res) => {
    let echoText = "";
    if (req.params.message) {
        echoText = req.params.message
    }
    res.status(200);
    res.send({
        message: echoText
    });
}

const unsupported: HttpFunction = (req, res) => {
    res.status(400);
    res.send({
        error: "This method is not supported"
    });
}
