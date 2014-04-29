/*
 * This file is part of the IntentionKit package.
 * (c) James Tang <j@jamztang.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import <UIKit/UIKit.h>

@interface IKUIWebViewIntention : NSObject <UIWebViewDelegate>

@property (copy, nonatomic) NSString *urlString;    // For initial Load

// UI elements
@property (weak, nonatomic) IBOutlet UIWebView *webView;    // Controlling the webview
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;    // Show the loading indicator
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;   // To display title and the loading URL

- (IBAction)backButtonDidPress:(id)sender;
- (IBAction)refreshButtonDidPress:(id)sender;

@end
