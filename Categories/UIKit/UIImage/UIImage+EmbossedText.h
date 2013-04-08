//
//  UIImage+EmbossedText.h
//  
//
//  Created by Steven on 21/7/12.
//
//
//  To make a text image like Reminders app:
//CGRect rect = self.imageView.bounds;
//NSString *string = @"Reminders";
//UIFont *font = [UIFont systemFontOfSize:33];
//UIImage *interiorShadowImage = [self imageWithInteriorShadowAndString:string
//                                                                 font:font
//                                                            textColor:[UIColor colorWithHue:0 saturation:.9 brightness:.7 alpha:1]
//                                                                 size:rect.size];
//UIImage *finalImage = [self imageWithUpwardShadowAndImage:interiorShadowImage];


@interface UIImage (EmbossedText)

- (UIImage *)embossedTextImageWithString: (NSString *)string
                                    font: (UIFont *)font
                               textColor: (UIColor *)color
                                    size: (CGSize)size;

@end
