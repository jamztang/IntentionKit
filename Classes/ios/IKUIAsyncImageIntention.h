/*
 * This file is part of the IntentionKit package.
 * (c) James Tang <j@jamztang.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import <Foundation/Foundation.h>
#import "IKUIKitIntention.h"


@protocol IKUIAsyncImageIntention <
IKURLResponseIntention,
IKUIImageIntention,
IKDataIntention,
IKErrorIntention,
IKAsynchronousIntention
>

@end



@interface IKUIAsyncImageIntention : UIControl <IKUIAsyncImageIntention>

@property (copy, nonatomic) NSString *urlString;

- (IBAction)loadImageWithIntention:(id)sender;

@end
