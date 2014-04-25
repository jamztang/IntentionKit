/*
 * This file is part of the IntentionKit package.
 * (c) James Tang <j@jamztang.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import <Foundation/Foundation.h>
#import "IKUIKitIntention.h"


@protocol IKUIImagePickerIntention <IKUIImageIntention>

- (NSDictionary *)info;

@end


@interface IKUIImagePickerIntention : UIControl <IKUIImagePickerIntention>

@property (weak, nonatomic) IBOutlet UIViewController *sourceViewController;
@property (assign, nonatomic) BOOL allowEditing;
@property (assign, nonatomic) UIImagePickerControllerSourceType sourceType;

- (IBAction)startPickingImageFromIntention:(id)sender;

@end
