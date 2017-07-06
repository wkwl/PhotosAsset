//
//  FullCell.m
//  PhotosAsset
//
//  Created by 77 on 2017/7/4.
//  Copyright © 2017年 77. All rights reserved.
//

#import "FullCell.h"

#pragma mark - UIImageView 继承类的方法
@implementation myImageView

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, size.height);
}

@end


@implementation FullCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self createImageViewOrScroll];
        self.FullImageView.backgroundColor = [UIColor redColor];
    }
    return self;
    
}

- (void)createImageViewOrScroll {
    
    _myScroll = [[UIScrollView alloc] init];
    _myScroll.minimumZoomScale = 0.5;
    _myScroll.maximumZoomScale = 2.0;
    _myScroll.delegate         = self;
    _myScroll.frame            = self.bounds;
    _myScroll.backgroundColor  = [UIColor blackColor];
    _myScroll.showsVerticalScrollIndicator = NO;
    [self addSubview:self.myScroll];
    _FullImageView = [[myImageView alloc] init];
    [self.myScroll addSubview:_FullImageView];
    
//    _FullImageView.frame = self.bounds;
    
}

//获取图片信息（通过属性传过来的asset 获取）
- (void)makeUI:(PHAsset *)Asset {
    WKWAsset *wkwasset = [[WKWAsset alloc] init];
    UIImage *image =  [wkwasset smallImageSize:self.bounds.size asset:Asset];
    [self.FullImageView setImage:image];
    _imgsize = image.size;
    
}

- (void)layoutSubviews {
      [self updateImagesize:_imgsize];
}
//更新ImageView的frame
- (void)updateImagesize:(CGSize)imgsize {
    CGFloat w,h;
    if (imgsize.width > imgsize.height) {
        w = SCREEN_W;
        h = imgsize.height * SCREEN_W/imgsize.width;
        self.FullImageView.size = CGSizeMake(w, h);
        
    }else {
        h = SCREEN_H;
        w = imgsize.width *SCREEN_H/imgsize.height;
        self.FullImageView.size = CGSizeMake(w, h);
    }
    self.FullImageView.center = CGPointMake(SCREEN_W/2.0, SCREEN_H/2.0);
//    self.FullImageView.frame = CGRectMake(0, SCREEN_H/4.0, w, h);
}
#pragma mark - ScrollView 代理
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    NSLog(@"kk%f",self.FullImageView.size.height);
    self.FullImageView.center = CGPointMake(SCREEN_W/2.0, SCREEN_H/2.0);
    return self.FullImageView;
}


@end
