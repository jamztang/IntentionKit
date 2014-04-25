/*
 * This file is part of the IntentionKit package.
 * (c) James Tang <j@jamztang.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import <Foundation/Foundation.h>
#import "IKUIKitIntention.h"

@protocol IKUIAlertIntention <NSObject>

@property (assign, nonatomic, readonly) NSInteger buttonIndex;

@end


@interface IKUIAlertIntention : UIControl <IKUIAlertIntention>

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *message;
@property (copy, nonatomic) NSString *cancelButtonTitle;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *cancelButtonLabel;

- (IBAction)showAlertWithIntention:(id)sender;

@end
