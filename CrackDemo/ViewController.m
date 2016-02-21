//
//  ViewController.m
//  CrackDemo
//
//  Created by 李赛 on 16/2/2.
//  Copyright © 2016年 李赛. All rights reserved.
//

#import "ViewController.h"
#import "RSAEncryptor.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RSAEncryptor *rsa = [[RSAEncryptor alloc] init];
    NSString *publicKeyPath = [[NSBundle mainBundle] pathForResource:@"rsacert" ofType:@"der"];
    [rsa loadPublicKeyFromFile:publicKeyPath];
    
    NSString *securityText = @"hello ~";
    NSString *encryptedString = [rsa rsaEncryptString:securityText];
    NSLog(@"encrypted data: %@", encryptedString);
    
    //解密
   // NSLog(@"decryptor using rsa");
    [rsa loadPrivateKeyFromFile:[[NSBundle mainBundle] pathForResource:@"p" ofType:@"p12"] password:@"131623"];
    NSString *decryptedString = [rsa rsaDecryptString:encryptedString];
    NSLog(@"decrypted data: %@", decryptedString);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
