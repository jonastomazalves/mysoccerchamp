//
//  JTAppDelegate.m
//  MySoccerChamp
//
//  Created by Jonas Tomaz on 7/28/14.
//  Copyright (c) 2014 Jonas Tomaz. All rights reserved.
//

#import "JTAppDelegate.h"
#import <Parse/Parse.h>
#import <FacebookSDK/FacebookSDK.h>

@implementation JTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self configureParse:launchOptions];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [FBAppCall handleOpenURL:url
                  sourceApplication:sourceApplication
                        withSession:[PFFacebookUtils session]];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
}


#pragma mark - Parse Configuration
- (void)configureParse:(NSDictionary *)launchOptions
{
    [Parse setApplicationId:kParseApplicationId
                  clientKey:kParseClientKey];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
}



@end
