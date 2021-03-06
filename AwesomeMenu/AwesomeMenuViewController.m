//
//  AwesomeMenuViewController.m
//  AwesomeMenu
//
//  Created by Joy Chiang on 11-12-1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "AwesomeMenuViewController.h"

@implementation AwesomeMenuViewController

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 按钮选中与不选中图片
    UIImage *backgroundImage = [UIImage imageNamed:@"story-button.png"];
    UIImage *highlightedBackgroundImage = [UIImage imageNamed:@"story-button-pressed.png"];
    
    NSArray *storyImages = [NSArray arrayWithObjects:
                            [UIImage imageNamed:@"story-camera.png"],
                            [UIImage imageNamed:@"story-people.png"],
                            [UIImage imageNamed:@"story-place.png"],
                            [UIImage imageNamed:@"story-music.png"],
                            [UIImage imageNamed:@"story-thought.png"],
                            [UIImage imageNamed:@"story-sleep.png"], nil];
    
    NSMutableArray *storyMenusArray = [NSMutableArray array];
    for (UIImage *storyImage in storyImages) {
        StoryMenuItem *menuItem = [StoryMenuItem initWithImage:storyImage
                                                 highlightedImage:nil
                                                 backgroundImage:backgroundImage
                                                 highlightedBackgroundImage:highlightedBackgroundImage];
        [storyMenusArray addObject:menuItem];
    }

    StoryMenu *storyMenu = [[StoryMenu alloc] initWithStoryMenus:storyMenusArray];
    storyMenu.delegate = self;
    [self.view addSubview:storyMenu];
    [storyMenu release];
}

- (void)tappedInStoryMenu:(StoryMenu *)storyMenu didSelectAtIndex:(NSInteger)index {
    NSLog(@"Select the index : %d",index);
}

- (void)dealloc {
    [super dealloc];
}

@end