module Styles exposing (stylesheet, Styles(None, PickableCard, SearchInput), Variations(Selected, Hidden))

import Style exposing (Property, style, StyleSheet, prop, hover)
import Color
import Style.Color as Color
import Style.Font as Font
import Style.Border as Border


type Styles
    = None
    | PickableCard
    | SearchInput


type Variations
    = Selected
    | Hidden


fancyBlue : Color.Color
fancyBlue =
    Color.rgba 17 123 206 0.3


monospaceFont : Property s v
monospaceFont =
    prop "font-family" "\"Roboto Mono\", menlo, sans-serif"


elevation2 : Property s v
elevation2 =
    prop "box-shadow" "0 2px 2px 0 rgba(0,0,0,.14), 0 3px 1px -2px rgba(0,0,0,.2), 0 1px 5px 0 rgba(0,0,0,.12)"


elevation8 : Property s v
elevation8 =
    prop "box-shadow" "0 8px 10px 1px rgba(0,0,0,.14), 0 3px 14px 2px rgba(0,0,0,.12), 0 5px 5px -3px rgba(0,0,0,.2)"


stylesheet : StyleSheet Styles Variations
stylesheet =
    Style.styleSheetWith []
        [ style None []
        , style PickableCard
            [ elevation2
            , prop "transition" "box-shadow 333ms ease-in-out 0s, width 150ms, height 150ms, background-color 150ms"
            , monospaceFont
            , Font.size 12
            , Color.background <| Color.rgba 0 0 0 0.03
            , Color.border Color.white
            , Border.all 3
            , Border.solid
            , Border.rounded 2
            , hover
                [ elevation8
                ]
            , Style.variation Hidden
                [ prop "display" "none"
                ]
            , Style.variation Selected
                [ Color.border <| Color.grey
                ]
            ]
        , style SearchInput
            [ Border.all 1
            , Border.solid
            , Color.border <| Color.rgba 0 0 0 0.2
            , monospaceFont
            ]
        ]
