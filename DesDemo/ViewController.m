//
//  ViewController.m
//  DesDemo
//
//  Created by 罗川 on 2017/6/14.
//  Copyright © 2017年 罗川. All rights reserved.
//

#import "ViewController.h"
#import "LCdes.h"
@interface ViewController ()

@end

@implementation ViewController
#define STRING_ENCRYPT_KEY 0xDE
- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIButton * btn = [UIButton buttonWithType:0];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
}
#pragma mark 字符加密
+(NSString*)getStr {

    //采用这样的方式,这些字符不会进入字符常量区.编译器直接换算成异或结果
    unsigned char key[]={
        (STRING_ENCRYPT_KEY ^ 'r'),
        (STRING_ENCRYPT_KEY ^ '2'),
        (STRING_ENCRYPT_KEY ^ '4'),
        (STRING_ENCRYPT_KEY ^ '3'),
        (STRING_ENCRYPT_KEY ^ '4'),
        (STRING_ENCRYPT_KEY ^ '3'),
        (STRING_ENCRYPT_KEY ^ '4'),
        (STRING_ENCRYPT_KEY ^ '3'),
        (STRING_ENCRYPT_KEY ^ '4'),
        (STRING_ENCRYPT_KEY ^ '3'),
        (STRING_ENCRYPT_KEY ^ '\0')
    };
    unsigned char * p = key;
    while (((*p) ^= STRING_ENCRYPT_KEY) != '\0') p++;
    return [NSString stringWithUTF8String:(const char *)key];
}
-(void)btnClick{

       
       NSString *encryptionString=[LCdes lcEncryUseDES:[ViewController getStr]];
       NSLog(@"加密后的的字符串:%@",encryptionString);
       
//       NSString *decryptionString=[LCdes lcDecryUseDES:encryptionString];
//       NSLog(@"解密后的字符串:%@",decryptionString);
}

@end
