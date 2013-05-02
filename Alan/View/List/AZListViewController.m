//
//  AZListViewController.m
//  Alan
//
//  Created by Alan on 2/05/13.
//  Copyright (c) 2013 Alan Zeino. All rights reserved.
//

#import "AZListViewController.h"

#import "AZSection.h"
#import "AZSectionDetailContentList.h"
#import "AZListTableViewCell.h"

@interface AZListViewController ()

@end

@implementation AZListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor colorWithRed:0.94f green:0.25f blue:0.23f alpha:1.00f];
    self.tableView.separatorColor = [UIColor colorWithRed:0.96f green:0.61f blue:0.60f alpha:1.00f];

    [self.tableView registerNib:[UINib nibWithNibName:@"AZListTableViewCell" bundle:nil] forCellReuseIdentifier:@"ListCellIdentifier"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = ((AZSection *)self.sectionDetail.section).title;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((AZSectionDetailContentList *)self.sectionDetail.detail).listObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListCellIdentifier";
    AZListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    AZSectionDetailContentListObject *listObject = ((AZSectionDetailContentList *)self.sectionDetail.detail).listObjects[indexPath.row];
    
    cell.titleLabel.text = listObject.title;
    cell.subtitleLabel.text = listObject.subtitle;
    cell.supplementaryLabel.text = listObject.supplementary;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - UITableViewControllerDelegate

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
}

@end
