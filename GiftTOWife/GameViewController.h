//
//  GameViewController.h
//  Project-拼图
//
//  Created by qianfeng on 15/11/11.
//  Copyright (c) 2015年 mxl. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIImage+ZLPhotoLib.h"

#import "ZLPhoto.h"

#import "UIImageUtil.h"

#import "UIButton+WebCache.h"
@interface GameViewController : UIViewController<ZLPhotoPickerBrowserViewControllerDataSource,ZLPhotoPickerBrowserViewControllerDelegate>

@property (nonatomic , strong) NSMutableArray *assets;

@property (weak,nonatomic) UIScrollView *scrollView;




@end
