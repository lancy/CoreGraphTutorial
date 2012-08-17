//
//  MasterViewController.m
//  CoolTable
//
//  Created by Lancy on 17/8/12.
//  Copyright (c) 2012 Lancy. All rights reserved.
//

#import "MasterViewController.h"
#import "CustomCellBackground.h"

#import "DetailViewController.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
	// Do any additional setup after loading the view, typically from a nib.

    self.title = @"Core Graphics 101";
    self.thingsToLearn = [NSMutableArray arrayWithObjects:@"Drawing Rects",
                          @"Drawing Gradients", @"Drawing Arcs", nil];
    self.thingsLearned = [NSMutableArray arrayWithObjects:@"Table Views",
                          @"UIKit", @"Objective-C", nil];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    [self setThingsLearned:nil];
    [self setThingsToLearn:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [self.thingsToLearn count];
    }
    else {
        return [self.thingsLearned count];
    }
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Things We'll Learn";
    } else {
        return @"Things Already Covered";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.backgroundView = [[CustomCellBackground alloc] init];
    cell.selectedBackgroundView = [[CustomCellBackground alloc] init];

    NSString *entry;
    if (indexPath.section == 0) {
        entry = [_thingsToLearn objectAtIndex:indexPath.row];
    } else {
        entry = [_thingsLearned objectAtIndex:indexPath.row];
    }
    cell.textLabel.text = entry;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = [_objects objectAtIndex:indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
