//
//  ViewController.m
//  SuperHeropedia
//
//  Created by Taylor Wright-Sanson on 10/13/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "SuperHeroesViewController.h"

@interface SuperHeroesViewController () <UITableViewDelegate, UITableViewDataSource>

@property NSDictionary *supermanDictionary;

@end

@implementation SuperHeroesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.supermanDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"Superman", @"name", @"Krypton", @"home", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [self.supermanDictionary objectForKey:@"name"];
    cell.detailTextLabel.text = [self.supermanDictionary objectForKey:@"home"];
    return cell;
}

@end
