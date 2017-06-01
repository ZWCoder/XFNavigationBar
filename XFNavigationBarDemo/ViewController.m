//
//  ViewController.m
//  XFNavigationBarDemo
//
//  Created by mc on 2017/5/17.
//  Copyright © 2017年 科大讯飞. All rights reserved.
//

#import "ViewController.h"
#import "XFNavigationBar.h"
#import <Masonry/Masonry.h>


#define KHeight 300

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *m_TableView;

@property (nonatomic,strong) XFNavigationBar *navBar;

@property (nonatomic,strong) UIImageView *m_headerView;

@property (nonatomic,assign) CGFloat lastOffsetY;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.lastOffsetY = - KHeight;
    
    [self.view addSubview:self.m_TableView];
    
    [self.view addSubview:_navBar];
    
    [self configUI];
    
}

- (void)configUI{
    [self.m_TableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(0);
    }];
    
    [self.m_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(0);
        make.width.mas_equalTo(375);
        make.top.mas_equalTo(-KHeight);
        make.height.mas_equalTo(KHeight);
    }];
    
    [self.navBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(64);
    }];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.navigationController.navigationBar setHidden:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%zd行",indexPath.row];
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //  向下是负数  向上是正数
    CGFloat offsetY = scrollView.contentOffset.y + KHeight;
    
    NSLog(@"%@",NSStringFromCGRect(self.m_headerView.frame));
    
    NSLog(@"%f",offsetY);
    
    
    
    CGFloat delta =  ((offsetY / 300 )> 0.5) ? offsetY / 300 : 0;
    if (offsetY < 0 ) {
        // 下啦
        [self.m_headerView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(KHeight + fabs(offsetY));
            make.top.mas_equalTo(offsetY-KHeight);
        }];
        
    }else{
        
        self.navBar.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:delta];
       
        
        if (delta > 0.5) {
             [self.navBar.backBtn setImage:[UIImage imageNamed:@"Group"] forState:UIControlStateNormal];
        }else{
             [self.navBar.backBtn setImage:[UIImage imageNamed:@"icon 返回 白"] forState:UIControlStateNormal];
        }
    }
    
    
    
    
}


- (UITableView *)m_TableView{
    if(!_m_TableView){
        _m_TableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _m_TableView.delegate = self;
        _m_TableView.dataSource = self;
        [_m_TableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _m_TableView.contentInset = UIEdgeInsetsMake(KHeight-20, 0, 0, 0);
        _m_TableView.contentOffset = CGPointMake(0, -(KHeight-20));
        [_m_TableView addSubview:self.m_headerView];
    }
    return _m_TableView;
}

- (XFNavigationBar *)navBar{
    if(!_navBar){
        _navBar = [[XFNavigationBar alloc] init];
        _navBar.backgroundColor = [UIColor clearColor];
        
    }
    return _navBar;
}

- (UIImageView *)m_headerView{
    if(!_m_headerView){
        _m_headerView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _m_headerView.image = [UIImage imageNamed:@"headerImg.jpg"];
        _m_headerView.contentMode = UIViewContentModeScaleAspectFill;
        _m_headerView.clipsToBounds = YES;
    }
    return _m_headerView;
}

@end
