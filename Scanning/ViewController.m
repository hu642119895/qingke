//
//  ViewController.m
//  Scanning
//
//  Created by qk365_macmini_1 on 2017/9/1.
//  Copyright © 2017年 yuiiooi. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "ScanningViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * Sbuttton = [UIButton buttonWithType:UIButtonTypeCustom];
    Sbuttton.frame = CGRectMake(100, 200, 100, 50);
    [Sbuttton setTitle:@"打开闪光灯" forState:UIControlStateNormal];
    [Sbuttton addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    [Sbuttton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    Sbuttton.tag = 201;
    [self.view addSubview:Sbuttton];
    
    UIButton * Gbuttton = [UIButton buttonWithType:UIButtonTypeCustom];
    Gbuttton.frame = CGRectMake(100, 300, 100, 50);
    [Gbuttton setTitle:@"关闭闪光灯" forState:UIControlStateNormal];
    [Gbuttton addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    [Gbuttton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    Gbuttton.tag = 202;
    [self.view addSubview:Gbuttton];
    
    UIButton * Zbuttton = [UIButton buttonWithType:UIButtonTypeCustom];
    Zbuttton.frame = CGRectMake(100, 400, 100, 50);
    [Zbuttton setTitle:@"二维码扫描" forState:UIControlStateNormal];
    [Zbuttton addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    [Zbuttton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    Zbuttton.tag = 203;
    [self.view addSubview:Zbuttton];
}
-(void)push:(UIButton*)sender
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    [device lockForConfiguration:nil];
    if (sender.tag ==200) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else if (sender.tag ==201)
    {
        device.torchMode = AVCaptureTorchModeOn;
        device.flashMode = AVCaptureFlashModeOn;
        [device unlockForConfiguration];
    }
    else if (sender.tag ==202)
    {
        device.torchMode = AVCaptureTorchModeOff;
        device.flashMode = AVCaptureFlashModeOff;
        [device unlockForConfiguration];
    }
    else{
        ScanningViewController *twoVC=[[ScanningViewController alloc]init];
        [self.navigationController pushViewController:twoVC animated:YES];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
