/*
 * This file is part of the IntentionKit package.
 * (c) James Tang <j@jamztang.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "UIImageView+IKUIKitIntention.h"

@implementation UIImageView (IKUIKitIntention)

- (void)startIntentionWithSender:(id)sender {
    // Nothing
}

- (void)startIntentionWithSender:(id)sender image:(UIImage *)image {
    self.image = image;
}

@end
