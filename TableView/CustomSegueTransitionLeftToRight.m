//
//  CustomSegueTransitionLeftToRight.m
//  TableView
//
//  Created by Macos on 4/24/14.
//  Copyright (c) 2014 macos. All rights reserved.
//

#import "CustomSegueTransitionLeftToRight.h"
#import "MyTableViewController.h"
#import "MessangerViewController.h"

@interface CustomSegueTransitionLeftToRight()
@property (strong, nonatomic) UIDynamicAnimator *animator;

@end

@implementation CustomSegueTransitionLeftToRight

//-(id)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination{
//    if(self = [super initWithIdentifier:identifier source:source destination:destination]){
//        MyTableViewController *mytbvc = [self sourceViewController];
//        MessangerViewController *messVC = [self destinationViewController];
//        self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:mytbvc.view];
//        [mytbvc addChildViewController:messVC];
//        [messVC didMoveToParentViewController:mytbvc];
//        messVC.view.frame = CGRectMake(0,-mytbvc.view.bounds.size.height, mytbvc.view.bounds.size.width, mytbvc.view.bounds.size.height);
//        //[mytbvc.view addSubview:messVC.view];
//       
//    }
//    return self;
//}

-(void)perform{
    MyTableViewController *mytbvc = [self sourceViewController];
    self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:mytbvc.view];

    
//    CATransition *trans = [CATransition animation];
    UIGravityBehavior *gb = [[UIGravityBehavior alloc] initWithItems:@[[self.destinationViewController view]]];
    //gb.angle = M_PI;
    [self.animator addBehavior:gb];
    UICollisionBehavior *collide = [[UICollisionBehavior alloc]initWithItems:@[[self.destinationViewController view]]];
    CGPoint left = CGPointMake(self.animator.referenceView.bounds.origin.x,self.animator.referenceView.bounds.origin.y + self.animator.referenceView.bounds.size.height);
    CGPoint right = CGPointMake(self.animator.referenceView.bounds.origin.x  + self.animator.referenceView.bounds.size.width,self.animator.referenceView.bounds.origin.y + self.animator.referenceView.bounds.size.height);
    [collide addBoundaryWithIdentifier:@"bottom" fromPoint:left toPoint:right];
    [collide setCollisionDelegate:self.sourceViewController];
    [self.animator addBehavior:collide];
}

@end
