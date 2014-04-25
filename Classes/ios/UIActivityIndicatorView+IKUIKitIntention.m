/*
 * This file is part of the IntentionKit package.
 * (c) James Tang <j@jamztang.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "UIActivityIndicatorView+IKUIKitIntention.h"

@implementation UIActivityIndicatorView (IKUIKitIntention)

- (IBAction)shouldAnimateWithNumberIntention:(id <IKNumberIntention>)sender {
    if ([sender.number boolValue]) {
        [self startAnimating];
    } else {
        [self stopAnimating];
    }
}

@end
