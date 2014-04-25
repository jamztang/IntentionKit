/*
 * This file is part of the IntentionKit package.
 * (c) James Tang <j@jamztang.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "UISwitch+IKUIKitIntention.h"

@implementation UISwitch (IKUIKitIntention)

- (id)value {
    return @(self.on);
}

- (NSNumber *)number {
    return @(self.on);
}

- (IBAction)setOnWithNumberIntention:(id <IKNumberIntention>)intention {
    self.on = [intention.number boolValue];
}

@end
