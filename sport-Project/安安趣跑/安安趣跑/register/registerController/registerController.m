//
//  registerController.m
//  安安趣跑
//
//  Created by 董凯睿 on 2022/1/8.
//

#import "registerController.h"
#import "homeController.h"
#import "marketPageController.h"
#import "sportPageController.h"
#import "communityPageController.h"
#import "minePageController.h"
@interface registerController ()

@end

@implementation registerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    //加载视图的属性
    _myView = [[registerView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    //加载数据的属性
    _myModel = [[registerModel alloc] init];
    
    //加载视图
    [_myView creatUI];
    
    //将View添加到当前视图
    [self.view addSubview:_myView];
    
    //设定登录按钮的事件
    [_myView.upButton addTarget:self action:@selector(pressButtonUp) forControlEvents:UIControlEventTouchUpInside];
    //设定注册按钮的事件
    [_myView.registerButton addTarget:self action:@selector(pressButtonRegister) forControlEvents:UIControlEventTouchUpInside];
    //设置手机验证码登录的事件
    [_myView.upByPhoneButton addTarget:self action:@selector(pressButtonByPhone) forControlEvents:UIControlEventTouchUpInside];
    
}

//登录按钮的事件函数
- (void) pressButtonUp {
    //创建那五个视图控制器
    homeController *homeControllerTest = [[homeController alloc] init];
    marketPageController *marketControllerTest = [[marketPageController alloc] init];
    sportPageController *sportControllerTest = [[sportPageController alloc] init];
    communityPageController *communityControllerTest = [[communityPageController alloc] init];
    minePageController *mineControllerTest = [[minePageController alloc] init];
    
    //设置五个界面的分栏标题
    homeControllerTest.title = @"首页";
    marketControllerTest.title = @"商城";
    sportControllerTest.title = @"运动";
    communityControllerTest.title = @"社区";
    mineControllerTest.title = @"我的";
    
    //创建芬兰控制器数组对象
    NSArray *arrayTabBarController = [NSArray arrayWithObjects:homeControllerTest, marketControllerTest, sportControllerTest, communityControllerTest, mineControllerTest, nil];
    
    //创建分栏控制器对象
    UITabBarController *tabBarControllerTest = [[UITabBarController alloc] init];
    //将分栏控制器做管理数组赋值
    tabBarControllerTest.viewControllers = arrayTabBarController;
    //设置分栏控制器的背景颜色
    tabBarControllerTest.tabBar.backgroundColor = [UIColor whiteColor];
    //设置分栏控制器的透明度
    tabBarControllerTest.tabBar.translucent = NO;
    //设置选中的视图控制器的索引(先显示第几页)
    tabBarControllerTest.selectedIndex = 0;
    //设置五个分栏控制器按钮
    UIImage *tabBarImage = [UIImage imageNamed:@"shouye-2.png"];
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:tabBarImage tag:101];
    homeControllerTest.tabBarItem = tabBarItem;
    
    UIImage *tabBarImageSecond = [UIImage imageNamed:@"shouchang.png"];
    UITabBarItem *tabBarItemSecond = [[UITabBarItem alloc] initWithTitle:@"首页" image:tabBarImageSecond tag:102];
    marketControllerTest.tabBarItem = tabBarItemSecond;
    
    UIImage *tabBarImageThird = [UIImage imageNamed:@"yundong.png"];
    UITabBarItem *tabBarItemThird = [[UITabBarItem alloc] initWithTitle:@"运动" image:tabBarImageThird tag:103];
    sportControllerTest.tabBarItem = tabBarItemThird;
    
    UIImage *tabBarImageFourth = [UIImage imageNamed:@"shequ.png"];
    UITabBarItem *tabBarItemFourth = [[UITabBarItem alloc] initWithTitle:@"社区" image:tabBarImageFourth tag:104];
    communityControllerTest.tabBarItem = tabBarItemFourth;
    
    UIImage *tabBarImageFifth = [UIImage imageNamed:@"wode.png"];
    UITabBarItem *tabBarItemFifth = [[UITabBarItem alloc] initWithTitle:@"我的" image:tabBarImageFifth tag:105];
    mineControllerTest.tabBarItem = tabBarItemFifth;
    
    
    NSLog(@"登录成功！");
    tabBarControllerTest.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:tabBarControllerTest animated:NO completion:nil];
}

//注册按钮的事件函数
- (void) pressButtonRegister {
    NSLog(@"注册成功！");
}

//手机验证码登录的事件函数
- (void) pressButtonByPhone {
    NSLog(@"已切换到手机验证码登录！");
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
