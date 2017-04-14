//
//  GenericPassword.h
//  1password Cordova Plugin for iOS
//
//  Created by Raphael Fischer on 28.01.16.
//  Converted from OnePassword to GenericPassword by Benjamin Reed on 14.04.17.
//
//

#import <Cordova/CDV.h>
#import "GenericPasswordExtension.h"


@interface GenericPassword : CDVPlugin

@property (nonatomic, strong)  GenericPasswordExtension *passwordExtension;

-(void)pluginInitialize;

- (void)findLoginForUrl:(CDVInvokedUrlCommand*)command;
- (void)storeLoginForURLString:(CDVInvokedUrlCommand*)command;
- (void)fillItemIntoWebView:(CDVInvokedUrlCommand*)command;

@end
