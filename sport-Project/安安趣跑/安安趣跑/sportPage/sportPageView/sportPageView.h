//
//  sportPageView.h
//  安安趣跑
//
//  Created by 董凯睿 on 2022/1/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class MAMapView;
@class MAUserLocationRepresentation;
@class AMapSearchAPI;
@interface sportPageView : UIView

//运动界面的初始背景
@property (nonatomic, strong) UIImageView *backgroundImageView;
//显示里程的label(Title用来显示标题，Content用来显示具体运动里程)
@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) UILabel *labelContent;
//开始运动按钮
@property (nonatomic, strong) UIButton *startButton;
//提示用户跑步注意事项的按钮
@property (nonatomic, strong) UIButton *tipsButton;
//设置跑步目标的按钮
@property (nonatomic, strong) UIButton *setTargetButton;
//设置目标选择内容视图的UIView
@property (nonatomic, strong) UIView *selectView;
//设置内容选择界面的UIPickerView
@property (nonatomic, strong) UIPickerView *targetPickerView;


//地图中的属性
@property (nonatomic, strong) UIButton *buttonBack;

//地图的属性
@property (nonatomic, strong) MAMapView *mapView;
//显示运动里程时间等信息的视图
@property (nonatomic, strong) UIView *underView;
//显示配速的label
@property (nonatomic, strong) UILabel *labelSpeed;
//显示时间的label
@property (nonatomic, strong) UILabel *labelTime;
//显示距离的label
@property (nonatomic, strong) UILabel *labelKm;
//显示时间内容的label
@property (nonatomic, strong) UILabel *labelTimeContent;
//显示距离内容的label
@property (nonatomic, strong) UILabel *labelKmContent;
//显示配速内容的label
@property (nonatomic, strong) UILabel *labelSpeedContent;

@property (nonatomic, strong) MAUserLocationRepresentation *r;
 
//下方为自己编写的绘制轨迹图的相关属性
//包含近两次用户当前纬度位置的数组
@property (nonatomic, strong) NSMutableArray *contentArray;
//包含近两次用户当前经度位置的数组
@property (nonatomic, strong) NSMutableArray *contentArraySecond;
//刷新绘制路线的计时器
@property (nonatomic, retain) NSTimer *timerTest;
@property (nonatomic, assign) NSInteger flag;
//记录跑步米数
@property (nonatomic, assign) NSInteger distanceTest;
//记录运动秒数
@property (nonatomic, assign) NSInteger timeLongTest;
//搜索的属性
@property (nonatomic, strong) AMapSearchAPI *search;

//UI加载函数
- (void) creatUI;
//加载地图跑步功能函数
- (void) creatMap;
@end

NS_ASSUME_NONNULL_END
