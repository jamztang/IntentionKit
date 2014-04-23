/*
 * This file is part of the IntentionKit package.
 * (c) James Tang <j@jamztang.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import <Foundation/Foundation.h>

@protocol IKIntention;

@interface IKNotificationObserver : NSObject

@property (copy, nonatomic) NSString *name;
@property (weak, nonatomic) IBOutlet id object;

@property (weak, nonatomic) IBOutlet id <IKIntention> didNotifyIntention;

@end
