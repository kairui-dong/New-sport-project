//
//  registerView.m
//  安安趣跑
//
//  Created by 董凯睿 on 2022/1/8.
//

#import "registerView.h"

@implementation registerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//创建UI的函数
- (void) creatUI {
    
    self.backgroundColor = [UIColor whiteColor];
    
    _backView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WechatIMG795.jpeg"]];
    _backView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    //将背景视图添加到当前视图
    [self addSubview:_backView];
    
    //账号框
    _accountTextField = [[UITextField alloc] init];
    //密码框
    _passwordTextField = [[UITextField alloc] init];
    
    _accountTextField.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.2803, [UIScreen mainScreen].bounds.size.height * 0.2540, [UIScreen mainScreen].bounds.size.width * 0.6205, [UIScreen mainScreen].bounds.size.height * 0.0764);
    
    _passwordTextField.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.2803, [UIScreen mainScreen].bounds.size.height * 0.3736, [UIScreen mainScreen].bounds.size.width * 0.6205, [UIScreen mainScreen].bounds.size.height * 0.0764);
    
    //内容文字(先设置为空)
    _accountTextField.text = @"";
    _passwordTextField.text = @"";
    
    //字体大小
    _accountTextField.font = [UIFont systemFontOfSize:18];
    _passwordTextField.font = [UIFont systemFontOfSize:18];
    
    //框内预设文字的颜色
    _accountTextField.textColor = [UIColor blackColor];
    _passwordTextField.textColor = [UIColor blackColor];
    
    //设置其背景颜色
    _accountTextField.backgroundColor = [UIColor clearColor];
    _passwordTextField.backgroundColor = [UIColor clearColor];
    
    //设置边框风格
    _accountTextField.borderStyle = UITextBorderStyleRoundedRect;
    _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    //设置边框的颜色和粗细
    _accountTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _passwordTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _accountTextField.layer.borderWidth = 3.0;
    _passwordTextField.layer.borderWidth = 3.0;
    
    //设置边框的圆角弧度
    _accountTextField.layer.cornerRadius = 12.0;
    _passwordTextField.layer.cornerRadius = 12.0;
    
    //设置虚拟键盘的风格
    //设置纯数字风格
    _accountTextField.keyboardType = UIKeyboardTypeNumberPad;
    //设置字母和数字组合风格
    _passwordTextField.keyboardType = UIKeyboardTypeNamePhonePad;
    
    //设置提示文字(文字为浅灰色)
    _accountTextField.placeholder = @"  请输入手机号";
    _passwordTextField.placeholder = @"  请输入验证码";

    
    //设置代理
    _accountTextField.delegate = self;
    _passwordTextField.delegate = self;
    
    //添加到当前视图
    [self addSubview:_accountTextField];
    [self addSubview:_passwordTextField];
    
    //创建输入栏的图标
    _accountImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zhanghao.png"]];
    _passWordImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mima.png"]];
    _accountImageView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.1303, [UIScreen mainScreen].bounds.size.height * 0.2640, [UIScreen mainScreen].bounds.size.width * 0.1168, [UIScreen mainScreen].bounds.size.height * 0.0540);
    _passWordImageView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.1303, [UIScreen mainScreen].bounds.size.height * 0.3836, [UIScreen mainScreen].bounds.size.width * 0.1168, [UIScreen mainScreen].bounds.size.height * 0.0540);
    [self addSubview:_accountImageView];
    [self addSubview:_passWordImageView];
    
    //创建登录按钮
    _upButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_upButton setTitle:@"登录" forState:UIControlStateNormal];
    //[_upButton addTarget:self action:@selector(pressButton) forControlEvents:UIControlEventTouchUpInside];
    [_upButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _upButton.backgroundColor = [UIColor greenColor];
    _upButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.3037, [UIScreen mainScreen].bounds.size.height * 0.6235, [UIScreen mainScreen].bounds.size.width * 0.3925, [UIScreen mainScreen].bounds.size.height * 0.0764);
    _upButton.layer.cornerRadius = 12;
    _upButton.layer.masksToBounds = YES;
    [self addSubview:_upButton];
    
    //创建注册的文字按钮
    _registerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_registerButton setTitle:@"点击注册" forState:UIControlStateNormal];
    //[_registerButton addTarget:self action:@selector(pressButtonRegister) forControlEvents:UIControlEventTouchUpInside];
    _registerButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.3037, [UIScreen mainScreen].bounds.size.height * 0.7235, [UIScreen mainScreen].bounds.size.width * 0.3925, [UIScreen mainScreen].bounds.size.height * 0.0364);
    [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:_registerButton];
    
    //创建手机号登录按钮
    _upByPhoneButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_upByPhoneButton setTitle:@"手机验证码登录" forState:UIControlStateNormal];
    _upByPhoneButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.6037, [UIScreen mainScreen].bounds.size.height * 0.0735, [UIScreen mainScreen].bounds.size.width * 0.3925, [UIScreen mainScreen].bounds.size.height * 0.0364);
    [_upByPhoneButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:_upByPhoneButton];
}





@end
