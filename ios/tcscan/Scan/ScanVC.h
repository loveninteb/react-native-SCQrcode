//
//  ScanVC.h
//  SceneryCheck
//
//  Created by 孝辰 吴 on 15/9/21.
//  Copyright © 2015年 同程网. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^QRUrlBlock)(NSString *url);

@interface ScanVC : UIViewController

@property (nonatomic, copy) QRUrlBlock qrUrlBlock;


@end
