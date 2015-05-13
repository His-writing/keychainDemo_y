//
//  ViewController.m
//  keychainDemo1
//
//  Created by DT on 14-9-9.
//  Copyright (c) 2014年 DT. All rights reserved.
//

#import "ViewController.h"
#import "KeychainItemWrapper.h"

@interface ViewController ()
@property (nonatomic,strong)KeychainItemWrapper *wrapper;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *readButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"keychain demo" accessGroup:@"V3KLKNYYW6.com.qyyl.BJlLH"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(IBAction)saveButton:(id)sender
{
    if (self.textField.text == nil || [self.textField.text isEqualToString:@""]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"文本框不能为空！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }else{
        [self.wrapper setObject:self.textField.text forKey:(__bridge id)kSecAttrAccount];
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"保存成功！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
}

-(IBAction)readButton:(id)sender
{
    //从keychain里取出帐号
    NSString *account = [self.wrapper objectForKey:(__bridge id)kSecAttrAccount];
    NSLog(@"account:%@",account);
    self.label.text = account;
}

@end
