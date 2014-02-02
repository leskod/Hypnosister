//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Lesko, Dereck on 2/2/14.
//  Copyright (c) 2014 Lesko, Dereck. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView
@synthesize circleColor;


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        //all hypnosisviews start with clear background color
        //[self setBackgroundColor:[UIColor clearColor]];
        [self setCircleColor:[UIColor lightGrayColor]];
    }
    return self;
}

-(void)drawRect:(CGRect)dirtyRect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    // find center of rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // radius should be nearly as big as the view
    //float maxRadius = hypot(bounds.size.width, bounds.size.height) / 4.0;
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    // thickness should be 10 points
    CGContextSetLineWidth(ctx, 10);
    
    // color of line should be gray
    //CGContextSetRGBStrokeColor(ctx, 0.6, 0.6, 0.6, 1.0);
    //[[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1] setStroke];
    [[UIColor lightGrayColor] setStroke];
    
    
//    // add a shape to the context - doesn't draw it
//    CGContextAddArc(ctx, center.x, center.y, maxRadius, 0.0, M_PI *2.0, YES);
//    
//    // perform drawing instruction
//    CGContextStrokePath(ctx);
    
    // sets it to use circleColor instead of lightGrey
    [[self circleColor] setStroke];
    
    // draw concentric circles from the ouside in
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20)
    {
        // add a path to the context
        CGContextAddArc(ctx, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
        
        //perform drawing instruction, removes path
        CGContextStrokePath(ctx);
    }
    
    NSString *text = @"You are getting sleepy.";
    
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    
    CGRect textRect;
    
    // how big is it
    textRect.size = [text sizeWithFont:font];
    
    // put it in the center of the view
    textRect.origin.x = center.x - textRect.size.width / 2.0;
    textRect.origin.y = center.y - textRect.size.height / 2.0;
    
    // set the fil color to black
    [[UIColor blackColor] setFill];
    
    
    // create shadow
    CGSize offset = CGSizeMake(4,3);
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    
    //Set the shaodw with these params
    //all future drawings will be shadowed
    CGContextSetShadowWithColor(ctx, offset, 2.0, color)    ;
    
    
    // draw the string
    [text drawInRect:textRect
            withFont:font];
    
    
    
    
}

-(BOOL)canBecomeFirstResponder
{
    return YES;
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if(motion==UIEventSubtypeMotionShake)
    {
        NSLog(@"Device started shaking");
        [self setCircleColor:[UIColor redColor]];
    }
}

-(void)setCircleColor:(UIColor *) clr;
{
    circleColor = clr;
    [self setNeedsDisplay];
}

@end
