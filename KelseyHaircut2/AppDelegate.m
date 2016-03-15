//
//  AppDelegate.m
//  KelseyHaircut2
//
//  Created by me on 6/26/13.
//  Copyright (c) 2013 me. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate

static NSString *APP_ID = @"F443F0E9-D3E9-2FA5-FFBB-AA6A88DE2D00";
static NSString *SECRET_KEY = @"5D181B3E-3F29-A2D5-FF8A-CDFC24196900";
static NSString *VERSION_NUM = @"v1";

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
      
    // Override point for customization after application launch.
    
    [backendless initApp:APP_ID secret:SECRET_KEY version:VERSION_NUM];
    backendless.hostURL = @"https://api.backendless.com";
    
#if IS_COREDATA_ON
    
    _managedObjectModel = nil;
    _persistentStoreCoordinator = nil;
    _managedObjectContext = nil;
    
    [self managedObjectContext];
    
    __types.managedObjectModel = _managedObjectModel;
    __types.managedObjectContext = _managedObjectContext;
    
#endif

    
    
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

@end
