/*
 * This file is part of the IntentionKit package.
 * (c) James Tang <j@jamztang.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import <Foundation/Foundation.h>

#ifndef IKLog
#if DEBUG
#define IKLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define IKLog(fmt, ...)
#endif
#endif

@protocol IKIntention <NSObject>

- (IBAction)startIntentionWithSender:(id)sender;

@end


@interface IKIntention : NSObject <IKIntention>

@end

