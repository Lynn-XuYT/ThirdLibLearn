//
//  GuideTipViewController.m
//  ThirdLibLearn
//
//  Created by Lynn on 2019/6/26.
//  Copyright © 2019 lynn. All rights reserved.
//

#import "GuideTipViewController.h"
#import "NMGuideTipView.h"

@interface GuideTipViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NMGuideTipView *tipView;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation GuideTipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"test"];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    [self.tableView reloadData];
    [self.tableView layoutIfNeeded];
    
    //    [self performSelector:@selector(show) withObject:nil afterDelay:2];
    [self show];
}

- (void)show {
    NSIndexPath *path = [NSIndexPath indexPathForRow:5 inSection:0];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:path];
    
    self.tipView = [[NMGuideTipView alloc] init];
    [self.tipView showOnView:self.tableView message:@"hahahhahah" targetView:cell.textLabel options:NMGuideTipViewOptionTop | NMGuideTipViewOptionRight duration:5.0];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"test"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",@(indexPath.row)];
    if (indexPath.row == 5) {
        cell.textLabel.backgroundColor = [UIColor yellowColor];
    }
    return cell;
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
