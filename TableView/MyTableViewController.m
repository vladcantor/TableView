//
//  MyTableViewController.m
//  TableView
//
//  Created by Macos on 4/14/14.
//  Copyright (c) 2014 macos. All rights reserved.
//

#import "MyTableViewController.h"
#import "Account.h"
#import "MyViewController.h"
#import "AddAccountViewController.h"
#import "TransitionFromMyTableViewToMessenger.h"




@interface MyTableViewController ()

@end

@implementation MyTableViewController{
    NSMutableArray* _datas;
    NSMutableArray* _firstDatas;
    NSUserDefaults* _ud ;
   
   
      int _currentIndex;
    NSIndexPath* currentIndexPath;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _ud = [NSUserDefaults standardUserDefaults];
    self.datas = [[NSMutableArray alloc]init];
    self.firstDatas = [[NSMutableArray alloc]init];
    currentIndexPath = [[NSIndexPath alloc]init];
    
//   Account* acc1 = [[Account alloc] initName: @"Vlad" :@"/Users/macos/Downloads/defaultImage.jpg"] ;
//   Account* acc2 = [[Account alloc]initName:@"Marius":@"/Users/macos/Downloads/defaultImage.jpg"];
//    Account* acc3 = [[Account alloc]initName:@"Tamas":@"/Users/macos/Downloads/defaultImage.jpg"];
//   [self.firstDatas addObject:acc1];
//   [self.firstDatas addObject:acc2] ;
//  [self.firstDatas addObject:acc3];
//   self.datas = [self.firstDatas mutableCopy];
//  [self saveDatas];
//  [self saveFirstData];
    
    
        
    //[self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"MyTableViewCell"];
    
    
    
    [self loadDatas];
    [self loadFirstData];
   
    // Uncomment the following line to preserve selection between presentations.
////    // self.clearsSelectionOnViewWillAppear = NO;
////    
////    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
////    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)newAccountEdit:(Account *)acc{
    [self.datas addObject:acc];
    [self.tableView reloadData];
    [self saveDatas];
}
-(BOOL)saveFirstData{
   
    [_ud setObject:[NSKeyedArchiver archivedDataWithRootObject:self.firstDatas] forKey:@"firstData"];
    if([_ud synchronize])
        return YES;
    return NO;
}

-(BOOL)loadFirstData{
    self.firstDatas = [NSKeyedUnarchiver unarchiveObjectWithData:[_ud objectForKey:@"firstData" ]];
    return YES;
}
-(IBAction)reloadFirstData:(id)sender{
    self.datas = [self.firstDatas mutableCopy];
    [self saveDatas];
    [self.tableView reloadData];
}

-(IBAction)addAccount:(id)sender{
        [self performSegueWithIdentifier:@"addPhotoSegue" sender:self];
}

-(BOOL)saveDatas{
    [_ud setObject:[NSKeyedArchiver archivedDataWithRootObject:self.datas] forKey:@"datas"];
    if([_ud synchronize])
    {
        [self.tableView reloadData];
        return YES;
    }
    [self.tableView reloadData];
    return NO;
    
}
-(BOOL)loadDatas{
    self.datas =  [NSKeyedUnarchiver unarchiveObjectWithData:[_ud objectForKey:@"datas" ]];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.datas count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellIdentifier = @"tableviewCell";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    [cell setUserInteractionEnabled:YES];
    [cell performSwipeLeftGesture];
    cell.cellLabelForName.text = [[self.datas objectAtIndex:indexPath.row] name];
    cell.cellImageView.image = [[self.datas objectAtIndex:indexPath.row] accountImage];
    cell.cuurentIndexInTableView = indexPath.row;
    cell.currentIndexPath = indexPath;
    cell.gestureDelegate = self;
    return cell;
}







- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _currentIndex = indexPath.row;

    
    [self performSegueWithIdentifier:@"detailsSegue" sender:self];

}
-(UIStoryboardSegue*)segueForIdentifier:(NSString*)identifier{
    NSString* destIdentifier;
    UIStoryboardSegue* segue ;
    if([identifier isEqualToString:@"detailsSegue"])
    {
        destIdentifier = @"MyViewController";

    }else if([identifier isEqualToString:@"addPhotoSegue"]){
        destIdentifier = @"addAccountView";
       
    }else if([identifier isEqualToString:@"messageSegue"]){
        destIdentifier = @"messangerNav";
        
    }
    segue = [[UIStoryboardSegue alloc]initWithIdentifier:identifier source:self destination:[self.storyboard instantiateViewControllerWithIdentifier:destIdentifier]];
    return segue;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{

    return YES;
}
-(NSString*)tableView:(UITableView*)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return @"Delete";
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.datas removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
        [self saveDatas];
    }
}




-(void)userMadeLeftSwipe:(int)currentIndex :(BOOL)hasPan{
    if(hasPan == YES)
    {
        _currentIndex = currentIndex;
        [self performSegueWithIdentifier:@"afterGestureSegue" sender:self];

    }
}
-(void)userWantsToSendMessages:(int)currentIndex{
    _currentIndex = currentIndex;
    [self performSegueWithIdentifier:@"messageSegue" sender:self];
}


-(BOOL)saveDatasFromMyViewController{
    [self saveDatas];
    return YES;
}
-(void)saveDatasFromSlideShow{
    [self saveDatas];
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
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
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


//#pragma mark - Navigation addPhotoSegue
#pragma mark UINavigationControllerDelegate methods

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    // Check if we're transitioning from this view controller to a DSLSecondViewController
    if (fromVC == self && [toVC isKindOfClass:[MessangerViewController class]]) {
        return [[TransitionFromMyTableViewToMessenger alloc] init];
    }
    else {
        return nil;
    }
}


#pragma mark UIViewController methods

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Set outself as the navigation controller's delegate so we're asked for a transitioning object
    self.navigationController.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // Stop being the navigation controller's delegate
    if (self.navigationController.delegate == self) {
        self.navigationController.delegate = nil;
    }
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"detailsSegue"]){
        MyViewController* myViewCont = segue.destinationViewController;
        [myViewCont setCurrentAccount:[self.datas objectAtIndex:_currentIndex]];
        [myViewCont setDelegate:self];
    }else if ([segue.identifier isEqualToString:@"addPhotoSegue"]){
        AddAccountViewController* myViewCont = segue.destinationViewController;
        
        [myViewCont setDelegate:self];
    }else if([segue.identifier isEqualToString:@"afterGestureSegue"])
    {
        CodeWrittenViewController* myViewCont = segue.destinationViewController;
        [myViewCont setCurrentAccount:[self.datas objectAtIndex:_currentIndex]];
        myViewCont.saveDelegate = self;
        
    }else if([segue.identifier isEqualToString:@"messageSegue"]){
        MessangerViewController* mess = segue.destinationViewController;
        [mess setCurrentAccount:[self.datas objectAtIndex:_currentIndex]];
        self.dropSegue = segue;
        
        
    }
   
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
