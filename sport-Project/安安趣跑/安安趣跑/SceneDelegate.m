//
//  SceneDelegate.m
//  安安趣跑
//
//  Created by 董凯睿 on 2022/1/8.
//

#import "SceneDelegate.h"

/*
#import "homeController.h"
#import "marketPageController.h"
#import "sportPageController.h"
#import "communityPageController.h"
#import "minePageController.h"
 */
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
//    //创建一个根视图控制器
//    self.window.rootViewController = [[UIViewController alloc] init];
//    //设置背景色
//    self.window.backgroundColor = [UIColor whiteColor];
//    //显示window
//    [self.window makeKeyAndVisible];
    
//    //创建那五个视图控制器
//    homeController *homeControllerTest = [[homeController alloc] init];
//    marketPageController *marketControllerTest = [[marketPageController alloc] init];
//    sportPageController *sportControllerTest = [[sportPageController alloc] init];
//    communityPageController *communityControllerTest = [[communityPageController alloc] init];
//    minePageController *mineControllerTest = [[minePageController alloc] init];
//    //创建ViewController的控制器属性
//    ViewController *viewControllerTest = [[ViewController alloc] init];
//    //设置五个界面的分栏标题
//    homeControllerTest.title = @"首页";
//    marketControllerTest.title = @"商城";
//    sportControllerTest.title = @"运动";
//    communityControllerTest.title = @"社区";
//    mineControllerTest.title = @"我的";
//
//    //创建芬兰控制器数组对象
//    NSArray *arrayTabBarController = [NSArray arrayWithObjects:homeControllerTest, marketControllerTest, sportControllerTest, communityControllerTest, mineControllerTest, nil];
//
//    //创建分栏控制器对象
//    UITabBarController *tabBarControllerTest = [[UITabBarController alloc] init];
//    //将分栏控制器做管理数组赋值
//    tabBarControllerTest.viewControllers = arrayTabBarController;
//    //设置根视图
//    self.window.rootViewController = viewControllerTest;
//    //设置分栏控制器的透明度
//    tabBarControllerTest.tabBar.translucent = NO;
//    //设置选中的视图控制器的索引(先显示第几页)
//    tabBarControllerTest.selectedIndex = 0;
    
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
