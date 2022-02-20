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
//利用“class-continuation分类”签订协议
@interface sportPageView ()
<MAMapViewDelegate, AMapSearchDelegate,
UIPickerViewDelegate, UIPickerViewDataSource>
//UIPickerViewDelegate中存数据的三个数组
@property (nonatomic, copy) NSArray *arrayDataFirst;
@property (nonatomic, copy) NSArray *arrayDataSecond;
@property (nonatomic, copy) NSArray *arrayDataThird;
//三个UIPickerView上方的标题label
@property (nonatomic, strong) UILabel *setDistanceLabel;
@property (nonatomic, strong) UILabel *setTimeLabel;
@property (nonatomic, strong) UILabel *setSpeedLabel;
//三个标题label下方的实际内容
@property (nonatomic, strong) UILabel *distanceContentLabel;
@property (nonatomic, strong) UILabel *timeContentLabel;
@property (nonatomic, strong) UILabel *speedContentLabel;
//目标设定界面的返回按钮
@property (nonatomic, strong) UIButton *backButtonPick;
//确定保存信息按钮
@property (nonatomic, strong) UIButton *sureButton;

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
    //设置页面背景
    _backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WechatIMG817.jpeg"]];
    _backgroundImageView.frame =CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self addSubview:_backgroundImageView];
    
    //设置显示里程的label
    _labelTitle = [[UILabel alloc] init];
    _labelContent = [[UILabel alloc] init];
    _labelTitle.text = @"累计跑步距离：";
    _labelContent.text = @"0.00km";
    [_labelTitle setFont:[UIFont systemFontOfSize:16]];
    _labelContent.font = [UIFont boldSystemFontOfSize:40];
    _labelTitle.textColor = [UIColor grayColor];
    _labelContent.textColor = [UIColor blackColor];
    _labelTitle.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.1285, [UIScreen mainScreen].bounds.size.height * 0.1943, [UIScreen mainScreen].bounds.size.width * 0.3504, [UIScreen mainScreen].bounds.size.height * 0.0324);
    _labelContent.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.1285, [UIScreen mainScreen].bounds.size.height * 0.25, [UIScreen mainScreen].bounds.size.width * 0.6542, [UIScreen mainScreen].bounds.size.height * 0.0864);
    [self addSubview:_labelTitle];
    [self addSubview:_labelContent];
    //创建开始运动按钮
    _startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_startButton setTitle:@"开始运动" forState:UIControlStateNormal];
    [_startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _startButton.backgroundColor = [UIColor greenColor];
    _startButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.3037, [UIScreen mainScreen].bounds.size.height * 0.6235, [UIScreen mainScreen].bounds.size.width * 0.3925, [UIScreen mainScreen].bounds.size.height * 0.0764);
    _startButton.layer.cornerRadius = 12.0;
    _startButton.layer.masksToBounds = YES;
    [self addSubview:_startButton];
    //创建跑前提醒按钮
    _tipsButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_tipsButton setTitle:@"跑前提醒" forState:UIControlStateNormal];
    [_tipsButton setTitleColor:[UIColor colorWithRed:95/255.0 green:158/255.0 blue:160/255.0 alpha:1] forState:UIControlStateNormal];
    _tipsButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.3832, [UIScreen mainScreen].bounds.size.height * 0.5635, [UIScreen mainScreen].bounds.size.width * 0.2336, [UIScreen mainScreen].bounds.size.height * 0.0464);
    [self addSubview:_tipsButton];
    //创建目标设置按钮
    _setTargetButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_setTargetButton setTitle:@"设置目标" forState:UIControlStateNormal];
    [_setTargetButton setTitleColor:[UIColor colorWithRed:95/255.0 green:158/255.0 blue:160/255.0 alpha:1] forState:UIControlStateNormal];
    [_setTargetButton addTarget:self action:@selector(pressButtonTarget) forControlEvents:UIControlEventTouchUpInside];
    _setTargetButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.3832, [UIScreen mainScreen].bounds.size.height * 0.7135, [UIScreen mainScreen].bounds.size.width * 0.2336, [UIScreen mainScreen].bounds.size.height * 0.0464);
    [self addSubview:_setTargetButton];
    
}

//设置目标按钮的事件函数
- (void) pressButtonTarget {
    //在跑步界面上覆盖一层白色视图，用于后续加载UIPickerView
    _selectView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _selectView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_selectView];
    //预先设置UIPickerView中需要显示的数据
    _arrayDataFirst = @[@"0.80", @"1.00", @"2.00", @"3.00", @"4.00", @"5.00", @"6.00", @"7.00", @"8.00", @"9.00", @"10.00", @"15.00", @"21.25", @"42.25"];
    
    _arrayDataSecond = @[@"00:10:00", @"00:20:00", @"00:30:00", @"00:40:00", @"00:50:00", @"01:00:00", @"01:10:00", @"01:20:00", @"01:30:00", @"01:40:00", @"01:50:00", @"02:00:00", @"02:10:00", @"02:20:00", @"02:30:00", @"02:40:00", @"02:50:00", @"03:00:00", @"03:10:00", @"03:20:00", @"03:30:00", @"03:40:00", @"03:50:00", @"04:00:00", @"04:10:00", @"04:20:00", @"04:30:00", @"04:40:00", @"04:50:00", @"05:00:00"];
    
    _arrayDataThird = @[@"3'00''", @"4'00''", @"5'00''", @"6'00''", @"7'00''", @"8'00''"];
    
    //创建UIPickerView(若不设置frame，就会按照默认的位置加载视图)
    _targetPickerView = [[UIPickerView alloc] init];
    _targetPickerView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height * 0.2, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height * 0.72);
    _targetPickerView.showsLargeContentViewer = YES;
    _targetPickerView.delegate = self;
    _targetPickerView.dataSource = self;
    [_selectView addSubview:_targetPickerView];
    //设置UIPickerView上方的视图控件
    _setDistanceLabel = [[UILabel alloc] init];
    _setDistanceLabel.text = @"距离/km";
    _setDistanceLabel.font = [UIFont systemFontOfSize:18];
    _setDistanceLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.1002, [UIScreen mainScreen].bounds.size.height * 0.1240, [UIScreen mainScreen].bounds.size.width * 0.1869, [UIScreen mainScreen].bounds.size.height * 0.0432);
    _setDistanceLabel.textAlignment = NSTextAlignmentCenter;
    [_selectView addSubview:_setDistanceLabel];
    
    _setTimeLabel = [[UILabel alloc] init];
    _setTimeLabel.text = @"时长";
    _setTimeLabel.font = [UIFont systemFontOfSize:18];
    _setTimeLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.4065, [UIScreen mainScreen].bounds.size.height * 0.1240, [UIScreen mainScreen].bounds.size.width * 0.1869, [UIScreen mainScreen].bounds.size.height * 0.0432);
    _setTimeLabel.textAlignment = NSTextAlignmentCenter;
    [_selectView addSubview:_setTimeLabel];
    
    _setSpeedLabel = [[UILabel alloc] init];
    _setSpeedLabel.text = @"配速";
    _setSpeedLabel.font = [UIFont systemFontOfSize:18];
    _setSpeedLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.7129, [UIScreen mainScreen].bounds.size.height * 0.1240, [UIScreen mainScreen].bounds.size.width * 0.1869, [UIScreen mainScreen].bounds.size.height * 0.0432);
    _setSpeedLabel.textAlignment = NSTextAlignmentCenter;
    [_selectView addSubview:_setSpeedLabel];
    
    _distanceContentLabel = [[UILabel alloc] init];
    _distanceContentLabel.text = @"";
    _distanceContentLabel.font = [UIFont boldSystemFontOfSize:30];
    _distanceContentLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.0701, [UIScreen mainScreen].bounds.size.height * 0.1850, [UIScreen mainScreen].bounds.size.width * 0.2336, [UIScreen mainScreen].bounds.size.height * 0.0540);
    _distanceContentLabel.textAlignment = NSTextAlignmentCenter;
    [_selectView addSubview:_distanceContentLabel];
    
    _timeContentLabel = [[UILabel alloc] init];
    _timeContentLabel.text = @"";
    _timeContentLabel.font = [UIFont boldSystemFontOfSize:30];
    _timeContentLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.3247, [UIScreen mainScreen].bounds.size.height * 0.1850, [UIScreen mainScreen].bounds.size.width * 0.3504, [UIScreen mainScreen].bounds.size.height * 0.0540);
    _timeContentLabel.textAlignment = NSTextAlignmentCenter;
    [_selectView addSubview:_timeContentLabel];
    
    _speedContentLabel = [[UILabel alloc] init];
    _speedContentLabel.font = [UIFont boldSystemFontOfSize:30];
    _speedContentLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.6963, [UIScreen mainScreen].bounds.size.height * 0.1850, [UIScreen mainScreen].bounds.size.width * 0.2336, [UIScreen mainScreen].bounds.size.height * 0.0540);
    _speedContentLabel.text = @"";
    _speedContentLabel.textAlignment = NSTextAlignmentCenter;
    [_selectView addSubview:_speedContentLabel];
    
    _backButtonPick = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backButtonPick setTitle:@"返回" forState:UIControlStateNormal];
    [_backButtonPick setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_backButtonPick addTarget:self action:@selector(pressButtonBackToSport) forControlEvents:UIControlEventTouchUpInside];
    _backButtonPick.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.0501, [UIScreen mainScreen].bounds.size.height * 0.0564, [UIScreen mainScreen].bounds.size.width * 0.1869, [UIScreen mainScreen].bounds.size.height * 0.0432);
    [_selectView addSubview:_backButtonPick];
    
    _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
    [_sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_sureButton addTarget:self action:@selector(pressButtonSure) forControlEvents:UIControlEventTouchUpInside];
    _sureButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.3487, [UIScreen mainScreen].bounds.size.height * 0.8335, [UIScreen mainScreen].bounds.size.width * 0.3025, [UIScreen mainScreen].bounds.size.height * 0.0664);
    _sureButton.backgroundColor = [UIColor greenColor];
    _sureButton.layer.cornerRadius = 12.0;
    _sureButton.layer.masksToBounds = YES;
    [_selectView addSubview:_sureButton];
    
}

//目标设定界面的返回按钮的事件函数
- (void) pressButtonBackToSport {
    //移除目标设定界面底层的视图
    [_selectView removeFromSuperview];
}

//目标设定界面的确定按钮的事件函数
- (void) pressButtonSure {
    //移除目标设定界面底层的视图
    [_selectView removeFromSuperview];
}

//设置列数
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}
//设置每列的行数
- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return _arrayDataFirst.count;
    } else if (component == 1) {
        return _arrayDataSecond.count;
    } else {
        return _arrayDataThird.count;
    }
}

//返回每列的行宽
- (CGFloat) pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (component == 0) {
        return 80;
    } else if (component == 1) {
        return 240;
    } else {
        return 100;
    }
}


// 返回选中的行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        NSString *contentString = [_arrayDataFirst objectAtIndex:row];
        NSLog(@"FirstStr = %@", contentString);
        _distanceContentLabel.text = contentString;
    } else if (component == 1) {
        NSString *contentString = [_arrayDataSecond objectAtIndex:row];
        NSLog(@"SecondStr = %@", contentString);
        _timeContentLabel.text = contentString;
    } else {
        NSString *contentString = [_arrayDataThird objectAtIndex:row];
        NSLog(@"ThirdStr = %@", contentString);
        _speedContentLabel.text = contentString;
    }
    
}

 
//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    if (component == 0) {
        return [_arrayDataFirst objectAtIndex:row];
    } else if (component == 1) {
        return [_arrayDataSecond objectAtIndex:row];
    } else {
        return [_arrayDataThird objectAtIndex:row];
    }
     
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
    _labelTimeContent.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.305, [UIScreen mainScreen].bounds.size.height * 0.0816, [UIScreen mainScreen].bounds.size.width * 0.1739, [UIScreen mainScreen].bounds.size.height * 0.0324);
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
    //此操作仅仅是移除了地图视图，并非让其所有相关代码停止运行
    [_mapView removeFromSuperview];
    //取消定时器(否则地图相关的运算代码仍然在运行)
    [_timerTest invalidate];
    _timerTest = nil;
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
