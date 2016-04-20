//
//  UIImageUtil.m
//  Cycling
//
//  Created by 房立镇 on 15/11/4.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "UIImageUtil.h"

@implementation UIImageUtil
//修改图片大小和控件一致
+(UIImage *)scaleImageToSize:(UIImage *)img size:(CGSize)size {     // 创建一个bitmap的context        // 并把它设置成为当前正在使用的context        //Determine whether the screen is retina        if([[UIScreen mainScreen] scale] == 2.0){                   }else{                UIGraphicsBeginImageContext(size);        }        // 绘制改变大小的图片
    UIGraphicsBeginImageContextWithOptions(size, NO, 2.0);
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];        // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();        // 使当前的context出堆栈
    UIGraphicsEndImageContext();        // 返回新的改变大小后的图片
    return scaledImage;
}
+ (UIImage *)scaleImageToSize:(UIImage *)img scale:(CGFloat)scale{
   //bitmap的context        // 并把它设置成为当前正在使用的context        //Determine whether the screen is retina        if([[UIScreen mainScreen] scale] == 2.0){                   }else{                UIGraphicsBeginImageContext(size);        }        // 绘制改变大小的图片
    CGSize size=img.size;
    UIGraphicsBeginImageContextWithOptions(size, NO, 2.0);
    [img drawInRect:CGRectMake(0, 0, size.width*scale, size.height*scale)];        // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();        // 使当前的context出堆栈
    UIGraphicsEndImageContext();        // 返回新的改变大小后的图片
    return scaledImage;
}
/**
 *  @author 王振
 *
 *  裁剪一定区域的图片
 *
 *  @param cutView 指定的图片
 *
 *  @return 裁剪后的图片
 */    
+(UIImage *)cutViewWithView:(UIView *)cutView{
    
    //    UIWindow *screenWindow = [[UIApplication sharedApplication] keyWindow];
    
//    UIGraphicsBeginImageContext(cutView.frame.size);//全屏截图，包括window
    UIGraphicsBeginImageContextWithOptions(cutView.frame.size, NO, [UIScreen mainScreen].scale);

    
    [cutView.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
//        UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
    
    return viewImage;
    
}


/**
 *  等比缩放图片裁剪指定区域图片
 *
 *  @param image 原图
 *  @param size  裁剪范围
 *
 *  @return 裁剪后的图片
 */
+(UIImage *)compressImageWith:(UIImage *)image scaleToSize:(CGSize)size
{
    // 原图宽
    CGFloat imageWidth = image.size.width;
    // 原图高
    CGFloat imageHeight = image.size.height;
    
    // 缩放比例
    CGFloat widthScale = imageWidth /size.width;
    CGFloat heightScale = imageHeight /size.height;
    
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(CGSizeMake(size.width, size.height));
    
    // 横屏图片
    if (widthScale > heightScale) {
        [image drawInRect:CGRectMake(0, 0, imageWidth /heightScale , size.height)];
    }
    else { // 竖屏图片
        [image drawInRect:CGRectMake(0, 0, size.width , imageHeight /widthScale)];
    }
    
    // 从当前context中创建一个改变大小后的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    return newImage;
}
@end
