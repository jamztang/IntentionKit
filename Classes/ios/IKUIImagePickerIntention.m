/*
 * This file is part of the IntentionKit package.
 * (c) James Tang <j@jamztang.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "IKUIImagePickerIntention.h"
@import AssetsLibrary;

@interface IKUIImagePickerIntention () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) UIImage *image;
@property (copy, nonatomic) NSDictionary *info;

@end


@implementation IKUIImagePickerIntention

- (void)startPickingImageFromIntention:(id)sender {

    if ( ! self.sourceViewController) {
        IKLog(@"sourceViewController is nil");
    }

    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = NO;

    // Make sure sourceType shouldn't crash
    UIImagePickerControllerSourceType sourceType = self.sourceType;
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        picker.sourceType = sourceType;
    } else {
        IKLog(@"sourceType %ld not available", sourceType);
    }

    [self.sourceViewController presentViewController:picker
                                            animated:YES
                                          completion:NULL];
}

#pragma mark Helper

- (UIImage *)thumbnailImageWithReferenceURL:(NSURL *)imageURL {

    IKLog(@"%@",imageURL);
    __block UIImage *chosenImage;
    ALAssetsLibraryAssetForURLResultBlock resultblock = ^(ALAsset *myasset)
    {
        CGImageRef imageRef = [myasset thumbnail];
        if (imageRef) {
            chosenImage = [UIImage imageWithCGImage:imageRef];
        }
    };

    ALAssetsLibraryAccessFailureBlock failureblock  = ^(NSError *myerror)
    {
        IKLog(@"booya, cant get image - %@",[myerror localizedDescription]);
    };

    if(imageURL)
    {
        ALAssetsLibrary* assetslibrary = [[ALAssetsLibrary alloc] init];
        [assetslibrary assetForURL:imageURL
                       resultBlock:resultblock
                      failureBlock:failureblock];
    }

    return chosenImage;
}

#pragma mark UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {

    NSURL *imageURL = [info valueForKey:UIImagePickerControllerReferenceURL];
    UIImage *image;
    if (imageURL) {
        image = [self thumbnailImageWithReferenceURL:imageURL];
    }

    if ( ! image) {
        image = info[UIImagePickerControllerEditedImage] ?: info[UIImagePickerControllerOriginalImage];
    }

    self.image = image;
    self.info  = info;
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    self.image = nil;    // release memory

    [self.sourceViewController dismissViewControllerAnimated:YES
                                                  completion:NULL];
}

@end
