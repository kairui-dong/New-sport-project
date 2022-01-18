//
//  ViewController.m
//  安安趣跑
//
//  Created by 董凯睿 on 2022/1/8.
//

#import "ViewController.h"
#import "registerController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

//视图的生命周期函数（必须等待当前视图加载出来之后才能成功实现界面跳转）
- (void) viewDidAppear:(BOOL)animated {
    //从当前界面跳转到登录注册界面
    [self presentToOtherPage];
}

//界面跳转函数(跳转至登录注册界面)
- (void) presentToOtherPage {
    registerController *registerTest = [[registerController alloc] init];
    registerTest.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:registerTest animated:YES completion:nil];
}


@end
