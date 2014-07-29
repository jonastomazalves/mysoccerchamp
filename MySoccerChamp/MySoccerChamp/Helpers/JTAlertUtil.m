//
//  JTAlertUtil.m
//  MySoccerChamp
//
//  Created by Jonas Tomaz on 7/29/14.
//  Copyright (c) 2014 Jonas Tomaz. All rights reserved.
//

#import "JTAlertUtil.h"

@implementation JTAlertUtil

+(void) showAlertWithMessage:(NSString*)message{
    [self showAlertWithTitle:nil andMessage:message andCancelButtonTitle:@"OK"];
}

+(void)showAlertWithTitle:(NSString *)title andMessage:(NSString*) message andCancelButtonTitle:(NSString*) cancelButtonTitle{
    [self showAlertWithTitle:title andMessage:message andCancelButtonTitle:cancelButtonTitle andOtherButtonTitles:nil andDelegate:nil];
}

+(void)showAlertWithTitle:(NSString *)title andMessage:(NSString*) message andCancelButtonTitle:(NSString*) cancelButtonTitle andOtherButtonTitles:(NSString*)otherButtonTitle andDelegate:(id<UIAlertViewDelegate>)delegate{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:delegate
                                          cancelButtonTitle:cancelButtonTitle
                                          otherButtonTitles: otherButtonTitle, nil];
    [alert show];
}

@end
