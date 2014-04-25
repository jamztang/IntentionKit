//
//  IKBindingViewController.m
//  IntentionKitDemo
//
//  Created by James Tang on 25/4/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import "IKKVOViewController.h"

@interface IKKVOViewController ()

// Interface Builder
@property (nonatomic) NSUInteger total;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

// Internal State
@property (nonatomic) NSUInteger counter;

@end


@implementation IKKVOViewController

- (IBAction)switchValueDidChange:(UISwitch *)sender {
    self.counter += sender.on ? 1 : -1;
}

- (IBAction)counterValueDidChange:(id)sender {

    if (self.counter < self.total) {
        if ( ! self.loadingIndicator.isAnimating) {
            [self.loadingIndicator startAnimating];
        }
    } else {
        [self.loadingIndicator stopAnimating];
    }

    [self.progressView setProgress:((CGFloat)self.counter / (CGFloat)self.total) animated:YES];
}

@end
