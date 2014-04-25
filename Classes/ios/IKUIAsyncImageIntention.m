/*
 * This file is part of the IntentionKit package.
 * (c) James Tang <j@jamztang.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "IKUIAsyncImageIntention.h"

@interface IKUIAsyncImageIntention ()

@property (nonatomic) BOOL isLoading;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSError *error;
@property (strong, nonatomic) NSData *data;
@property (strong, nonatomic) NSURLResponse *response;

@end

@implementation IKUIAsyncImageIntention

- (IBAction)loadImageWithIntention:(id)sender {

    [self startLoading];

    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]]
queue:[NSOperationQueue mainQueue]
    completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        self.error          = connectionError;
        self.data           = data;
        self.response       = response;
        self.image          = [UIImage imageWithData:data];
        [self sendActionsForControlEvents:UIControlEventValueChanged];
        [self stopLoading];
    }];
}

- (void)startLoading {
    self.isLoading = YES;
}

- (void)stopLoading {
    self.isLoading = NO;
}

- (void)clear {
    self.image          = nil;
    self.error          = nil;
    self.data           = nil;
    self.response       = nil;
}

@end
