//
//  AwesomeMenuAppDelegate.h
//  AwesomeMenu
//
//  Created by Joy Chiang on 11-12-1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AwesomeMenuViewController;

@interface AwesomeMenuAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet AwesomeMenuViewController *viewController;

@end
