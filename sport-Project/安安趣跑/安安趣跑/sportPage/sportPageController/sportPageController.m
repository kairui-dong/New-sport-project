//
//  sportPageController.m
//  安安趣跑
//
//  Created by 董凯睿 on 2022/1/17.
//

#import "sportPageController.h"
#import "sportPageView.h"
#import "sportPageModel.h"
@interface sportPageController ()

@end

@implementation sportPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _myView = [[sportPageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _myModel = [[sportPageModel alloc] init];
    //初步加载UI
    [_myView creatUI];
    //添加视图
    [self.view addSubview:_myView];
    //为开始跑步按钮添加事件函数
    [_myView.startButton addTarget:self action:@selector(pressButtonStartSport) forControlEvents:UIControlEventTouchUpInside];
    //跑前提醒按钮添加事件函数
    [_myView.tipsButton addTarget:self action:@selector(pressButtonTip) forControlEvents:UIControlEventTouchUpInside];
    //目标设定按钮的事件函数(已迁移至视图页面)
    //[_myView.setTargetButton addTarget:self action:@selector(pressButtonTarget) forControlEvents:UIControlEventTouchUpInside];
    
}

//开始跑步按钮的事件函数
- (void) pressButtonStartSport {
    //调用创建跑步地图的函数
    [_myView creatMap];
}

//跑前提醒按钮的事件函数
- (void) pressButtonTip {
    NSString *stringTip = @"跑前40分钟，少量进食并饮250ml水为最佳，先进行热身动作再开跑为最佳，建议身着运动装并穿着运动鞋，调整呼吸节奏 最佳为“三步一吸，三步一呼”，尽量选择平坦的场地";
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"跑前提醒" message:stringTip preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"知道啦" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"用户收到了提醒");
    }];
    [alertController addAction:sure];
    [self presentViewController:alertController animated:YES completion:nil];
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
