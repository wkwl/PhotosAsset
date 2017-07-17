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
    //获取资源时的参数，可以传 nil，即使用系统默认值
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    //获取资源   fetchAssetsWithMediaType：所获取的资源类型 PHAssetMediaTypeImage（获取所有图片资源）
    PHFetchResult *fetchResult = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:options];
    if ([fetchResult countOfAssetsWithMediaType:PHAssetMediaTypeImage] > 0) {
        //遍历所有资源  并将资源每个图片资源信息存入数组
        [fetchResult enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            PHAsset *asset = (PHAsset *)obj;
            [array addObject:asset];
        }];
    }
    return array;
}
@end
