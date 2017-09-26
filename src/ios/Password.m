//
//  Password.m
//  Password Cordova Plugin for iOS
//
//  Created by Raphael Fischer on 28.01.16.
//  Converted from OnePassword to GenericPassword by Benjamin Reed on 14.04.17.
//
//

#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>
#import "Password.h"
#import "OnePasswordExtension.h"

@implementation Password : CDVPlugin

@synthesize passwordExtension = _passwordExtension;

-(void)pluginInitialize
{
        OnePasswordExtension *extension = [[OnePasswordExtension alloc] init];
        _passwordExtension = extension;
}

- (void)fillItemIntoWebView:(CDVInvokedUrlCommand *)command
{


    void (^completionHandler)(BOOL success, NSError *error);

    completionHandler = ^void(BOOL success, NSError *error) {

        CDVPluginResult* pluginResult = nil;
        if(success){
            pluginResult =  [CDVPluginResult  resultWithStatus:CDVCommandStatus_OK messageAsString:@"success"];

        }
        else{
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"No logins found!"];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    };

    NSString* url = [command.arguments objectAtIndex:0];

    if(url != nil){
        [_passwordExtension fillLoginIntoWebView:self.webView forViewController:self.viewController sender:nil completion:completionHandler];
    }
    else{
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"URL is empty"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }

}

- (void)findLoginForUrl:(CDVInvokedUrlCommand *)command
{


    void (^completionHandler)(NSDictionary *loginDictionary, NSError *error);

    completionHandler = ^void(NSDictionary *loginDictionary, NSError *error) {

        CDVPluginResult* pluginResult = nil;
        if([loginDictionary count] > 0){
            pluginResult =  [CDVPluginResult  resultWithStatus:CDVCommandStatus_OK messageAsDictionary:loginDictionary];

        }
        else{
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"No logins found!"];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    };

    NSString* url = [command.arguments objectAtIndex:0];

    if(url != nil){
        [_passwordExtension findLoginForURLString:url forViewController:self.viewController sender:nil completion:completionHandler];
    }
    else{
                CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"URL is empty"];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }

}

-(void)storeLoginForURLString:(CDVInvokedUrlCommand *)command{



    NSDictionary *passwordGenerationOptions = @{
                                                // The minimum password length can be 4 or more.
                                                AppExtensionGeneratedPasswordMinLengthKey: @(8),

                                                // The maximum password length can be 50 or less.
                                                AppExtensionGeneratedPasswordMaxLengthKey: @(30)
                                                };

    void (^completionHandler)(NSDictionary *loginDictionary, NSError *error);

    completionHandler = ^void(NSDictionary *loginDictionary, NSError *error) {

        CDVPluginResult* pluginResult = nil;
        if([loginDictionary count] > 0){
            pluginResult =  [CDVPluginResult  resultWithStatus:CDVCommandStatus_OK messageAsDictionary:loginDictionary];

        }
        else{
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Unable to register login! "];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    };

    NSString* username = [command.arguments objectAtIndex:0];
    NSString* password = [command.arguments objectAtIndex:1];
    NSString* url = [command.arguments objectAtIndex:2];
    NSString* title = [command.arguments objectAtIndex:3];
    NSString* sectionTitle = [command.arguments objectAtIndex:4];

    if(url != nil  && username != nil && password != nil){
        NSDictionary *newLoginDetails = @{
                                          AppExtensionTitleKey: title? : @"",
                                          AppExtensionUsernameKey: username? : @"",
                                          AppExtensionPasswordKey: password ? : @"",
                                          AppExtensionNotesKey: @"Saved with the RangerRick Password Cordova Plugin",
                                          AppExtensionSectionTitleKey: sectionTitle? : @"",
                                                                                AppExtensionFieldsKey: @{
                                          //                                              @"firstname" : @"asdfsdf"? : @"",
                                          //                                              @"lastname" : @"sadfsdf" ? : @""
                                                                                        }
                                          };

        [[OnePasswordExtension sharedExtension] storeLoginForURLString:url loginDetails:newLoginDetails passwordGenerationOptions:passwordGenerationOptions forViewController:self.viewController sender:nil completion:completionHandler];
    }
    else{
                CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"URL is empty"];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }





}

@end
