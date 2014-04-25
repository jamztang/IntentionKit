//
//  ViewController.h
//  IntentionKitDemo
//
//  Created by James Tang on 23/4/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IntentionKit.h"

@interface IKLoadImageViewController : UIViewController

- (IBAction)appDidLaunch:(id)sender;
- (IBAction)appDidBecomeActive:(id)sender;
- (IBAction)appWillResignActive:(id)sender;
- (IBAction)appearValueDidChange:(id)sender;
- (IBAction)imageDidSelect:(id <IKUIImageIntention>)sender;

@end
