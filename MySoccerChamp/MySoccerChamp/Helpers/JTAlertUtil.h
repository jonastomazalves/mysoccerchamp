//
//  JTAlertUtil.h
//  MySoccerChamp
//
//  Created by Jonas Tomaz on 7/29/14.
//  Copyright (c) 2014 Jonas Tomaz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JTAlertUtil : NSObject

+(void) showAlertWithMessage:(NSString*)message;
+(void)showAlertWithTitle:(NSString *)title andMessage:(NSString*) message andCancelButtonTitle:(NSString*) cancelButtonTitle andOtherButtonTitles:(NSString*)otherButtonTitle andDelegate:(id<UIAlertViewDelegate>)delegate;
+(void)showAlertWithTitle:(NSString *)title andMessage:(NSString*) message andCancelButtonTitle:(NSString*) cancelButtonTitle;

@end
