//
//  AssetsHelper.m
//  PhotosAsset
//
//  Created by 77 on 2017/7/4.
//  Copyright © 2017年 77. All rights reserved.
//

#import "AssetsHelper.h"
#import <Photos/Photos.h>
@implementation AssetsHelper

- (NSArray *)getImageAssetSArray {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    PHFetchResult *fetchResult = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:options];
    if ([fetchResult countOfAssetsWithMediaType:PHAssetMediaTypeImage] > 0) {
        [fetchResult enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            PHAsset *asset = (PHAsset *)obj;
            [array addObject:asset];
        }];
    }
    return array;
}
@end
