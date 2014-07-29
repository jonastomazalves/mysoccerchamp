//
//  StoryboardUtil.m
//  MySoccerChamp
//
//  Created by Jonas Tomaz on 7/29/14.
//  Copyright (c) 2014 Jonas Tomaz. All rights reserved.
//

#import "StoryboardUtil.h"

@implementation StoryboardUtil

+(UIViewController *)viewControllerWithStoryboard:(NSString *)storyboardName controllerName:(NSString *)controllerName{
    if (!storyboardName || !controllerName)
        return nil;
    
    NSString *deviceStoryboardName = storyboardName;
    if (IS_IPAD)
        deviceStoryboardName = [NSString stringWithFormat:@"%@_iPad", storyboardName];
    else
        deviceStoryboardName = [NSString stringWithFormat:@"%@_iPhone", storyboardName];
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:deviceStoryboardName bundle:nil];
    if (!mainStoryboard)
        return nil;
    
    return [mainStoryboard instantiateViewControllerWithIdentifier:controllerName];
}

@end
