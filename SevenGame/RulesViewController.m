//
//  TestViewController.m
//  SevenGame
//
//  Created by Dima Gorbachev on 28.04.17.
//  Copyright © 2017 Дмитрий Горбачев. All rights reserved.
//

#import "RulesViewController.h"

@interface RulesViewController ()
- (IBAction)backButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray* rulesArray;
@end

@implementation RulesViewController {
    NSArray* imagesRules;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _rulesArray = @[@"Игрок, вытянувший карту, пьет",
                   @"Игроки по очереди (начинает тот, который вытянул карту) считают вслух от 1, пропуская все числа содержащие 7 и кратные 7. Кто ошибся - пьет",
                   @"Все игроки пьют, кроме того, кто вытянул карту",
                   @"Игрок, вытянувший карту, выбирает тему перечислений (например, марки автомобилей) и называет первый пример. Кто не может продолжить ряд перечислений - пьет.",
                   @" На ЛЮБЫЕ вопросы человека, кто вытянул 10, отвечать нельзя. Тот, кто ответил - пьет. Отвечать нельзя до тех пор, пока другой игрок не вытянет 10.",
                   @"Игрок, вытянувший карту, придумывает движение, которое должны исполнять игроки перед тем, как выпить. Кто не выполнил - пьет. Движения суммируются и исполняются по порядку. Кто ошибся - пьет.",
                   @"Все игроки должны поднять любую руку вверх, кто поднял последний - пьет.",
                   @"Игрок, вытянувший карту, привязывает к себе другого игрока, который обязан пить тогда, когда пьет игрок, привязавший его.",
                   @"Все игроки пьют."];
    
    imagesRules = @[[UIImage imageNamed:@"7.png"],
                    [UIImage imageNamed:@"11.png"],
                    [UIImage imageNamed:@"15.png"],
                    [UIImage imageNamed:@"19.png"],
                    [UIImage imageNamed:@"23.png"],
                    [UIImage imageNamed:@"27.png"],
                    [UIImage imageNamed:@"31.png"],
                    [UIImage imageNamed:@"35.png"],
                    [UIImage imageNamed:@"3.png"]
                    ];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_rulesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.label.text = [_rulesArray objectAtIndex:indexPath.row];
    cell.imageView.image = [imagesRules objectAtIndex:indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)backButton:(id)sender {
     [self dismissViewControllerAnimated:YES completion:nil];
}
@end
