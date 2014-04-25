/*
 * This file is part of the IntentionKit package.
 * (c) James Tang <j@jamztang.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import <Foundation/Foundation.h>
#import "IKUIKitIntention.h"


@protocol IKKeyValueObserverIntention <IKNumberIntention, IKUIControlValueChangeIntention>

- (id)value;
- (NSDictionary *)change;

// Additional Logic Gate
- (BOOL)isNil;

@end



@interface IKKeyValueObserver : UIControl <IKKeyValueObserverIntention>

@property (unsafe_unretained, nonatomic) IBOutlet id target;       // unsafe_unretain is used to be reference to dealloc the observer
@property (copy, nonatomic) NSString *keyPath;
@property (assign, nonatomic) NSKeyValueObservingOptions options;  // default NSKeyValueObservingOptionNew


@end
