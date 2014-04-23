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

@end


@implementation IKUIImagePickerIntention

- (void)startIntentionWithSender:(id)sender {

    if ( ! self.sourceViewController) {
        IKLog(@"sourceViewController is nil");
    }

    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = NO;
    picker.sourceType = self.sourceType;

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

    if ( ! self.imageDidPickIntention) {
        IKLog(@"imageDidPickIntention is nil");
    }

    if ([self.imageDidPickIntention respondsToSelector:@selector(startIntentionWithSender:image:)]) {
        [self.imageDidPickIntention startIntentionWithSender:self image:image];
    } else {
        [self.imageDidPickIntention startIntentionWithSender:self];
    }

    [self.sourceViewController dismissViewControllerAnimated:YES
                                                  completion:NULL];
}

@end
