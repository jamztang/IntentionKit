/*
 * This file is part of the IntentionKit package.
 * (c) James Tang <j@jamztang.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "IKUIAlertIntention.h"

@interface IKUIAlertIntention () <UIAlertViewDelegate>

@end

@implementation IKUIAlertIntention

- (void)startIntentionWithSender:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:self.titleLabel.text
                                                    message:self.messageLabel.text
                                                   delegate:self
                                          cancelButtonTitle:self.cancelButtonLabel.text
                                          otherButtonTitles:nil];

    [alert show];
}

#pragma mark UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == alertView.cancelButtonIndex) {
        if ( ! self.cancelIntention) {
            IKLog(@"cancelIntention is nil");
        }
        [self.cancelIntention startIntentionWithSender:self];
    }
}

@end
