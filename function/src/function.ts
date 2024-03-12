import {
    HttpFunction,
} from '@google-cloud/functions-framework';
import {httpFunction as echo} from "./echo";

export const debug: HttpFunction = (req, res) => {
    console.log(req.path);
    switch (req.path) {
        case "/foo":
            echo(req,res);
            break;

        default:
            echo(req,res);
            break;
    }
}
