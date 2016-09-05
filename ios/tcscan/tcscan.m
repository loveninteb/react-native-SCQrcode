//
//  tcscan.m
//  tcscan
//
//  Created by 孝辰 吴 on 16/7/26.
//  Copyright © 2016年 wuxiaochen. All rights reserved.
//

#import "tcscan.h"
#import <AVFoundation/AVFoundation.h>

@implementation tcscan

RCT_EXPORT_MODULE();


/**
 *  @author wuxiaochen, 2016-07-25 16:07:28
 *
 *  扫二维码
 */
RCT_EXPORT_METHOD(scan:(RCTResponseSenderBlock)callback){
    
    
    rnScan = [[ScanVC alloc]init];
    
    rnScan.qrUrlBlock = ^(NSString *url){
        callback(@[url]);
    };
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        
        [self scanQrCode];
        
        
        
    });
    
}


- (void)scanQrCode{
    
    //判断是否有访问相机的权限
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    
    if(authStatus == AVAuthorizationStatusDenied){
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"该应用没有相机的使用权限，请打开设置并找到您的应用，开启相机权限" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        
        return;
    }
    
    if (![self validateCamera]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"没有摄像头或摄像头不可用" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        
    }else{
        UIViewController *rootController = UIApplication.sharedApplication.delegate.window.rootViewController;
        [rootController presentViewController:rnScan animated:YES completion:nil];
    }
}


//检测摄像头是否可用
- (BOOL)validateCamera {
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] &&
    [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}


@end
