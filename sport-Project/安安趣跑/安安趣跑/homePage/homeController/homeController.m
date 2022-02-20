//
//  homeController.m
//  安安趣跑
//
//  Created by 董凯睿 on 2022/1/17.
//

#import "homeController.h"
#import "homePageModel.h"
#import "homePageView.h"

@interface homeController ()
@property (nonatomic, strong) homePageModel *myModel;
@property (nonatomic, strong) homePageView *myView;


@end

@implementation homeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _myView = [[homePageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _myModel = [[homePageModel alloc] init];
    
    [_myView creatUI];
    [self.view addSubview:_myView];
    
    
    
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
