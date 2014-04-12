//
//  EventCandidatesCollectionViewController.m
//  demo
//
//  Created by Tom on 4/11/14.
//  Copyright (c) 2014 Xu Deng. All rights reserved.
//

#import "EventCandidatesCollectionViewController.h"
#import "CandidateCollectionViewCell.h"

@interface EventCandidatesCollectionViewController ()
@property NSMutableArray *candidates;
@end

@implementation EventCandidatesCollectionViewController

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
	self.candidates = [NSMutableArray arrayWithArray:@[@"Alice", @"Bob", @"Charlie", @"Dick"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
	return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return [self.candidates count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
				  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	CandidateCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"CandidateCell"
																					   forIndexPath:indexPath];
//	cell.image.i
	cell.nameLabel.text = [self.candidates objectAtIndex:indexPath.item];
	return cell;
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

@end