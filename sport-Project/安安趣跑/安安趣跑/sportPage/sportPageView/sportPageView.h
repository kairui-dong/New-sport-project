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


@property (nonatomic, strong) UIButton *startButton;

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
