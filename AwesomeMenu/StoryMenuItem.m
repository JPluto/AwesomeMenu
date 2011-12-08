//
//  QuadCurveMenuItem.m
//  AwesomeMenu
//
//  Created by Levey on 11/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "StoryMenuItem.h"

static inline CGRect ScaleRect(CGRect rect, float n) {
    return CGRectMake((rect.size.width - rect.size.width * n) / 2, (rect.size.height - rect.size.height * n) / 2, rect.size.width * n, rect.size.height * n);
}

@implementation StoryMenuItem

@synthesize delegate;
@synthesize startPoint = _startPoint;
@synthesize endPoint = _endPoint;
@synthesize nearPoint = _nearPoint;
@synthesize farPoint = _farPoint;

+ (id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage backgroundImage:(UIImage *)backgroundImage highlightedBackgroundImage:(UIImage *)highlightedBackgroundImage {
    StoryMenuItem *item = [[[[self class] alloc] initWithImage:image highlightedImage:highlightedImage backgroundImage:backgroundImage highlightedBackgroundImage:highlightedBackgroundImage] autorelease];
    return item;
}

- (id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage backgroundImage:(UIImage *)backgroundImage highlightedBackgroundImage:(UIImage *)highlightedBackgroundImage {
    if ((self = [super init])) {
        self.userInteractionEnabled = YES;
        
        self.image = backgroundImage;
        self.highlightedImage = highlightedBackgroundImage;
        
        _contentImageView = [[UIImageView alloc] initWithImage:image];
        _contentImageView.highlightedImage = highlightedImage;
        [self addSubview:_contentImageView];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.highlighted = YES;
    if ([delegate respondsToSelector:@selector(storyMenuItemTouchesBegan:)]) {
        [delegate storyMenuItemTouchesBegan:self];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    // if move out of 2x rect, cancel highlighted.
    CGPoint location = [[touches anyObject] locationInView:self];
    if (!CGRectContainsPoint(ScaleRect(self.bounds, 2.0f), location)) {
        self.highlighted = NO;
    } else {
        self.highlighted = YES;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    self.highlighted = NO;
    // if stop in the area of 2x rect, response to the touches event.
    CGPoint location = [[touches anyObject] locationInView:self];
    if (CGRectContainsPoint(ScaleRect(self.bounds, 2.0f), location)) {
        if ([delegate respondsToSelector:@selector(storyMenuItemTouchesEnd:)]) {
            [delegate storyMenuItemTouchesEnd:self];
        }
    }
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    [_contentImageView setHighlighted:highlighted];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.bounds = CGRectMake(0, 0, self.image.size.width, self.image.size.height);
    
    float width = _contentImageView.image.size.width;
    float height = _contentImageView.image.size.height;
    _contentImageView.frame = CGRectMake(self.bounds.size.width/2 - width/2, self.bounds.size.height/2 - height/2, width, height);
}

- (void)dealloc {
    [_contentImageView release];
    [super dealloc];
}

@end