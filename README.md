#前言
这是第一次发表自己的博客，一直不知道该写点什么东西，恰巧今天写了个App中比较常见的使用场景，列表页面列表每行显示的数据有限，不能完整的显示所有内容，通过点击UITableViewCell将不能完全展示的内容展示完全，再次点击会继续隐藏部分内容。Demo见：[CellShowAllText](https://github.com/IJTF/CellShowAllText)，效果如图：
![点击cell显示/隐藏全部内容.gif](https://raw.githubusercontent.com/TalkingJourney/CellShowAllText/master/Demo.gif)

#实现思路
1、通过自动布局方式设置UILabel在TableViewCell的位置，必须保证Label的top、left、right、bottom都有约束条件(本例子布局使用[Masonry](https://github.com/SnapKit/Masonry))；
2、在给TableViewCell传入的模型添加一个字段open，标记TableViewCell内容是否打开，如果打开将Label的numberOfLines设置为0，关闭值为1；
```
- (void)setOpen:(BOOL)open
{
    if (open == YES) {
        self.label.numberOfLines = 0;
    } else {
        self.label.numberOfLines = 1;
    }

    [self layoutIfNeeded];
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(8);
        make.left.mas_equalTo(self.contentView.mas_left).offset(8);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-8);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-8);        
    }];
}
```
3、在TableView的代理方法- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath中，更改open的值，并刷新TableView。
```
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    VCObject *object = (VCObject *)self.dataSource[indexPath.row];
    object.open = !object.open;

    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}
```
