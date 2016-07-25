列表页面列表每行显示的数据有限，不能完整的显示所有内容，通过点击UITableViewCell将不能完全展示的内容展示完全，再次点击会继续隐藏部分内容。

# 实现思路
1、通过自动布局方式设置UILabel在TableViewCell的位置，必须保证Label的top、left、right、bottom都有约束条件(本例子布局使用Masonry)；

2、在给TableViewCell传入的模型添加一个字段open，标记TableViewCell内容是否打开，如果打开将Label的numberOfLines设置为0，关闭值为1；

3、在TableView的代理方法- (void)tableView:(UITableView )tableView didSelectRowAtIndexPath:(NSIndexPath )indexPath中，更改open的值，并刷新TableView。
