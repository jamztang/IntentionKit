/*
 * This file is part of the IntentionKit package.
 * (c) James Tang <j@jamztang.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "IKIntention.h"

@interface IKUIAlertIntention : NSObject <IKIntention>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *cancelButtonLabel;

@property (weak, nonatomic) IBOutlet id <IKIntention> cancelIntention;

@end
