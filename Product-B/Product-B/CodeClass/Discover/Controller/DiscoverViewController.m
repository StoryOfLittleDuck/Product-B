//
//  DiscoverViewController.m
//  Product-B
//
//  Created by 林建 on 16/7/11.
//  Copyright © 2016年 林建. All rights reserved.
//

#import "DiscoverViewController.h"

@interface DiscoverViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong)UILabel *titleL;
@property (nonatomic, strong)UIScrollView *scrollV;
@property (nonatomic, strong)UIView *lineV;
@property (nonatomic, strong)UISegmentedControl *titleSeg;
@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.view addSubview:self.titleL];
    [self.view addSubview:self.titleSeg];
    [self.view addSubview:self.lineV];
    [self.view addSubview:self.scrollV];
    // Do any additional setup after loading the view.
}

#pragma mark ----- 创建标题label -----
-(UILabel *)titleL{
    if (!_titleL) {
        _titleL = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, 200, 40)];
        _titleL.textColor = [UIColor orangeColor];
        _titleL.font = [UIFont systemFontOfSize:20];
        _titleL.text = @"珠穆朗玛FM";
    }
    return _titleL;
}

#pragma mark ----- 创建标签seg -----
-(UISegmentedControl *)titleSeg{
    if (!_titleSeg) {
        _titleSeg = [[UISegmentedControl alloc]initWithItems:@[@"推荐",@"分类",@"广播",@"榜单",@"主播"]];
        _titleSeg.frame = CGRectMake(0, self.navigationController.navigationBar.frame.size.height+20, kScreenWidth, 20);
        NSDictionary *textAtt = @{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor orangeColor]};
        _titleSeg.tintColor = [UIColor clearColor];
        [_titleSeg setTitleTextAttributes:textAtt forState:UIControlStateSelected];
        //设置文字属性
        NSDictionary  *selectedTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:15],
                                                   NSForegroundColorAttributeName: [UIColor lightGrayColor]};
        [_titleSeg setTitleTextAttributes:selectedTextAttributes forState:UIControlStateNormal];
        _titleSeg.selectedSegmentIndex = 0;
    }
    return _titleSeg;
}

#pragma mark ----- 创建线条视图 -----
-(UIView *)lineV{
    if (!_lineV) {
        _lineV = [[UIView alloc]initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+39, kScreenWidth/5, 1)];
        _lineV.backgroundColor = [UIColor orangeColor];
    }
    return _lineV;
}

#pragma mark ----- 创建scrollView -----
-(UIScrollView *)scrollV{
    if (!_scrollV) {
        _scrollV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+40, kScreenWidth, kScreenHeight - self.navigationController.navigationBar.frame.size.height -40- self.tabBarController.tabBar.height)];
        _scrollV.contentOffset = CGPointMake(kScreenWidth *5, 0);
        _scrollV.delegate = self;
    }
    return _scrollV;
}

#pragma mark ----- scrollView协议方法 -----
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.titleSeg.selectedSegmentIndex = self.scrollV.contentOffset.x /kScreenWidth;
    self.lineV
}

- (void)didReceiveMemoryWarning {
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
