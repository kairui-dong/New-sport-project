//
//  registerController.h
//  安安趣跑
//
//  Created by 董凯睿 on 2022/1/8.
//

#import <UIKit/UIKit.h>
#import "registerView.h"
#import "registerModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface registerController : UIViewController

@property (nonatomic, strong) registerModel *myModel;
@property (nonatomic, strong) registerView *myView;


@end

NS_ASSUME_NONNULL_END
