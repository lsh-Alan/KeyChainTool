//
//  ViewController.m
//  KeyChainDemo
//
//  Created by Alan on 2019/2/22.
//  Copyright © 2019 Alan. All rights reserved.
//

#import "ViewController.h"
#import "KeyChainTool.h"

static NSString  * const service = @"TestService";
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *account = @"account";
    NSString *password = @"123456";
    
    [KeyChainTool saveWithService:service Account:account Password:password];
    NSString *getPassword = [KeyChainTool queryWithService:service Account:account];
    if ([password isEqualToString:getPassword]) {
        NSLog(@"保存成功");
    }else{
        NSLog(@"保存失败");
    }
    
    [KeyChainTool updateWithService:service Account:account Password:@"2222222"];
    getPassword = [KeyChainTool queryWithService:service Account:account];
    if ([getPassword isEqualToString:@"2222222"]) {
        NSLog(@"更改成功");
    }else{
        NSLog(@"更改失败");
    }
    
    
    [KeyChainTool deleteWithService:service Account:account];
    getPassword = [KeyChainTool queryWithService:service Account:account];
    if (!getPassword) {
        NSLog(@"删除成功");
    }else{
        NSLog(@"删除失败");
    }
}

@end
