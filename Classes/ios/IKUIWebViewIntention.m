/*
 * This file is part of the IntentionKit package.
 * (c) James Tang <j@jamztang.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "IKUIWebViewIntention.h"
#import "IKUIKitIntention.h"

@implementation IKUIWebViewIntention

#pragma mark Logic

- (void)loadURLString {
    NSString *localPath = [[NSBundle mainBundle] pathForResource:self.urlString ofType:@""];
    NSURL *url = localPath ? [NSURL fileURLWithPath:localPath] : [NSURL URLWithString:self.urlString];
    IKLog(@"url %@, urlString %@", url, self.urlString);
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

#pragma mark Overrides

- (void)setUrlString:(NSString *)urlString {
    _urlString = [urlString copy];
    [self loadURLString];
}

- (void)setWebView:(UIWebView *)webView {
    _webView = webView;
    [self loadURLString];
}

#pragma mark Action

- (IBAction)backButtonDidPress:(id)sender {
    [self.webView goBack];
}

- (IBAction)refreshButtonDidPress:(id)sender {
    [self.webView reload];
}

#pragma mark UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self.activityIndicator startAnimating];
    self.titleLabel.text = [webView request].URL.absoluteString;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.activityIndicator stopAnimating];
    NSString *pageTitle = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.titleLabel.text = pageTitle;
}

@end
