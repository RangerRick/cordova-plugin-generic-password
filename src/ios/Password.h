//
//  Password.h
//  1password Cordova Plugin for iOS
//
//  Created by Raphael Fischer on 28.01.16.
//  Converted from OnePassword to Password by Benjamin Reed on 14.04.17.
//
//

#import <Cordova/CDV.h>
#import "OnePasswordExtension.h"


@interface Password : CDVPlugin

@property (nonatomic, strong)  OnePasswordExtension *passwordExtension;

-(void)pluginInitialize;

- (void)findLoginForUrl:(CDVInvokedUrlCommand*)command;
- (void)storeLoginForURLString:(CDVInvokedUrlCommand*)command;
- (void)fillItemIntoWebView:(CDVInvokedUrlCommand*)command;

@end
