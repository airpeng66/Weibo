//
//  WBNewFeatureViewController.m
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/8/24.
//  Copyright © 2018 曹鹏. All rights reserved.
//

#import "WBNewFeatureController.h"
#import "WBNewFeatureViewCell.h"

@interface WBNewFeatureController ()

@property (nonatomic, weak)UIPageControl *control;

@end

@implementation WBNewFeatureController

static NSString * const reuseIdentifier = @"Cell";


-(instancetype)init{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return [super initWithCollectionViewLayout:layout];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[WBNewFeatureViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    // Do any additional setup after loading the view.
    [self setPageControl];
}

- (void)setPageControl{
    UIPageControl *control = [[UIPageControl alloc]init];
    
    control.numberOfPages = 4;
    control.pageIndicatorTintColor = [UIColor blackColor];
    control.currentPageIndicatorTintColor = [UIColor redColor];
    
    control.center = CGPointMake(self.view.width * 0.5, self.view.height);
    _control = control;
    [self.view addSubview:control];
}

#pragma mark UIScrollView delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int page = scrollView.contentOffset.x / scrollView.bounds.size.width + 0.5;
    _control.currentPage = page;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WBNewFeatureViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    NSString *imageName = [NSString stringWithFormat:@"new_feature_%ld",indexPath.row+1];
    NSLog(@"%@",imageName);
    cell.image = [UIImage imageNamed:imageName];
    [cell setIndexPath:indexPath count:4];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
