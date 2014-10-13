//
//  ViewController.m
//  SuperHeropedia
//
//  Created by Taylor Wright-Sanson on 10/13/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "SuperHeroesViewController.h"

@interface SuperHeroesViewController () <UITableViewDelegate, UITableViewDataSource>

@property NSArray *superHeroes;

@end

@implementation SuperHeroesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *supermanDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"Superman", @"name", @"Krypton", @"home", nil];
    self.superHeroes = [NSArray arrayWithObjects:supermanDictionary, supermanDictionary, nil];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.superHeroes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    NSDictionary *superHeroDictionary = [self.superHeroes objectAtIndex:indexPath.row];
    cell.textLabel.text = [superHeroDictionary objectForKey:@"name"];
    cell.detailTextLabel.text = [superHeroDictionary objectForKey:@"home"];
    return cell;
}

@end
