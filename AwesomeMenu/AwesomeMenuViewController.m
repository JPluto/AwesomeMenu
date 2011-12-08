//
//  AwesomeMenuViewController.m
//  AwesomeMenu
//
//  Created by Joy Chiang on 11-12-1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "AwesomeMenuViewController.h"

@implementation AwesomeMenuViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

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

    StoryMenu *menu = [[StoryMenu alloc] initWithFrame:self.view.bounds storyMenus:storyMenusArray];
    menu.delegate = self;
    [self.view addSubview:menu];
    [menu release];
}

- (void)tappedInStoryMenu:(StoryMenu *)storyMenu didSelectAtIndex:(NSInteger)index {
    NSLog(@"Select the index : %d",index);
}

@end