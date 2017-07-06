# PhotosAsset
自定义照片选择器基于PHAsset
该实例代码在photos 中，外部存在的photosAsset无使用代码，photos内部存在的photosAsset为关键代码
1.使用相册时 主要调用代码如下（首先添加PhotosControllerDelegate）：  

    PhotosController *vc = [[PhotosController alloc] init];
    
    //    vc.title = @"相册";
    
    vc.delegate          = self;
    
    [self.navigationController pushViewController:vc animated:YES];
    
2.PhotosControllerDelegate代理方法如下：
- (void)getImagesArray:(NSArray<UIImage *> *)imagesArray {                                                                                       
   NSLog(@"图片：%ld",imagesArray.count);
   
}
在这个代理方法里，我们能够获取所选图片的image数组。


