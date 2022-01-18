//
//  sportPageView.m
//  安安趣跑
//
//  Created by 董凯睿 on 2022/1/17.
//

#import "sportPageView.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapSearchKit/AMapSearchKit.h>
//签订协议
@interface sportPageView () <MAMapViewDelegate, AMapSearchDelegate>

@end

@implementation sportPageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//加载UI函数
- (void) creatUI {
    _startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_startButton setTitle:@"开始运动" forState:UIControlStateNormal];
    [_startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _startButton.backgroundColor = [UIColor greenColor];
    _startButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.3037, [UIScreen mainScreen].bounds.size.height * 0.6235, [UIScreen mainScreen].bounds.size.width * 0.3925, [UIScreen mainScreen].bounds.size.height * 0.0764);
    _startButton.layer.cornerRadius = 12.0;
    _startButton.layer.masksToBounds = YES;
    [self addSubview:_startButton];
    
}

//创建跑步地图函数
- (void) creatMap {
    //初始化flag
    _flag = 0;
    //初始化运动距离（米）
    _distanceTest = 0;
    //初始化运动时间（秒）
    _timeLongTest = 0;
    
    //检查地图隐私合规
    [MAMapView updatePrivacyShow:AMapPrivacyShowStatusDidShow privacyInfo:AMapPrivacyInfoStatusDidContain];
    [MAMapView updatePrivacyAgree:AMapPrivacyAgreeStatusDidAgree];
    
    //检查搜索隐私合规
    //[AMapSearchAPI updatePrivacyShow:AMapPrivacyShowStatusDidShow privacyInfo:AMapPrivacyInfoStatusDidContain];
    //[AMapSearchAPI updatePrivacyAgree:AMapPrivacyAgreeStatusDidAgree];
    
    ///地图需要v4.5.0及以上版本才必须要打开此选项（v4.5.0以下版本，需要手动配置info.plist）
    [AMapServices sharedServices].enableHTTPS = YES;
    
    
    //初始化地图
    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        
    //地图跟着位置移动
    [_mapView setUserTrackingMode:MAUserTrackingModeFollow animated:YES];
    
    
    _mapView.delegate = self;
     
    _mapView.showsIndoorMap = YES;    //YES：显示室内地图；NO：不显示；
    
    //把地图添加至view
    [self addSubview:_mapView];
    
    ///如果您需要进入地图就显示定位小蓝点，则需要下面两行代码
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
    
    
    //初始化MAUserLocationRepresentation 对象
    _r = [[MAUserLocationRepresentation alloc] init];
    
    _r.showsAccuracyRing = NO;///精度圈是否显示，默认YES
    ///执行
    [_mapView updateUserLocationRepresentation:_r];
    
    _buttonBack = [UIButton buttonWithType:UIButtonTypeCustom];
    [_buttonBack setTitle:@"返回" forState:UIControlStateNormal];
    [_buttonBack setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_buttonBack addTarget:self action:@selector(pressButtonBack) forControlEvents:UIControlEventTouchUpInside];
    
    _buttonBack.frame = CGRectMake(30, 50, 60, 30);
    
    [_mapView addSubview:_buttonBack];
    
    //添加显示运动里程的视图
    _underView = [[UIView alloc] init];
    _underView.backgroundColor = [UIColor whiteColor];
    _underView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.09345, [UIScreen mainScreen].bounds.size.height * 0.7139, [UIScreen mainScreen].bounds.size.width * 0.8131, [UIScreen mainScreen].bounds.size.height * 0.1620);
    _underView.layer.cornerRadius = 10.0;
    _underView.layer.masksToBounds = YES;
    [_mapView addSubview:_underView];
    
    _labelSpeed = [[UILabel alloc] init];
    _labelTime = [[UILabel alloc] init];
    _labelKm = [[UILabel alloc] init];
    
    _labelSpeed.text = @"配速";
    _labelTime.text = @"时间";
    _labelKm.text = @"距离(km)";
    
    _labelSpeed.textColor = [UIColor grayColor];
    _labelTime.textColor = [UIColor grayColor];
    _labelKm.textColor = [UIColor grayColor];
    
    _labelSpeed.textAlignment = NSTextAlignmentCenter;
    _labelTime.textAlignment = NSTextAlignmentCenter;
    _labelKm.textAlignment = NSTextAlignmentCenter;
    
    _labelSpeed.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0, [UIScreen mainScreen].bounds.size.height * 0.0216, [UIScreen mainScreen].bounds.size.width * 0.1724, [UIScreen mainScreen].bounds.size.height * 0.0324);
    _labelTime.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.315, [UIScreen mainScreen].bounds.size.height * 0.0216, [UIScreen mainScreen].bounds.size.width * 0.1539, [UIScreen mainScreen].bounds.size.height * 0.0324);
    _labelKm.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.62, [UIScreen mainScreen].bounds.size.height * 0.0216, [UIScreen mainScreen].bounds.size.width * 0.1724, [UIScreen mainScreen].bounds.size.height * 0.0324);
    
    [_underView addSubview:_labelSpeed];
    [_underView addSubview:_labelTime];
    [_underView addSubview:_labelKm];
    
    //设置显示内容的label
    _labelTimeContent = [[UILabel alloc] init];
    _labelKmContent = [[UILabel alloc] init];
    _labelSpeedContent = [[UILabel alloc] init];
    
    //将米转化为公里
    double kmTest = _distanceTest / 1000;
    NSString *kmTestString = [NSString stringWithFormat:@"%.2f公里", kmTest];
    _labelKmContent.text = kmTestString;
    
    _labelTimeContent.text = @"00:00:00";
    
    _labelSpeedContent.text = @"00‘00’‘";
    
    _labelSpeedContent.textColor = [UIColor greenColor];
    _labelTimeContent.textColor = [UIColor greenColor];
    _labelKmContent.textColor = [UIColor greenColor];
    
    _labelSpeedContent.textAlignment = NSTextAlignmentCenter;
    _labelTimeContent.textAlignment = NSTextAlignmentCenter;
    _labelKmContent.textAlignment = NSTextAlignmentCenter;
    
    _labelSpeedContent.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0, [UIScreen mainScreen].bounds.size.height * 0.0816, [UIScreen mainScreen].bounds.size.width * 0.1724, [UIScreen mainScreen].bounds.size.height * 0.0324);
    _labelTimeContent.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.305, [UIScreen mainScreen].bounds.size.height * 0.0816, [UIScreen mainScreen].bounds.size.width * 0.1639, [UIScreen mainScreen].bounds.size.height * 0.0324);
    _labelKmContent.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.62, [UIScreen mainScreen].bounds.size.height * 0.0816, [UIScreen mainScreen].bounds.size.width * 0.1724, [UIScreen mainScreen].bounds.size.height * 0.0324);
    
    [_underView addSubview:_labelSpeedContent];
    [_underView addSubview:_labelTimeContent];
    [_underView addSubview:_labelKmContent];
    
    
    //初始化包含当前用户近两次位置的数组
    _contentArray = [[NSMutableArray alloc] init];
    _contentArraySecond = [[NSMutableArray alloc] init];
    
    NSNumber *latitudeTest = [NSNumber numberWithDouble:_mapView.userLocation.coordinate.latitude];
    NSNumber *longitudeTest = [NSNumber numberWithDouble:_mapView.userLocation.coordinate.longitude];
    for (int i = 0; i < 2; ++i) {
        [_contentArray addObject:latitudeTest];
        [_contentArraySecond addObject:longitudeTest];
    }
    
    _timerTest = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(createLine) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:_timerTest forMode:NSDefaultRunLoopMode];
    
    //搜索功能的定义
    self.search = [[AMapSearchAPI alloc] init];
    self.search.delegate = self;
}

//返回按钮的事件函数
- (void) pressButtonBack {
    //此地图界面仅仅是一个添加与当前界面的视图，真实项目中的按钮的功能可以是从当前界面跳转到其他界面（比如上一界面）
    NSLog(@"点击了返回按钮！");
}

//设置折线样式
- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id <MAOverlay>)overlay
{
    if ([overlay isKindOfClass:[MAPolyline class]])
    {
        MAPolylineRenderer *polylineRenderer = [[MAPolylineRenderer alloc] initWithPolyline:overlay];
        
        polylineRenderer.lineWidth    = 8.f;
        polylineRenderer.strokeColor  = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.6];
        polylineRenderer.lineJoinType = kMALineJoinRound;
        polylineRenderer.lineCapType  = kMALineCapRound;
        
        return polylineRenderer;
    }
    return nil;
}


//以下为自己编写的绘制折线轨迹图
- (void) createLine {
    
    NSLog(@"%lf!!", [self.contentArray[1] doubleValue]);
    
    //运动秒数加一
    ++_timeLongTest;
    
    //刷新经纬度数组的数据
    [self.contentArray removeObjectAtIndex:0];
    [self.contentArraySecond removeObjectAtIndex:0];
    NSNumber *latitudeTest = [NSNumber numberWithDouble:_mapView.userLocation.coordinate.latitude];
    NSNumber *longitudeTest = [NSNumber numberWithDouble:_mapView.userLocation.coordinate.longitude];
    [self.contentArray addObject:latitudeTest];
    [self.contentArraySecond addObject:longitudeTest];
    
    if (_flag != 0) {
        //将两个经纬度点转换成投影点
        MAMapPoint pointFirst = MAMapPointForCoordinate(CLLocationCoordinate2DMake([self.contentArray[0] doubleValue], [self.contentArraySecond[0] doubleValue]));
        MAMapPoint pointSecond = MAMapPointForCoordinate(CLLocationCoordinate2DMake([self.contentArray[1] doubleValue], [self.contentArraySecond[1] doubleValue]));
        //计算距离
        CLLocationDistance distance = MAMetersBetweenMapPoints(pointFirst, pointSecond);
        //更新总运动距离（米）
        _distanceTest += distance;
        NSLog(@"%ld", _distanceTest);
    }
    
    //将米转化为公里
    double kmTest = _distanceTest / 1000.0;
    NSLog(@"$$$ %lf", kmTest);
    NSString *kmTestString = [NSString stringWithFormat:@"%.2f公里", kmTest];
    _labelKmContent.text = kmTestString;
    
    if (kmTest >= 0.01) {
        //计算配速
        NSInteger speedTest = _timeLongTest / kmTest;
        NSInteger speedTestMin = speedTest / 60;
        NSInteger speedTestSec = speedTest % 60;
        
        NSString *speedTestText;
        if (speedTestMin < 10 && speedTestSec < 10) {
            speedTestText = [NSString stringWithFormat:@"0%ld‘0%ld‘’", speedTestMin, speedTestSec];
        }
        if (speedTestMin < 10 && speedTestSec > 10) {
            speedTestText = [NSString stringWithFormat:@"0%ld‘%ld‘’", speedTestMin, speedTestSec];
        }
        if (speedTestMin >= 10 && speedTestSec < 10) {
            speedTestText = [NSString stringWithFormat:@"%ld‘0%ld‘’", speedTestMin, speedTestSec];
        }
        if (speedTestMin >= 10 && speedTestSec >= 10) {
            speedTestText = [NSString stringWithFormat:@"%ld‘%ld‘’", speedTestMin, speedTestSec];
        }
        
        _labelSpeedContent.text = speedTestText;
    }
        
    //计算时间
    NSInteger timeHour = _timeLongTest / 3600;
    NSInteger timeMin = (_timeLongTest % 3600) / 60;
    NSInteger timeSec = _timeLongTest % 60;
    NSString *timeTestText;
    if (timeHour < 10 && timeMin < 10 && timeSec < 10) {
        timeTestText = [NSString stringWithFormat:@"0%ld:0%ld:0%ld", timeHour, timeMin, timeSec];
    }
    if (timeHour < 10 && timeMin < 10 && timeSec >= 10) {
        timeTestText = [NSString stringWithFormat:@"0%ld:0%ld:%ld", timeHour, timeMin, timeSec];
    }
    
    if (timeHour < 10 && timeMin >= 10 && timeSec < 10) {
        timeTestText = [NSString stringWithFormat:@"0%ld:%ld:0%ld", timeHour, timeMin, timeSec];
    }
    
    if (timeHour >= 10 && timeMin < 10 && timeSec < 10) {
        timeTestText = [NSString stringWithFormat:@"%ld:%ld:0%ld", timeHour, timeMin, timeSec];
    }
    
    if (timeHour < 10 && timeMin >= 10 && timeSec >= 10) {
        timeTestText = [NSString stringWithFormat:@"0%ld:%ld:%ld", timeHour, timeMin, timeSec];
    }
    
    if (timeHour >= 10 && timeMin >= 10 && timeSec < 10) {
        timeTestText = [NSString stringWithFormat:@"%ld:%ld:0%ld", timeHour, timeMin, timeSec];
    }
    
    if (timeHour >= 10 && timeMin < 10 && timeSec >= 10) {
        timeTestText = [NSString stringWithFormat:@"%ld:0%ld:%ld", timeHour, timeMin, timeSec];
    }
    if (timeHour >= 10 && timeMin >= 10 && timeSec >= 10) {
        timeTestText = [NSString stringWithFormat:@"%ld:%ld:%ld", timeHour, timeMin, timeSec];
    }
    
        
    _labelTimeContent.text = timeTestText;
    
    
    CLLocationCoordinate2D commonPolylineCoords[2];
    
    commonPolylineCoords[0].latitude = [self.contentArray[0] doubleValue];
    commonPolylineCoords[0].longitude = [self.contentArraySecond[0] doubleValue];
    
    commonPolylineCoords[1].latitude = [self.contentArray[1] doubleValue];
    commonPolylineCoords[1].longitude = [self.contentArraySecond[1] doubleValue];
    
    //构造折线对象
    MAPolyline *commonPolyline = [MAPolyline polylineWithCoordinates:commonPolylineCoords count:2];
    
    
    //在地图上添加折线对象
    [_mapView addOverlay:commonPolyline];
 
    
    if (_flag == 0) {
        [_mapView removeOverlay:commonPolyline];
        ++_flag;
    }
    
}

@end
