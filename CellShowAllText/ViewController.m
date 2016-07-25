//
//  ViewController.m
//  text
//
//  Created by 江涛 on 16/7/13.
//  Copyright © 2016年 jiangtao. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "VCTableViewCell.h"

@interface VCObject : NSObject

@property (nonatomic, assign) BOOL open;

@end

@implementation VCObject

@end

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(self.view);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VCTableViewCell *cell = [[VCTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    VCObject *object = (VCObject *)self.dataSource[indexPath.row];
    cell.open = object.open;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

    - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
    {
        VCObject *object = (VCObject *)self.dataSource[indexPath.row];
        object.open = !object.open;
        
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }

- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = @[[VCObject new], [VCObject new], [VCObject new], [VCObject new], [VCObject new], [VCObject new], [VCObject new], [VCObject new], [VCObject new], [VCObject new]];
    }
    return _dataSource;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.estimatedRowHeight = 44;
    }
    return _tableView;
}

@end
