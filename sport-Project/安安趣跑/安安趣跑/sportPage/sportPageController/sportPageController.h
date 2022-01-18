//
//  sportPageController.h
//  安安趣跑
//
//  Created by 董凯睿 on 2022/1/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//向前声明
@class sportPageView;
@class sportPageModel;
@interface sportPageController : UIViewController

@property (nonatomic, strong) sportPageView *myView;
@property (nonatomic, strong) sportPageModel *myModel;

@end

NS_ASSUME_NONNULL_END
