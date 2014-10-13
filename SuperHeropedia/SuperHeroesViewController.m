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
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SuperHeroesViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURL *url = [NSURL URLWithString:@"https://s3.amazonaws.com/mobile-makers-lib/superheroes.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        NSError *jsonError;
        self.superHeroes = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

        if (connectionError != nil)
        {
            NSLog(@"Connection error: %@", connectionError.localizedDescription);
        }
        if (jsonError != nil)
        {
            NSLog(@"JSON error: %@", jsonError.localizedDescription);
        }

        [self.tableView reloadData];
    }];
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
    cell.detailTextLabel.text = [superHeroDictionary objectForKey:@"description"];
    return cell;
}

@end
