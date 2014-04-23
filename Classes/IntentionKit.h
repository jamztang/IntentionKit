/*
 * This file is part of the IntentionKit package.
 * (c) James Tang <j@jamztang.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "IKIntention.h"
#import "IKKeyValueObserver.h"
#import "IKNotificationObserver.h"

#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE
    #import "IKUIKitIntention.h"
#elif TARGET_OS_MAC
#else
// Unsupported platform
#endif