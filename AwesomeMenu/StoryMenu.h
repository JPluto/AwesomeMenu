//
//  QuadCurveMenu.h
//  AwesomeMenu
//
//  Created by Levey on 11/30/11.
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

- (id)initWithFrame:(CGRect)frame storyMenus:(NSArray *)aStoryMenus;

@end