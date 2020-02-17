const functions = require('firebase-functions');

// Create and Deploy Your First Cloud Functions
// https://firebase.google.com/docs/functions/write-firebase-functions

exports.helloWorld = functions.https.onRequest((request, response) => {
 response.send("Hello from Firebase!");
});

exports.version = functions.https.onRequest((request, response) => {

    response.send({
        "version": "1.0.0",
        "strongVersion":"1.0.0",
        "weakVersion":"1.0.0"
    })
});
