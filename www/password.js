var exec = require('cordova/exec');
var cordova = require('cordova');

function Password() {

}

Password.prototype.findLoginForUrl = function (success, error, url) {
    exec(success, error, "Password", "findLoginForUrl", [url]);
};

Password.prototype.fillItemIntoWebView = function (success, error, url) {
    exec(success, error, "Password", "fillItemIntoWebView", [url]);
};

Password.prototype.storeLoginForUrl = function (success, error, username, password, url, title, sectionTitle) {
    exec(success, error, "Password", "storeLoginForURLString", [username, password, url, title, sectionTitle]);
};

module.exports = new Password();


