//
//  SmallCell.h
//  PhotosAsset
//
//  Created by 77 on 2017/7/4.
//  Copyright © 2017年 77. All rights reserved.
//
#define imgNormal @"photo_check_default"
#define imgSelect @"photo_check_selected"

#import <UIKit/UIKit.h>

@protocol SmallCellDelegate <NSObject>

@optional

- (void)pushIndex:(NSInteger)index;

- (void)pushCheckBtnIndex:(NSInteger)index StatusString:(NSString *)statusStr;

//相机使用代理
- (void)takePhotosAction;

@end

@interface SmallCell : UICollectionViewCell

//相册小图
@property (nonatomic, retain) UIImageView           *imageView;

//标识相册选中状态的按钮
@property (nonatomic, retain) UIButton              *checkBtn;

//拍照片的按钮
@property (nonatomic, retain) UIButton              *takePhotoBtn;

@property (nonatomic, assign) id<SmallCellDelegate> delegate;

//传递图片资源信息
- (void)makeImageCell:(PHAsset*)asset takePhotos:(NSString *)photoStr;

//判断图片是否被选择
- (void)checkBtnIsSelected:(NSString *)selected;

@end
