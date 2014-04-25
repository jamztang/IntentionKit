/*
 * This file is part of the IntentionKit package.
 * (c) James Tang <j@jamztang.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "IKUIAlertIntention.h"

@interface IKUIAlertIntention () <UIAlertViewDelegate>

@property (assign, nonatomic) NSInteger buttonIndex;

@end

@implementation IKUIAlertIntention

- (IBAction)showAlertWithIntention:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:self.titleLabel.text ?: self.title
                                                    message:self.messageLabel.text ?: self.message
                                                   delegate:self
                                          cancelButtonTitle:self.cancelButtonLabel.text ?: self.cancelButtonTitle
                                          otherButtonTitles:nil];

    [alert show];
}

#pragma mark UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    self.buttonIndex = buttonIndex;
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

@end
