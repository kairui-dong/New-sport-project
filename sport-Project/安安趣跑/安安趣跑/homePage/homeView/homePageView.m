//
//  homePageView.m
//  安安趣跑
//
//  Created by 董凯睿 on 2022/1/17.
//

#import "homePageView.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface homePageView () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *homeScrollView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) NSArray *urlArray;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) AVPlayerViewController *avPlayerViewController;
@property (nonatomic, strong) AVPlayerViewController *avPlayerViewControllerTwo;
@property (nonatomic, strong) AVPlayerViewController *avPlayerViewControllerThree;
@property (nonatomic, strong) AVPlayerViewController *avPlayerViewControllerFour;
@property (nonatomic, strong) AVPlayerViewController *avPlayerViewControllerFive;
@property (nonatomic, strong) AVPlayerViewController *avPlayerViewControllerSix;
@property (nonatomic, strong) AVPlayerViewController *avPlayerViewControllerSeven;
@property (nonatomic, strong) AVPlayerViewController *avPlayerViewControllerEight;
@property (nonatomic, strong) AVPlayerViewController *avPlayerViewControllerNine;
@property (nonatomic, strong) AVPlayerViewController *avPlayerViewControllerTen;
@property (nonatomic, strong) AVPlayerViewController *avPlayerViewControllerEleven;
@property (nonatomic, strong) AVPlayerViewController *avPlayerViewControllerTwelve;
@property (nonatomic, strong) AVPlayerViewController *avPlayerViewControllerThirteen;
@property (nonatomic, strong) AVPlayerViewController *avPlayerViewControllerFourteen;

@end

@implementation homePageView

- (void) creatUI {
    _homeScrollView = [[UIScrollView alloc] init];
    _homeScrollView.delegate = self;
    _homeScrollView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height * 0.09, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    _homeScrollView.bounces = NO;
    _homeScrollView.userInteractionEnabled = YES;
    //下方特性为NO时滑动视图可以停在任意位置
    _homeScrollView.pagingEnabled = NO;
    _homeScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height * 2.5);
    //开启横纵向弹动效果
    _homeScrollView.alwaysBounceHorizontal = NO;
    _homeScrollView.alwaysBounceVertical = NO;
    _homeScrollView.showsHorizontalScrollIndicator = NO;
    _homeScrollView.showsVerticalScrollIndicator = YES;
    _homeScrollView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_homeScrollView];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.text = @"精选视频";
    _titleLabel.font = [UIFont boldSystemFontOfSize:27];
    _titleLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.0701, [UIScreen mainScreen].bounds.size.height * 0.0324, [UIScreen mainScreen].bounds.size.width * 0.3804, [UIScreen mainScreen].bounds.size.height * 0.0648);
    [_homeScrollView addSubview:_titleLabel];
    
    //用字面量语法创建存视频URL的数组
    _urlArray = @[@"http://1309230531.vod2.myqcloud.com/3d4b61fdvodcq1309230531/91a98055387702296211781763/wx6zorvemtgA.mp4", @"http://1309230531.vod2.myqcloud.com/3d4b61fdvodcq1309230531/d08241d4387702296212164874/ZHMjKhrehiIA.mp4", @"http://1309230531.vod2.myqcloud.com/3d4b61fdvodcq1309230531/9161a5ab387702296211742603/ApdkK3huHxcA.mp4", @"http://1309230531.vod2.myqcloud.com/3d4b61fdvodcq1309230531/8cdc0e14387702296211563548/AA3Fp1TFqXoA.mp4", @"http://1309230531.vod2.myqcloud.com/3d4b61fdvodcq1309230531/ce64e9ac387702296212097141/vaPZs61qRzoA.mp4", @"http://1309230531.vod2.myqcloud.com/3d4b61fdvodcq1309230531/9161a60e387702296211742633/E1kHEpQTLgkA.mp4", @"http://1309230531.vod2.myqcloud.com/3d4b61fdvodcq1309230531/cdc22712387702296212007777/RiyTtCdG4xAA.mp4", @"http://1309230531.vod2.myqcloud.com/3d4b61fdvodcq1309230531/8cdc0eb1387702296211563590/PHZU7W9tasEA.mp4", @"http://1309230531.vod2.myqcloud.com/3d4b61fdvodcq1309230531/91a98438387702296211781838/SygDrzoakC8A.mp4", @"http://1309230531.vod2.myqcloud.com/3d4b61fdvodcq1309230531/8cdc11ee387702296211563614/jHBPDTAdyWoA.mp4", @"http://1309230531.vod2.myqcloud.com/3d4b61fdvodcq1309230531/9161a6b0387702296211742680/rA7JXIseshwA.mp4", @"http://1309230531.vod2.myqcloud.com/3d4b61fdvodcq1309230531/8cdc1230387702296211563634/uFctdvvENU4A.mp4", @"http://1309230531.vod2.myqcloud.com/3d4b61fdvodcq1309230531/91a984bd387702296211781879/lgvQEW8BQ0AA.mp4", @"http://1309230531.vod2.myqcloud.com/3d4b61fdvodcq1309230531/9161aa0a387702296211742710/IFoa3KCPOH0A.mp4"];
    
    _titleArray = @[@"臀部基准", @"动态拉伸训练", @"短距离间歇跑训练", @"高抬腿训练", @"后踢腿训练和高抬腿训练", @"节奏跑", @"马拉松模拟训练", @"慢速高抬腿", @"提高成绩的冲刺练习", @"头部基准", @"长距离间歇跑训练", @"掌握正确跑步姿势", @"直腿交叉曲腿交叉与跑步", @"中速高抬腿训练"];
    
    for (int i = 0; i < _urlArray.count; ++i) {
        NSURL *webVideoUrl = [NSURL URLWithString:_urlArray[i]];
        //创建AVPlayer
        AVPlayer *avPlayer = [[AVPlayer alloc] initWithURL:webVideoUrl];
        if (i == 0) {
            //使用AVPlayer创建AVPlayerViewController,并跳转播放界面
            _avPlayerViewController = [[AVPlayerViewController alloc] init];
            _avPlayerViewController.player = avPlayer;
            _avPlayerViewController.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.0701, [UIScreen mainScreen].bounds.size.height * 0.1096 + i * [UIScreen mainScreen].bounds.size.height * 0.1570, [UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.height * 0.13);
            _avPlayerViewController.view.layer.cornerRadius = 8.0;
            _avPlayerViewController.view.layer.masksToBounds = YES;
            [_homeScrollView addSubview:_avPlayerViewController.view];
        } else if (i == 1) {
            _avPlayerViewControllerTwo = [[AVPlayerViewController alloc] init];
            _avPlayerViewControllerTwo.player = avPlayer;
            _avPlayerViewControllerTwo.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.0701, [UIScreen mainScreen].bounds.size.height * 0.1096 + i * [UIScreen mainScreen].bounds.size.height * 0.1570, [UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.height * 0.13);
            _avPlayerViewControllerTwo.view.layer.cornerRadius = 8.0;
            _avPlayerViewControllerTwo.view.layer.masksToBounds = YES;
            [_homeScrollView addSubview:_avPlayerViewControllerTwo.view];
        } else if (i == 2) {
            _avPlayerViewControllerThree = [[AVPlayerViewController alloc] init];
            _avPlayerViewControllerThree.player = avPlayer;
            _avPlayerViewControllerThree.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.0701, [UIScreen mainScreen].bounds.size.height * 0.1096 + i * [UIScreen mainScreen].bounds.size.height * 0.1570, [UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.height * 0.13);
            _avPlayerViewControllerThree.view.layer.cornerRadius = 8.0;
            _avPlayerViewControllerThree.view.layer.masksToBounds = YES;
            [_homeScrollView addSubview:_avPlayerViewControllerThree.view];
        } else if (i == 3) {
            _avPlayerViewControllerFour = [[AVPlayerViewController alloc] init];
            _avPlayerViewControllerFour.player = avPlayer;
            _avPlayerViewControllerFour.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.0701, [UIScreen mainScreen].bounds.size.height * 0.1096 + i * [UIScreen mainScreen].bounds.size.height * 0.1570, [UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.height * 0.13);
            _avPlayerViewControllerFour.view.layer.cornerRadius = 8.0;
            _avPlayerViewControllerFour.view.layer.masksToBounds = YES;
            [_homeScrollView addSubview:_avPlayerViewControllerFour.view];
        } else if (i == 4) {
            _avPlayerViewControllerFive = [[AVPlayerViewController alloc] init];
            _avPlayerViewControllerFive.player = avPlayer;
            _avPlayerViewControllerFive.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.0701, [UIScreen mainScreen].bounds.size.height * 0.1096 + i * [UIScreen mainScreen].bounds.size.height * 0.1570, [UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.height * 0.13);
            _avPlayerViewControllerFive.view.layer.cornerRadius = 8.0;
            _avPlayerViewControllerFive.view.layer.masksToBounds = YES;
            [_homeScrollView addSubview:_avPlayerViewControllerFive.view];
        } else if (i == 5) {
            _avPlayerViewControllerSix = [[AVPlayerViewController alloc] init];
            _avPlayerViewControllerSix.player = avPlayer;
            _avPlayerViewControllerSix.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.0701, [UIScreen mainScreen].bounds.size.height * 0.1096 + i * [UIScreen mainScreen].bounds.size.height * 0.1570, [UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.height * 0.13);
            _avPlayerViewControllerSix.view.layer.cornerRadius = 8.0;
            _avPlayerViewControllerSix.view.layer.masksToBounds = YES;
            [_homeScrollView addSubview:_avPlayerViewControllerSix.view];
        } else if (i == 6) {
            _avPlayerViewControllerSeven = [[AVPlayerViewController alloc] init];
            _avPlayerViewControllerSeven.player = avPlayer;
            _avPlayerViewControllerSeven.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.0701, [UIScreen mainScreen].bounds.size.height * 0.1096 + i * [UIScreen mainScreen].bounds.size.height * 0.1570, [UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.height * 0.13);
            _avPlayerViewControllerSeven.view.layer.cornerRadius = 8.0;
            _avPlayerViewControllerSeven.view.layer.masksToBounds = YES;
            [_homeScrollView addSubview:_avPlayerViewControllerSeven.view];
        } else if (i == 7) {
            _avPlayerViewControllerEight = [[AVPlayerViewController alloc] init];
            _avPlayerViewControllerEight.player = avPlayer;
            _avPlayerViewControllerEight.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.0701, [UIScreen mainScreen].bounds.size.height * 0.1096 + i * [UIScreen mainScreen].bounds.size.height * 0.1570, [UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.height * 0.13);
            _avPlayerViewControllerEight.view.layer.cornerRadius = 8.0;
            _avPlayerViewControllerEight.view.layer.masksToBounds = YES;
            [_homeScrollView addSubview:_avPlayerViewControllerEight.view];
        } else if (i == 8) {
            _avPlayerViewControllerNine = [[AVPlayerViewController alloc] init];
            _avPlayerViewControllerNine.player = avPlayer;
            _avPlayerViewControllerNine.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.0701, [UIScreen mainScreen].bounds.size.height * 0.1096 + i * [UIScreen mainScreen].bounds.size.height * 0.1570, [UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.height * 0.13);
            _avPlayerViewControllerNine.view.layer.cornerRadius = 8.0;
            _avPlayerViewControllerNine.view.layer.masksToBounds = YES;
            [_homeScrollView addSubview:_avPlayerViewControllerNine.view];
        } else if (i == 9) {
            _avPlayerViewControllerTen = [[AVPlayerViewController alloc] init];
            _avPlayerViewControllerTen.player = avPlayer;
            _avPlayerViewControllerTen.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.0701, [UIScreen mainScreen].bounds.size.height * 0.1096 + i * [UIScreen mainScreen].bounds.size.height * 0.1570, [UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.height * 0.13);
            _avPlayerViewControllerTen.view.layer.cornerRadius = 8.0;
            _avPlayerViewControllerTen.view.layer.masksToBounds = YES;
            [_homeScrollView addSubview:_avPlayerViewControllerTen.view];
        } else if (i == 10) {
            _avPlayerViewControllerEleven = [[AVPlayerViewController alloc] init];
            _avPlayerViewControllerEleven.player = avPlayer;
            _avPlayerViewControllerEleven.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.0701, [UIScreen mainScreen].bounds.size.height * 0.1096 + i * [UIScreen mainScreen].bounds.size.height * 0.1570, [UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.height * 0.13);
            _avPlayerViewControllerEleven.view.layer.cornerRadius = 8.0;
            _avPlayerViewControllerEleven.view.layer.masksToBounds = YES;
            [_homeScrollView addSubview:_avPlayerViewControllerEleven.view];
        } else if (i == 11) {
            _avPlayerViewControllerTwelve = [[AVPlayerViewController alloc] init];
            _avPlayerViewControllerTwelve.player = avPlayer;
            _avPlayerViewControllerTwelve.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.0701, [UIScreen mainScreen].bounds.size.height * 0.1096 + i * [UIScreen mainScreen].bounds.size.height * 0.1570, [UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.height * 0.13);
            _avPlayerViewControllerTwelve.view.layer.cornerRadius = 8.0;
            _avPlayerViewControllerTwelve.view.layer.masksToBounds = YES;
            [_homeScrollView addSubview:_avPlayerViewControllerTwelve.view];
        } else if (i == 12) {
            _avPlayerViewControllerThirteen = [[AVPlayerViewController alloc] init];
            _avPlayerViewControllerThirteen.player = avPlayer;
            _avPlayerViewControllerThirteen.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.0701, [UIScreen mainScreen].bounds.size.height * 0.1096 + i * [UIScreen mainScreen].bounds.size.height * 0.1570, [UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.height * 0.13);
            _avPlayerViewControllerThirteen.view.layer.cornerRadius = 8.0;
            _avPlayerViewControllerThirteen.view.layer.masksToBounds = YES;
            [_homeScrollView addSubview:_avPlayerViewControllerThirteen.view];
        } else if (i == 13) {
            _avPlayerViewControllerFourteen = [[AVPlayerViewController alloc] init];
            _avPlayerViewControllerFourteen.player = avPlayer;
            _avPlayerViewControllerFourteen.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.0701, [UIScreen mainScreen].bounds.size.height * 0.1096 + i * [UIScreen mainScreen].bounds.size.height * 0.1570, [UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.height * 0.13);
            _avPlayerViewControllerFourteen.view.layer.cornerRadius = 8.0;
            _avPlayerViewControllerFourteen.view.layer.masksToBounds = YES;
            [_homeScrollView addSubview:_avPlayerViewControllerFourteen.view];
        }
        
        UILabel *videoTitleLabel = [[UILabel alloc] init];
        videoTitleLabel.text = _titleArray[i];
        videoTitleLabel.font = [UIFont boldSystemFontOfSize:17];
        videoTitleLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.6, [UIScreen mainScreen].bounds.size.height * 0.1196 + i * [UIScreen mainScreen].bounds.size.height * 0.1570, [UIScreen mainScreen].bounds.size.width * 0.3, [UIScreen mainScreen].bounds.size.height * 0.0624);
        [_homeScrollView addSubview:videoTitleLabel];
        videoTitleLabel.numberOfLines = 0;
        
        
        UILabel *subTitleLabel = [[UILabel alloc] init];
        subTitleLabel.text = @"趣跑精选课";
        subTitleLabel.font = [UIFont systemFontOfSize:14];
        subTitleLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.6, [UIScreen mainScreen].bounds.size.height * 0.1926 + i * [UIScreen mainScreen].bounds.size.height * 0.1570, [UIScreen mainScreen].bounds.size.width * 0.3, [UIScreen mainScreen].bounds.size.height * 0.020);
        subTitleLabel.textColor = [UIColor grayColor];
        [_homeScrollView addSubview:subTitleLabel];
        
    }
    
    
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
