//
//  Original.m
//  PhotosAsset
//
//  Created by 77 on 2017/7/4.
//  Copyright © 2017年 77. All rights reserved.
//

#import "UIImage+Original.h"

@implementation UIImage (Original)
- (UIImage *)original {
    return [self imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
