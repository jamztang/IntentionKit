/*
 * This file is part of the IntentionKit package.
 * (c) James Tang <j@jamztang.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import <UIKit/UIKit.h>
#import "IKIntention.h"

@protocol IKUIKitIntentionWithImage <IKIntention>

- (void)startIntentionWithSender:(id)sender image:(UIImage *)image;

@end
