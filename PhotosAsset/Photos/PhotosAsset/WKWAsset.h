//
//  WKWAsset.h
//  PhotosAsset
//
//  Created by 77 on 2017/7/4.
//  Copyright © 2017年 77. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

@interface WKWAsset : NSObject

- (UIImage *)OriginalImage:(PHAsset *)asset;

- (UIImage *)smallImageSize:(CGSize)size asset:(PHAsset *)asset;

@end
