//
//  mapViewController.m
//  demo
//
//  Created by Xu Deng on 4/29/14.
//  Copyright (c) 2014 Xu Deng. All rights reserved.
//

#import "mapViewController.h"
#import "REFrostedViewController.h"

@interface mapViewController ()
- (IBAction)onFilterClick:(id)sender;

@end

@implementation mapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onFilterClick:(id)sender {
    [self.frostedViewController presentMenuViewController];

}
@end
