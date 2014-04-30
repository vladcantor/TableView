//
//  CodeWrittenViewController.m
//  TableView
//
//  Created by Macos on 4/17/14.
//  Copyright (c) 2014 macos. All rights reserved.
//

#import "CodeWrittenViewController.h"

@interface CodeWrittenViewController (){
    
}

@property (nonatomic) NSTimer* tickSlideShow;
@property (nonatomic) int counter;



@end

@implementation CodeWrittenViewController

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
    
    self.addPicturesutton.userInteractionEnabled = NO;
    self.counter = 0;
    if(self.counter < self.currentAccount.slideshowImages.count){
    [UIView transitionWithView:self.testUIImage duration:0.8 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{[self.testUIImage setImage:[self.currentAccount.slideshowImages objectAtIndex:self.counter]];} completion:^(BOOL finished){self.counter++;}];
    }
//    self.testUIImage.animationImages = [self.currentAccount.slideshowImages copy];
//    self.testUIImage.animationDuration = self.currentAccount.slideshowImages.count * 2;
//    self.testUIImage.animationRepeatCount = 0;
//    [self.testUIImage startAnimating];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handleTick{
    if(self.counter >= self.currentAccount.slideshowImages.count){
        self.counter = 0;
    }
    else{
        [UIView transitionWithView:self.testUIImage duration:0.8 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{ [self.testUIImage setImage:[self.currentAccount.slideshowImages objectAtIndex:self.counter]];} completion:^(BOOL finished){self.counter++;}];
       
        //self.counter++;
    }
}



- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}



-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    //[self.testUIImage stopAnimating];
    [UIView transitionWithView:self.testUIImage duration:0.5 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{self.testUIImage.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];} completion:nil];
    BOOL ok = NO;
    for(UIImage *im in self.currentAccount.slideshowImages)
    if([im image:im isEqualTo:self.testUIImage.image])
    {
        ok = YES;
    }
    if(!ok)
    {
        [self.currentAccount.slideshowImages addObject:self.testUIImage.image];
        self.testUIImage.animationImages = [self.currentAccount.slideshowImages copy];

    }
    self.testUIImage.animationDuration = self.currentAccount.slideshowImages.count*2;
    //[self.testUIImage startAnimating];
    [self.saveDelegate saveDatasFromSlideShow];
    [picker dismissViewControllerAnimated:YES completion:nil];
}



- (void)viewDidAppear:(BOOL)animated{
    self.tickSlideShow = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(handleTick) userInfo:nil repeats:YES];
    
}// Called when the view has been fully transitioned onto the screen. Default does nothing

- (void)viewDidDisappear:(BOOL)animated{
    [self.tickSlideShow invalidate];
}

-(IBAction)takeAPicture:(id)sender{

}


-(IBAction)addPictureToDatas:(id)sender{
    
    UIImagePickerController* uiImgPick = [[UIImagePickerController alloc]init];
    uiImgPick.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    uiImgPick.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    uiImgPick.allowsEditing = NO;
    uiImgPick.delegate = self;
    
    [self presentViewController:uiImgPick animated:YES completion:nil];
    
}
-(IBAction)allowAdding:(id)sender{
    
    self.addPicturesutton.userInteractionEnabled = YES;
   

    
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
