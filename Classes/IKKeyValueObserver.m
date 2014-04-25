/*
 * This file is part of the IntentionKit package.
 * (c) James Tang <j@jamztang.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "IKKeyValueObserver.h"

@interface IKKeyValueObserver ()

@property (strong, nonatomic) id value;
@property (copy, nonatomic) NSDictionary *change;

// Additional Logic Gate
@property (assign, nonatomic) BOOL isNil;


@end



@implementation IKKeyValueObserver

- (void)awakeFromNib {
    [super awakeFromNib];
    [self commonInit];
    [self startObservingIfNecessary];
}

- (void)dealloc {
    [self stopObserving:nil];
}

- (void)commonInit {
    if (self.options == 0) {
        self.options = NSKeyValueObservingOptionNew;
    }
}

- (void)setTarget:(id)target {
    _target = target;
    [self startObservingIfNecessary];
}

- (void)setKeyPath:(NSString *)keyPath {
    _keyPath = keyPath;
    [self startObservingIfNecessary];
}

#pragma KVO

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    if ([keyPath isEqualToString:self.keyPath]) {
        [self valueDidChange:change];
        self.value = [object valueForKey:self.keyPath];
        self.change = change;
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

#pragma mark Logic flow

- (void)startObservingIfNecessary {
    if (self.target && self.keyPath) {
        [self startObserving:nil];
    }
}

- (IBAction)startObserving:(id)sender {
    [self.target addObserver:self
                  forKeyPath:self.keyPath
                     options:self.options
                     context:nil];
}

- (IBAction)stopObserving:(id)sender {
    [self.target removeObserver:self forKeyPath:self.keyPath];
}

#pragma mark Basic Logic Gate

- (void)valueDidChange:(NSDictionary *)change {
    self.isNil = change[NSKeyValueChangeNewKey] ? NO : YES;
}

- (NSNumber *)number {
    NSNumber *number;
    if ([self.value respondsToSelector:@selector(boolValue)]) {
        number = @([self.value boolValue]);
    }
    return number;
}

@end
