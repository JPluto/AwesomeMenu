//
//  StoryMenuItem.h
//  AwesomeMenu
//
//  Created by Joy Chiang on 11-12-1.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StoryMenuItem;

@protocol StoryMenuItemDelegate <NSObject>
- (void)storyMenuItemTouchesBegan:(StoryMenuItem *)item;
- (void)storyMenuItemTouchesEnd:(StoryMenuItem *)item;
@end

////////////////////////////////////////////////////////

@interface StoryMenuItem : UIImageView {
    UIImageView *_contentImageView;
    CGPoint _startPoint;
    CGPoint _endPoint;
    CGPoint _nearPoint; // near
    CGPoint _farPoint; // far
}

@property (nonatomic) CGPoint startPoint;
@property (nonatomic) CGPoint endPoint;
@property (nonatomic) CGPoint nearPoint;
@property (nonatomic) CGPoint farPoint;
@property (nonatomic, assign) id<StoryMenuItemDelegate> delegate;

+ (id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage backgroundImage:(UIImage *)backgroundImage highlightedBackgroundImage:(UIImage *)highlightedBackgroundImage;

- (id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage backgroundImage:(UIImage *)backgroundImage highlightedBackgroundImage:(UIImage *)highlightedBackgroundImage;

@end