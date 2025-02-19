#include <string>

const
    {
    Clubs = 0,
    Diamonds,
    Hearts,
    Spades,
    /* ----- */
    CardSuits
    }

const CardTypes = 13
const TotalCards = CardSuits * CardTypes

#define CardDescription[
    .CardName{10},
    .CardSuit,
    .CardValue,
    ]

var CardNames[CardTypes]{} = [ "Ace", "Two", "Three", "Four", "Five",
                               "Six", "Seven", "Eight", "Nine", "Ten",
                               "Jack", "Queen", "King" ]
var CardValues[CardTypes]  = [ 11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10 ]

@start()
    {
    var Cards[ TotalCards ][ CardDescription ]

    /* fill in the cards */
    for (var suit = 0; suit < CardSuits; suit++)
        {
        for (var card = 0; card < CardTypes; card++)
            {
            var index = suit*CardTypes + card
            strpack Cards[ index ].CardName, CardNames[ card ]
            Cards[ index ].CardSuit = suit
            Cards[ index ].CardValue = CardValues[ card ]
            }
        }

    /* shuffle the cards (swap an arbitrary number of randomly selected cards) */
    for (var iter = 0; iter < 200; iter++)
        {
        var first = random(TotalCards)
        var second = random(TotalCards)
        var TempCard[ CardDescription ]
        TempCard = Cards[ first ]
        Cards[ first ] = Cards[ second ]
        Cards[ second ] = TempCard
        }

    /* print the cards with a subroutine */
    for (var card = 0; card < TotalCards; card++)
        PrintCard Cards[ card]
    }

PrintCard( TheCard[ CardDescription ] )
    {
    var SuitNames[ CardSuits ]{} = [ "Clubs", "Diamonds",
                                     "Hearts", "Spades" ]

    printf "%s of %s (valued %d)\n",
           TheCard.CardName,
           SuitNames[ TheCard.CardSuit ],
           TheCard.CardValue
    }

