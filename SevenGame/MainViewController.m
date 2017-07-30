//
//  MainViewController.m
//  SevenGame
//
//  Created by Дмитрий Горбачев on 01.12.16.
//  Copyright © 2016 Дмитрий Горбачев. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()


@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
    [self setNavigationBarTransparent];
}

- (IBAction)startGame:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Знакомы с правилами?" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"Да! Играть и напиться!"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action) {
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             [self performSegueWithIdentifier:@"startGame" sender:self];
                         }];
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"Нет, надо прочитать"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action) {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 [self performSegueWithIdentifier:@"readRules" sender:self];
                             }];
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}
- (void) setNavigationBarTransparent {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
