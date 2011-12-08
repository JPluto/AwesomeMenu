//
//  AwesomeMenuAppDelegate.m
//  AwesomeMenu
//
//  Created by Joy Chiang on 11-12-1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "AwesomeMenuAppDelegate.h"
#import "AwesomeMenuViewController.h"

@implementation AwesomeMenuAppDelegate

@synthesize window=_window;
@synthesize viewController=_viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

@end
