//
//  AppDelegate.m
//  demo
//
//  Created by Xu Deng on 3/24/14.
//  Copyright (c) 2014 Xu Deng. All rights reserved.
//

#import "AppDelegate.h"
#import "AddMeetingMapViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
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

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    NSDictionary *userinfo = notification.userInfo;
    int notified = [(NSNumber*)[userinfo valueForKey:@"notified"] integerValue];
    if ([[UIApplication sharedApplication] applicationState] == UIApplicationStateActive && notified ==0) {
        
        // Show Alert Here
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Notification"
                                                        message:notification.alertBody
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
      //  [userinfo setValue:@"notified" forKey:[NSNumber numberWithInt:1]];
        [alert show];
    }
    [[UIApplication sharedApplication] cancelLocalNotification:notification];
    [UIApplication sharedApplication].applicationIconBadgeNumber  -=1;
}



@end
