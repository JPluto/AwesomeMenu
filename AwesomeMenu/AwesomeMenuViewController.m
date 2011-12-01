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
    
    UIImage *storyMenuItemImage = [UIImage imageNamed:@"story-button.png"];
    UIImage *storyMenuItemImagePressed = [UIImage imageNamed:@"story-button-pressed.png"];
    
    // Camera MenuItem.
    QuadCurveMenuItem *cameraMenuItem = [[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage
                                                                highlightedImage:storyMenuItemImagePressed 
                                                                    ContentImage:[UIImage imageNamed:@"story-camera.png"] 
                                                         highlightedContentImage:nil];   
    // People MenuItem.
    QuadCurveMenuItem *peopleMenuItem = [[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage
                                                                highlightedImage:storyMenuItemImagePressed 
                                                                    ContentImage:[UIImage imageNamed:@"story-people.png"] 
                                                         highlightedContentImage:nil];    
    // Place MenuItem.
    QuadCurveMenuItem *placeMenuItem = [[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage
                                                               highlightedImage:storyMenuItemImagePressed 
                                                                   ContentImage:[UIImage imageNamed:@"story-place.png"] 
                                                        highlightedContentImage:nil];    
    // Music MenuItem.
    QuadCurveMenuItem *musicMenuItem = [[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage
                                                               highlightedImage:storyMenuItemImagePressed 
                                                                   ContentImage:[UIImage imageNamed:@"story-music.png"] 
                                                        highlightedContentImage:nil];    
    // Thought MenuItem.
    QuadCurveMenuItem *thoughtMenuItem = [[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage
                                                                 highlightedImage:storyMenuItemImagePressed 
                                                                     ContentImage:[UIImage imageNamed:@"story-thought.png"] 
                                                          highlightedContentImage:nil];   
    // Sleep MenuItem.
    QuadCurveMenuItem *sleepMenuItem = [[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage
                                                               highlightedImage:storyMenuItemImagePressed 
                                                                   ContentImage:[UIImage imageNamed:@"story-sleep.png"] 
                                                        highlightedContentImage:nil];
    
    NSArray *menus = [NSArray arrayWithObjects:cameraMenuItem, peopleMenuItem, placeMenuItem, musicMenuItem, thoughtMenuItem, sleepMenuItem, nil];
    [cameraMenuItem release];
    [peopleMenuItem release];
    [placeMenuItem release];
    [musicMenuItem release];
    [thoughtMenuItem release];
    [sleepMenuItem release];
    QuadCurveMenu *menu = [[QuadCurveMenu alloc] initWithFrame:self.view.bounds menus:menus];
    menu.delegate = self;
    [self.view addSubview:menu];
    [menu release];
}

- (void)quadCurveMenu:(QuadCurveMenu *)menu didSelectAtIndex:(NSInteger)index
{
    NSLog(@"Select the index : %d",index);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
