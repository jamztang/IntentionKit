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

@end

@protocol IKStringIntention <IKIntention>

- (NSString *)string;

@end

@protocol IKNumberIntention <IKIntention>

- (NSNumber *)number;

@end

@protocol IKURLResponseIntention <IKIntention>

- (NSURLResponse *)response;

@end

@protocol IKErrorIntention <IKIntention>

- (NSError *)error;

@end

@protocol IKDataIntention <IKIntention>

- (NSData *)data;

@end

@protocol IKAsynchronousIntention <IKIntention>

- (BOOL)isLoading;

@end
