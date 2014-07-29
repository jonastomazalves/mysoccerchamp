//
//  StoryboardUtil.h
//  MySoccerChamp
//
//  Created by Jonas Tomaz on 7/29/14.
//  Copyright (c) 2014 Jonas Tomaz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoryboardUtil : NSObject
+(UIViewController *)viewControllerWithStoryboard:(NSString *)storyboardName controllerName:(NSString *)controllerName;
@end
