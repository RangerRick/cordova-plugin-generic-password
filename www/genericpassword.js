var exec = require('cordova/exec');
var cordova = require('cordova');

function GenericPassword() {

}

GenericPassword.prototype.findLoginForUrl = function (success, error, url) {
    exec(success, error, "GenericPassword", "findLoginForUrl", [url]);
};

GenericPassword.prototype.fillItemIntoWebView = function (success, error, url) {
    exec(success, error, "GenericPassword", "fillItemIntoWebView", [url]);
};

GenericPassword.prototype.storeLoginForUrl = function (success, error, username, password, url, title, sectionTitle) {
    exec(success, error, "GenericPassword", "storeLoginForURLString", [username, password, url, title, sectionTitle]);
};

module.exports = new GenericPassword();


