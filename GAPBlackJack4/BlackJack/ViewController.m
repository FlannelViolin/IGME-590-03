//
//  ViewController.m
//  BlackJack
//
//  Created by Student on 2/20/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "ViewController.h"

static const int kSTART_TAG_DEALER_VIEW = 100;
static const int kSTART_TAG_PLAYER_VIEW = 200;
static const int kNUM_CARDS = 5;
static NSString *kCARD_BACK_IMAGE = @"card-back-236x352.png";

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *standButton;
@property (weak, nonatomic) IBOutlet UIButton *hitButton;

@end

@implementation ViewController{
    GameModel *_gameModel;
    NSMutableArray *_playerCardViews, *_dealerCardViews;
}

-(id) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder: aDecoder];
    if (self) {
        // the brains of the Blackjack game
        _gameModel = [[GameModel alloc] init];
        
        // the card UIImageViews
        _dealerCardViews = [NSMutableArray array];
        _playerCardViews = [NSMutableArray array];
    }
    
    // resister for kNotificationGameDidEnd notification
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(handleNotificationGameDidEnd:)
     name: kNotificationGameDidEnd
     object: _gameModel];
    

    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    // we're doing this to avoid 10 outlets and to    have a scalable solution
    for (int i =0; i< kNUM_CARDS; i++){
        UIView *dealerCardView = [self.view viewWithTag: i +
                                  kSTART_TAG_DEALER_VIEW];
         
        UIView *playerCardView = [self.view viewWithTag: i +
                                  kSTART_TAG_PLAYER_VIEW];
         
        [_dealerCardViews addObject: dealerCardView];
        [_playerCardViews addObject: playerCardView];
    }
    // this will fail i    f either array has less than 5 cards
    NSAssert(_dealerCardViews.count == kNUM_CARDS, @"_dealerCardViews.count=%d",
             _dealerCardViews.count);
              
    NSAssert(_playerCardViews.count == kNUM_CARDS, @"_playerCardViews=%d",
                      _playerCardViews.count);
    
    self.hitButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.hitButton.layer.borderWidth = 1.0;
    self.hitButton.layer.cornerRadius = 20;
    self.hitButton.backgroundColor = [UIColor whiteColor];
    self.standButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.standButton.layer.borderWidth = 1.0;
    self.standButton.layer.cornerRadius = 10;
    self.standButton.backgroundColor = [UIColor whiteColor];
    // uncomment this in the next step
    [self restartGame];
              
}

- (void)updateView{
    PlayingCard *dealerCard;
    PlayingCard *playerCard;
    UIImageView *dealerCardView;
    UIImageView *playerCardView;
    for (int i=0; i<kNUM_CARDS; i++) {
        dealerCardView = _dealerCardViews[i];
        playerCardView = _playerCardViews[i];
        dealerCard = [_gameModel dealerCardAtIndex:i];
        playerCard = [_gameModel playerCardAtIndex:i];
        // hide the UIImageView if there's no card
        dealerCardView.hidden = (dealerCard == nil);
        playerCardView.hidden = (playerCard == nil);
        // get the UIImage for the dealer card
        if (dealerCard && dealerCard.isFaceUp) {
            dealerCardView.image = [dealerCard getCardImage];
        }
        else {
            dealerCardView.image = [UIImage imageNamed: kCARD_BACK_IMAGE];
        }
        // get the UIImage for the player card
        if (playerCard && playerCard.isFaceUp) {
            playerCardView.image = [playerCard getCardImage];
        }
        else {
            playerCardView.image = [UIImage imageNamed: kCARD_BACK_IMAGE];
        }
    }
}


- (void)restartGame{
    [_gameModel dealNewHand];
    PlayingCard *card;
    card = [_gameModel drawPlayerCard];
    card.isFaceUp = YES;
    card = [_gameModel drawDealerCard];
    card.isFaceUp = YES;
    card = [_gameModel drawPlayerCard];
    card.isFaceUp = YES;
    [_gameModel drawDealerCard];
    // uncomment this in the next step
    [self updateView];
    self.standButton.enabled = self.hitButton.enabled = YES;
    

}
              
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)playDealerTurn {
    self.standButton.enabled = self.hitButton.enabled = NO;
    [self performSelector:@selector(showSecondDealerCard)
               withObject:nil afterDelay:0.8];
}


-(void)showSecondDealerCard{
    PlayingCard *card = [_gameModel lastDealerCard];
    card.isFaceUp = YES;
    [self updateView];
    [_gameModel updateGameStage];
    if (_gameModel.gameStage != kGameStageGameOver) {
        [self performSelector:@selector(showNextDealerCard)
                   withObject:nil afterDelay:0.8];
    }
}

-(void) showNextDealerCard{
    //next card
    PlayingCard *card = [_gameModel drawDealerCard];
    card.isFaceUp = YES;
    [self updateView];
    [_gameModel updateGameStage];
    if (_gameModel.gameStage != kGameStageGameOver) {
        [self performSelector:@selector(showNextDealerCard)
                   withObject:nil afterDelay:0.8];
    }
}
#pragma mark - Actions
- (IBAction)hitButtonTapped:(id)sender {
    NSLog(@"%s",__FUNCTION__);
    PlayingCard *card = [_gameModel drawPlayerCard];
    card.isFaceUp = YES;
    [self updateView];
    [_gameModel updateGameStage];
    if (_gameModel.gameStage == kGameStageDealer) {
        [self playDealerTurn];
    }
}

- (IBAction)standButtonTapped:(id)sender {
    NSLog(@"%s",__FUNCTION__);
    _gameModel.gameStage = kGameStageDealer;
    [self playDealerTurn];
}

#pragma mark - Notifications
-(void) handleNotificationGameDidEnd:(NSNotification *)notification{
    NSDictionary *userInfo = notification.userInfo;
    NSNumber *num = userInfo[@"didDealerWin"];
    NSString *message = [num boolValue] ? @"Dealer won!" : @"You won!";
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Game Over"
                          message:message
                          delegate:self
                          cancelButtonTitle:nil
                          otherButtonTitles:@"Play Again", nil];
    
    [alert show];
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:
(NSInteger)buttonIndex{
    [self restartGame];
}

@end
