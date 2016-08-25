//
//  tcscan.m
//  tcscan
//
//  Created by 孝辰 吴 on 16/7/26.
//  Copyright © 2016年 wuxiaochen. All rights reserved.
//

#import "tcscan.h"

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
    //  [self.navigationController pushViewController:svc animated:NO];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *rootController = UIApplication.sharedApplication.delegate.window.rootViewController;
        //    [rootController.navigationController pushViewController:rnScan animated:YES];
        [rootController presentViewController:rnScan animated:YES completion:nil];
    });
    
}

@end
