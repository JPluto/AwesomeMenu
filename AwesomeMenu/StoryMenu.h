//
//  StoryMenu.h
//  AwesomeMenu
//
//  Created by Joy Chiang on 11-12-1.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoryMenuItem.h"

@class StoryMenu;

@protocol StoryMenuDelegate <NSObject>
- (void)tappedInStoryMenu:(StoryMenu *)storyMenu didSelectAtIndex:(NSInteger)index;
@end

/////////////////////////////////////////////////////////////////////////////

@interface StoryMenu : UIView <StoryMenuItemDelegate> {
    int _flag;
    NSTimer *_timer;
    NSArray *_storyMenus;
    StoryMenuItem *_storyMenu;
}

@property (nonatomic, copy) NSArray *storyMenus;
@property (nonatomic, getter = isExpanding) BOOL expanding;
@property (nonatomic, assign) id<StoryMenuDelegate> delegate;
@property (nonatomic, retain, readonly) StoryMenuItem *storyMenu;

- (id)initWithStoryMenus:(NSArray *)aStoryMenus;

@end