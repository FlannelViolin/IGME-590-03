//
//  BlackJackTests.m
//  BlackJackTests
//
//  Created by Student on 2/20/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PlayingCard.h"
@interface BlackJackTests : XCTestCase

@end

@implementation BlackJackTests{
    PlayingCard *_playingCard;
    NSMutableArray *_deck;
    PlayingCard *_again;
    
}

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _playingCard = [[PlayingCard alloc] init];
    _again = [[PlayingCard alloc] init];
    _deck = [PlayingCard createDeck];
}
- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}



-(void) testPlayingCard_allocInit_resultNotNil{
    XCTAssertNotNil(_playingCard, @"playingCard is nil");
}
-(void) testPlayingCard_createDeck_resultNotNil{
    XCTAssertNotNil(_deck, @"_deck is nil");
}

- (void) testPlayingCard_deckLength_52Cards{
    XCTAssertTrue(_deck.count==52,@"_deck.count != 52");
}

-(void) testPlayingCard_setSuit_suitSet{
    _playingCard.value = PlayingCardSuitClub;
    XCTAssertTrue(_playingCard.suit == PlayingCardSuitClub, @"_playingCard.suit propertynot set");
}
-(void) testPlayingCard_setValue_ValueSet{
    _playingCard.value = 10;
    XCTAssertTrue(_playingCard.value == 10, @"_playingCard.suit propertynot set");
}

-(void) testPlayingCard_isAFaceORTenCard_11isaFaceCard{
    _again.value = 11;
    XCTAssertTrue([_again isAFaceOrTenCard],@"card.value of %d is supposed to be a face card", _again.value);
}
@end
