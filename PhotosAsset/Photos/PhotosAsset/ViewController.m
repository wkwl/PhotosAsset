//
//  ViewController.m
//  PhotosAsset
//
//  Created by 77 on 2017/7/3.
//  Copyright © 2017年 77. All rights reserved.
//

#import "ViewController.h"
#import "PhotosController.h"
@interface ViewController ()<PhotosControllerDelegate>
@property (nonatomic, retain) NSMutableArray *dataArray;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"无";
    [self.view setBackgroundColor:[UIColor redColor]];
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(100, 200, 160, 30);
    [btn setTitle:@"打开相册" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(open) forControlEvents:UIControlEventTouchUpInside];
    _dataArray = [NSMutableArray array];
    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getImages:) name:@"FullImage" object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)open {
    PhotosController *vc = [[PhotosController alloc] init];
    //    vc.title = @"相册";
    vc.delegate          = self;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - PhotosControllerDelegate 方法（通过该数组可获得选中的UIImage 信息数组）
- (void)getImagesArray:(NSArray<UIImage *> *)imagesArray {
    NSLog(@"图片：%ld",imagesArray.count);
}

@end
