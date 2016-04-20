//
//  UIImageUtil.h
//  Cycling
//
//  Created by 房立镇 on 15/11/4.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface UIImageUtil : NSObject
//修改图片大小和控件一致
+ (UIImage *)scaleImageToSize:(UIImage *)img size:(CGSize)size;
+ (UIImage *)scaleImageToSize:(UIImage *)img scale:(CGFloat)scale;

+(UIImage *)cutViewWithView:(UIView *)cutView;
//等比缩放图片裁剪指定区域图片
+(UIImage *)compressImageWith:(UIImage *)image scaleToSize:(CGSize)size;

@end
