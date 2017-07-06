//
//  WKWAsset.m
//  PhotosAsset
//
//  Created by 77 on 2017/7/4.
//  Copyright © 2017年 77. All rights reserved.
//

#import "WKWAsset.h"

@implementation WKWAsset

//获取原图
- (UIImage *)OriginalImage:(PHAsset *)asset {
    __block UIImage *resultImage;
    
    PHImageRequestOptions *phImageRequestOptions = [[PHImageRequestOptions alloc] init];
    phImageRequestOptions.synchronous = YES;
    [[PHImageManager defaultManager] requestImageForAsset:asset
                                               targetSize:PHImageManagerMaximumSize
                                              contentMode:PHImageContentModeDefault
                                                  options:phImageRequestOptions
                                            resultHandler:^(UIImage *result, NSDictionary *info) {
                                                
                                                resultImage = result;
                                                NSLog(@"%@",result);
                                            }];
    
    return resultImage;
    
}


- (UIImage *)smallImageSize:(CGSize)size asset:(PHAsset *)asset {
    __block UIImage *resultImage;
    PHImageRequestOptions *imageRequestOptions = [[PHImageRequestOptions alloc] init];
    imageRequestOptions.resizeMode = PHImageRequestOptionsResizeModeExact;
    imageRequestOptions.synchronous = YES;
    
    CGSize imageSize = CGSizeMake(size.width* screenScale,size.height*screenScale);
    [[PHImageManager defaultManager] requestImageForAsset:asset targetSize:imageSize contentMode:PHImageContentModeAspectFill options:imageRequestOptions resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        resultImage  = result;
    }];
    return resultImage;
}

@end
