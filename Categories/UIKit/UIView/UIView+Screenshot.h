#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef void(^ZSViewScreenshotCompletionBlock)(UIImage *image);


@interface UIView (Screenshot)

- (UIImage *)screenshot;

- (void)asyncScreenshotWithCompletionBlock: (ZSViewScreenshotCompletionBlock)block;

@end
