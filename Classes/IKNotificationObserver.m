/*
 * This file is part of the IntentionKit package.
 * (c) James Tang <j@jamztang.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "IKNotificationObserver.h"
#import "IKIntention.h"

@implementation IKNotificationObserver

- (void)awakeFromNib {
    [super awakeFromNib];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveNotifcation:)
                                                 name:self.name
                                               object:self.object];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:self.name
                                                  object:self.object];
}

- (void)didReceiveNotifcation:(NSNotification *)notification {
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (id)value {
    return self.object;
}

@end
