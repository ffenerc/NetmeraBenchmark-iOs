//
//  AppDelegate.m
//  Netmera
//
//  Created by Serhat SARI on 9/3/12.
//  Copyright (c) 2012 Serhat SARI. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "Parse/Parse.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    
    //[NetmeraClient initWithApiKey:@"WVhCd1ZYSnNQV2gwZEhBbE0wRWxNa1lsTWtZME5EYzNOamt5TkM1dVpYUnRaWEpoTG1OdmJTVXpRVGd3SlRKR2JXOWlhVzFsY21FbE1rWm5ZV1JuWlhRbE1rWm9iMjFsTG5odGJDWnViVk5wZEdWVmNtdzlhSFIwY0NVelFTVXlSaVV5UmpRME56YzJPVEkwTG01bGRHMWxjbUV1WTI5dEpUTkJPREFtYlc5a2RXeGxTV1E5TkRreU1pWmhjSEJKWkQwME5EYzNOamt5TkNadWJWUmxiWEJzWVhSbFBXMXZZbWwwWlcxd2JHRjBaU1p2ZDI1bGNrbGtQV2RsYm1NdGJYTjBZV1poSm1SdmJXRnBiajF1WlhSdFpYSmhMbU52YlNadWJWTnBkR1U5TkRRM056WTVNalFtYjNkdVpYSlNiMnhsVkhsd1pUMHhKblpwWlhkbGNsSnZiR1ZVZVhCbFBURW1kbWxsZDJWeVNXUTlaMlZ1WXkxdGMzUmhabUVt"];
    
    //[NetmeraClient initWithApiKey:@"WVhCd1ZYSnNQV2gwZEhBbE0wRWxNa1lsTWtZMU5UWTBOVGcxTlM1dVpYUnRaWEpoTG1OdmJTVXpRVGd3SlRKR2JXOWlhVzFsY21FbE1rWm5ZV1JuWlhRbE1rWm9iMjFsTG5odGJDWnViVk5wZEdWVmNtdzlhSFIwY0NVelFTVXlSaVV5UmpVMU5qUTFPRFUxTG01bGRHMWxjbUV1WTI5dEpUTkJPREFtYlc5a2RXeGxTV1E5TXpnNU1TWmhjSEJKWkQwMU5UWTBOVGcxTlNadWJWUmxiWEJzWVhSbFBXMXZZbWwwWlcxd2JHRjBaU1p2ZDI1bGNrbGtQWE5sY21oaGRDMXpZWEpwSm1SdmJXRnBiajF1WlhSdFpYSmhMbU52YlNadWJWTnBkR1U5TlRVMk5EVTROVFVtYjNkdVpYSlNiMnhsVkhsd1pUMHhKblpwWlhkbGNsSnZiR1ZVZVhCbFBURW1kbWxsZDJWeVNXUTljMlZ5YUdGMExYTmhjbWtt"];

    [NetmeraClient initWithApiKey:@"WVhCd1ZYSnNQV2gwZEhBbE0wRWxNa1lsTWtZMk1Ua3pPVE0xTnk1dVpYUnRaWEpoTG1OdmJTVXpRVGd3SlRKR2JXOWlhVzFsY21FbE1rWm5ZV1JuWlhRbE1rWm9iMjFsTG5odGJDWnViVk5wZEdWVmNtdzlhSFIwY0NVelFTVXlSaVV5UmpZeE9UTTVNelUzTG01bGRHMWxjbUV1WTI5dEpUTkJPREFtYlc5a2RXeGxTV1E5TlRNM015WmhjSEJKWkQwMk1Ua3pPVE0xTnladWJWUmxiWEJzWVhSbFBXMXZZbWwwWlcxd2JHRjBaU1p2ZDI1bGNrbGtQWE5sY21oaGRITmhjbWttWkc5dFlXbHVQVzVsZEcxbGNtRXVZMjl0Sm01dFUybDBaVDAyTVRrek9UTTFOeVp2ZDI1bGNsSnZiR1ZVZVhCbFBURW1kbWxsZDJWeVVtOXNaVlI1Y0dVOU1TWjJhV1YzWlhKSlpEMXpaWEpvWVhSellYSnBKZw=="];


    [[UIApplication sharedApplication] registerForRemoteNotificationTypes: UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.

    */
    
   // [[StackMob stackmob]endSession];
}

- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    NSString *token = [NSString stringWithFormat:@"%@",deviceToken];
    NSLog(@"Device Token =  %@" ,token);
    [NetmeraPushService registerInBackgroundWithToken:token];
    
}

- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err {
    
    // Do something
    NSString *str = [NSString stringWithFormat: @"Error: %@", err];
    NSLog(@"%@" ,str);
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    // Do something
    for (id key in userInfo) {
        NSLog(@"key: %@, value: %@", key, [userInfo objectForKey:key]);
    }
    
}


@end
