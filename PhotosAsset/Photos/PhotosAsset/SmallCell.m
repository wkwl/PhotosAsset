//
//  SmallCell.m
//  PhotosAsset
//
//  Created by 77 on 2017/7/4.
//  Copyright © 2017年 77. All rights reserved.
//

#import "SmallCell.h"

@implementation SmallCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createImageview];
        [self crateCheckBtn];
//        self.imageView.backgroundColor = [UIColor redColor];
        _takePhotoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _takePhotoBtn.frame = self.bounds;
        [self addSubview:_takePhotoBtn];
    }
    return self;
}

//创建ImageView
- (void)createImageview {
    _imageView = [[UIImageView alloc] init];
    _imageView.userInteractionEnabled = YES;
    [_imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage)]];
    self.imageView.frame = self.bounds;
    [self addSubview:self.imageView];
}

- (void)tapImage {
    [self.delegate pushIndex:self.imageView.tag];
}

//创建标识图片是否选中的按钮
- (void)crateCheckBtn {
    _checkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _checkBtn.frame = CGRectMake(self.bounds.size.width-20, 0, 20, 20);
    [self.imageView addSubview:self.checkBtn];
    [_checkBtn setImage:[UIImage imageNamed:imgNormal] forState:UIControlStateNormal];
    [_checkBtn addTarget:self action:@selector(checkBtnSelect:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)checkBtnSelect:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        [_checkBtn setImage:[UIImage imageNamed:imgSelect] forState:UIControlStateNormal];
    }else {
        [_checkBtn setImage:[UIImage imageNamed:imgNormal] forState:UIControlStateNormal];
    }
    [self.delegate pushCheckBtnIndex:sender.tag-100 StatusString:[NSString stringWithFormat:@"%d",sender.selected]];
}

- (void)checkBtnIsSelected:(NSString *)selected {
    if ([selected isEqualToString:@"1"]) {
        _checkBtn.selected = YES;
        [_checkBtn setImage:[UIImage imageNamed:imgSelect] forState:UIControlStateNormal];
    }else {
        _checkBtn.selected = NO;
        [_checkBtn setImage:[UIImage imageNamed:imgNormal] forState:UIControlStateNormal];
    }
}

//设置cell里的图片
- (void)makeImageCell:(PHAsset*)asset takePhotos:(NSString *)photoStr {
    if (!photoStr) {
        WKWAsset *wkwasset = [[WKWAsset alloc] init];
        UIImage *image =  [wkwasset smallImageSize:self.bounds.size asset:asset];
        [self.imageView setImage:image];
        _takePhotoBtn.hidden = YES;
        _imageView.hidden    = NO;
        _checkBtn.hidden     = NO;
    }else {
        _takePhotoBtn.hidden = NO;
        _imageView.hidden    = YES;
        _checkBtn.hidden     = YES;
        _takePhotoBtn.layer.borderWidth = 1;
        _takePhotoBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [self.takePhotoBtn setImage:[UIImage imageNamed:photoStr] forState:UIControlStateNormal];
        [self.takePhotoBtn addTarget:self action:@selector(takePhoto) forControlEvents:UIControlEventTouchUpInside];
    }
}
//拍照
- (void)takePhoto {
    [self.delegate takePhotosAction];
}

@end
