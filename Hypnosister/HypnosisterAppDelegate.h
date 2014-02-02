//
//  HypnosisterAppDelegate.h
//  Hypnosister
//
//  Created by Lesko, Dereck on 2/2/14.
//  Copyright (c) 2014 Lesko, Dereck. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HypnosisView.h"


@interface HypnosisterAppDelegate : UIResponder <UIApplicationDelegate>
{
    HypnosisView *view;
}
@property (strong, nonatomic) UIWindow *window;

@end
