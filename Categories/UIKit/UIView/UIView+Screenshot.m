#import "UIView+Screenshot.h"

@implementation UIView (Screenshot)

- (UIImage *)screenshot
{
//    CGFloat scale = [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0.0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
//    DLog(@"size; %@", NSStringFromCGSize(img.size));
    
//    img.scale = self.window.screen.scale;

//    NSData *data = UIImagePNGRepresentation(img);
//    [data writeToFile:@"/Users/steve/Downloads/Shot.png" atomically:YES];
    
	return img;
}


- (void)asyncScreenshotWithCompletionBlock: (ZSViewScreenshotCompletionBlock)block {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        UIImage *image = [self screenshot];
        dispatch_async(dispatch_get_main_queue(), ^{
            block(image);
        });
    });
}

@end
