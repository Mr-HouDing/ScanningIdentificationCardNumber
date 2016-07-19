//
//  ViewController.m
//  ScanningIdentificationCardNumber
//
//  Created by 侯仁杰 on 16/7/19.
//  Copyright © 2016年 侯仁杰. All rights reserved.
//

#import "ViewController.h"

#import "CardIO.h"
#import "CardIOPaymentViewControllerDelegate.h"

@interface ViewController (){
    UILabel *label;
    UIButton *button;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self viewLayout];
    [CardIOUtilities preload];
}

- (void)viewLayout{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    label = [[UILabel alloc] init];
    label.frame = CGRectMake(20, 100, self.view.frame.size.width - 40, 30);
    label.backgroundColor = [UIColor cyanColor];
    label.text = @"卡号";
    [self.view addSubview:label];
    
    button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.frame = CGRectMake(30, self.view.frame.size.height - 80, self.view.frame.size.width - 60, 30);
    button.backgroundColor = [UIColor blueColor];
    button.titleLabel.textColor = [UIColor blackColor];
    [button setTitle:@"开始扫描" forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(scanning:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    
}

#pragma mark 扫描按钮点击方法
- (void)scanning:(UIButton *)sender{
    CardIOPaymentViewController *scanViewController = [[CardIOPaymentViewController alloc] initWithPaymentDelegate:self];
    [self presentViewController:scanViewController animated:YES completion:nil];
}

//取消扫描
- (void)userDidCancelPaymentViewController:(CardIOPaymentViewController *)paymentViewController {
    [paymentViewController dismissViewControllerAnimated:YES completion:nil];
}
//扫描完成
- (void)userDidProvideCreditCardInfo:(CardIOCreditCardInfo *)cardInfo inPaymentViewController:(CardIOPaymentViewController *)paymentViewController {
    //扫描结果
    NSLog(@"Received card info. Number: %@, expiry: %02lu/%lu, cvv: %@.", cardInfo.redactedCardNumber, (unsigned long)cardInfo.expiryMonth, (unsigned long)cardInfo.expiryYear, cardInfo.cvv);
    NSString *no = cardInfo.cardNumber;
    NSLog(@"%@", no);
    label.text = no;
    [paymentViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
