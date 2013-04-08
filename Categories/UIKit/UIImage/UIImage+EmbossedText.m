//
//  UIImage+EmbossedText.m
//  
//
//  Created by Steven on 21/7/12.
//
//

#import "UIImage+EmbossedText.h"

@implementation UIImage (EmbossedText)

- (UIImage *)maskWithString:(NSString *)string font:(UIFont *)font size:(CGSize)size
{
    CGRect rect = { CGPointZero, size };
    CGFloat scale = [UIScreen mainScreen].scale;
    CGColorSpaceRef grayscale = CGColorSpaceCreateDeviceGray();
    CGContextRef gc = CGBitmapContextCreate(NULL, size.width * scale, size.height * scale, 8, size.width * scale, grayscale, kCGImageAlphaOnly);
    CGContextScaleCTM(gc, scale, scale);
    CGColorSpaceRelease(grayscale);
    UIGraphicsPushContext(gc); {
        [[UIColor whiteColor] setFill];
        [string drawInRect:rect withFont:font];
    } UIGraphicsPopContext();
    
    CGImageRef cgImage = CGBitmapContextCreateImage(gc);
    CGContextRelease(gc);
    UIImage *image = [UIImage imageWithCGImage:cgImage scale:scale orientation:UIImageOrientationDownMirrored];
    CGImageRelease(cgImage);
    
    return image;
}

- (UIImage *)invertedMaskWithMask:(UIImage *)mask
{
    CGRect rect = { CGPointZero, mask.size };
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, mask.scale); {
        [[UIColor blackColor] setFill];
        UIRectFill(rect);
        CGContextClipToMask(UIGraphicsGetCurrentContext(), rect, mask.CGImage);
        CGContextClearRect(UIGraphicsGetCurrentContext(), rect);
    }
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

-(UIImage *)imageWithInteriorShadowAndString:(NSString *)string font:(UIFont *)font textColor:(UIColor *)textColor size:(CGSize)size
{
    CGRect rect = { CGPointZero, size };
    UIImage *mask = [self maskWithString:string font:font size:rect.size];
    UIImage *invertedMask = [self invertedMaskWithMask:mask];
    UIImage *image;
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale); {
        CGContextRef gc = UIGraphicsGetCurrentContext();
        // Clip to the mask that only allows drawing inside the string's image.
        CGContextClipToMask(gc, rect, mask.CGImage);
        // We apply the mask twice because we're going to draw through it twice.
        // Only applying it once would make the edges too sharp.
        CGContextClipToMask(gc, rect, mask.CGImage);
        mask = nil; // done with mask; let ARC free it
        
        // Draw the red text.
        [textColor setFill];
        CGContextFillRect(gc, rect);
        
        // Draw the interior shadow.
        CGContextSetShadowWithColor(gc, CGSizeZero, 1.6, [UIColor colorWithWhite:.3 alpha:1].CGColor);
        [invertedMask drawAtPoint:CGPointZero];
        invertedMask = nil; // done with invertedMask; let ARC free it
        
        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)imageWithUpwardShadowAndImage:(UIImage *)image
{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale); {
        CGContextSetShadowWithColor(UIGraphicsGetCurrentContext(), CGSizeMake(0, -1), 1, [UIColor colorWithWhite:0 alpha:.15].CGColor);
        [image drawAtPoint:CGPointZero];
    }
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}

- (UIImage *)embossedTextImageWithString: (NSString *)string
                                    font: (UIFont *)font
                               textColor: (UIColor *)color
                                    size: (CGSize)size {
    UIImage *interiorShadowImage = [self imageWithInteriorShadowAndString:string
                                                                     font:font
                                                                textColor:color
                                                                     size:size];
    UIImage *finalImage = [self imageWithUpwardShadowAndImage:interiorShadowImage];

}

@end
