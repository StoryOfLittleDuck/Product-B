//
//  RootViewController.m
//  Product-B
//
//  Created by 林建 on 16/7/11.
//  Copyright © 2016年 林建. All rights reserved.
//

#import "RootViewController.h"
#import "DownLoadViewController.h"
#import "PlayViewController.h"
#import "SubscriptionViewController.h"
#import "DiscoverViewController.h"
#import "MindViewController.h"
@interface RootViewController ()
@property (nonatomic ,strong)UIButton *playB;
@end

@implementation RootViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    DownLoadViewController *downVC = [[DownLoadViewController alloc]init];
    PlayViewController *playVC = [[PlayViewController alloc]init];
    SubscriptionViewController *subVC = [[SubscriptionViewController alloc]init];
    DiscoverViewController *disVC = [[DiscoverViewController alloc]init];
    MindViewController *mindVC = [[MindViewController alloc]init];
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, -16, self.tabBar.frame.size.width, self.tabBar.frame.size.height +20)];
    imageV.image = [UIImage imageNamed:@"tabbar_bg@2x.png"];
    [self.tabBar insertSubview:imageV atIndex:0];
    //覆盖原生Tabbar的上横线
    [[UITabBar appearance] setShadowImage:[self createImageWithColor:[UIColor clearColor]]];
    [[UITabBar appearance] setBackgroundImage:[self createImageWithColor:[UIColor clearColor]]];
    [self creatTab:disVC title:@"发现" image:[UIImage imageNamed:@"发现.png"]];
    [self creatTab:subVC title:@"订阅听" image:[UIImage imageNamed:@"订阅.png"]];
    [self creatTab:playVC title:nil image:nil];
    [self creatTab:downVC title:@"下载听" image:[UIImage imageNamed:@"download下载.png"]];
    [self creatTab:mindVC title:@"我的" image:[UIImage imageNamed:@"我的.png"]];
    [self.tabBar addSubview:self.playB];
    // Do any additional setup after loading the view.
}

#pragma mark ----- 覆盖线条方法 -----
-(UIImage *)createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


#pragma mark ----- 创建tabBar视图控制器 -----
-(void)creatTab:(UIViewController *)view title:(NSString *)title image:(UIImage *)image{
    UINavigationController *naVC = [[UINavigationController alloc]initWithRootViewController:view];
    NSDictionary *dic = @{NSFontAttributeName :[UIFont systemFontOfSize:13]};
    [[UITabBarItem appearance] setTitleTextAttributes:dic forState:UIControlStateNormal];
    naVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:image tag:10];
    [self addChildViewController:naVC];
}

#pragma mark ----- 创建播放按钮 -----
-(UIButton *)playB{
    if (!_playB) {
        _playB = [UIButton buttonWithType:UIButtonTypeCustom];
        _playB.frame = CGRectMake(self.tabBar.width/2 - self.tabBar.height/2, -5, self.tabBar.height, self.tabBar.height);
        [_playB setImage:[UIImage imageNamed:@"music_icon_play_highlighted@3x.png"] forState:UIControlStateNormal];
        [_playB addTarget:self action:@selector(playOrPause) forControlEvents:UIControlEventTouchUpInside];
    }
    return _playB;
}

-(void)playOrPause{

}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

