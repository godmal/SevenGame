//
//  ViewController.m
//  SevenGame
//
//  Created by Дмитрий Горбачев on 30.11.16.
//  Copyright © 2016 Дмитрий Горбачев. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray* array;
@property (strong, nonatomic) NSMutableArray* cardsArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];

    self.cardsArray = [[NSMutableArray alloc] init];
    for (int i=1; i<=36; i++) {
        [self.cardsArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%i.png", i]]];
    }
    
    self.cardsLeft.text = [NSString stringWithFormat:@"Осталось карт - %lu", (unsigned long)[self.cardsArray count]];
    [self observeArray];
    [self addGestureRecognizer];
}

- (void) singleTap {
    [self getRandomCard];
    self.cardsLeft.text = [NSString stringWithFormat:@"Осталось карт - %lu", (unsigned long)[self.cardsArray count]];
    if (self.cardsArray.count == 0) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"emptyArray" object:nil];
    }
}

- (IBAction)readRules:(id)sender {
}

- (void) getRandomCard {
    int index = arc4random() % [self.cardsArray count];
    self.cardImageView.image = [self.cardsArray objectAtIndex:index];
    [self.cardsArray removeObjectAtIndex:index];
}

-(void) checkLefCards {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Игра окончена!" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"Начать заново"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action) {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 [self viewDidLoad];
                             }];
        UIAlertAction* cancel = [UIAlertAction
                                 actionWithTitle:@"Вернуться в меню"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action) {
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                     [self dismissViewControllerAnimated:YES completion:nil];
                                 }];
        [alert addAction:ok];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
}
- (void) addGestureRecognizer {
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap)];
    [self.cardImageView setUserInteractionEnabled:YES];
    [self.cardImageView addGestureRecognizer:singleTap];
}
- (void) observeArray {
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(checkLefCards)
                                                 name: @"emptyArray"
                                               object: nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
