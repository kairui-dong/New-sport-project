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
    
    
}

//开始跑步按钮的事件函数
- (void) pressButtonStartSport {
    //调用创建跑步地图的函数
    [_myView creatMap];
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
