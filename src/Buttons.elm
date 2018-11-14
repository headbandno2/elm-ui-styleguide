module Buttons exposing (..)

{-| -}

import Browser
import Html
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Element.Region as Region


white =
    Element.rgb 1 1 1

-- text color
darkGrey =
    Element.rgb255 33 37 41

-- blue
colorPrimary =
    Element.rgb255 0 121 250

-- darker blue
colorPrimaryHover =
    Element.rgb255 0 105 217

-- grey
colorSecondary =
    Element.rgb255 108 117 125

-- grey
colorSecondaryHover =
    Element.rgb255 90 98 104

-- green
colorSuccess =
    Element.rgb255 40 167 69

-- green
colorSuccessHover =
    Element.rgb255 34 140 58
    

-- red
colorDanger =
    Element.rgb255 220 53 69

colorDangerHover =
    Element.rgb255 203 37 53

-- expample
invisibleGrey =
    Element.rgb255 248 249 250

-- purple
colorNavbarBackground = 
    Element.rgb255 86 61 124

-- light grey
colorBorderLight = 
    Element.rgba 0 0 0 0.1


main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }


init =
    { username = ""
    , password = ""
    , agreeTOS = False
    , comment = "Extra hot sauce?\n\n\nYes pls"
    , lunch = Gyro
    , spiciness = 2
    }


type alias Form =
    { username : String
    , password : String
    , agreeTOS : Bool
    , comment : String
    , lunch : Lunch
    , spiciness : Float
    }


type Msg
    = Update Form


update msg model =
    case Debug.log "msg" msg of
        Update new ->
            new


type Lunch
    = Burrito
    | Taco
    | Gyro

edges =
    { top = 0
    , right = 0
    , bottom = 0
    , left = 0
    }

navbarHeight = 64
asideWidth = 192

view model =
    layout
        [ Font.size 16
        , Font.color darkGrey
        -- From bootstrap reboot.css https://getbootstrap.com/docs/4.0/content/reboot/#native-font-stack
        , inFront (
            el
                [ width (px asideWidth)
                , height fill
                , Border.color colorBorderLight
                , Border.widthEach { edges | right = 1 }
                , Background.color white
                ]
                none
            )
        , inFront (
            el 
                [ width fill
                , height (px navbarHeight)
                , Background.color colorNavbarBackground
                ]
                none 
            )
        , paddingEach { edges | top = navbarHeight, left = asideWidth }
        ]
    <|
        column 
            [ width (fill
                    |> maximum 960
                    |> minimum 320
                )
            --, height shrink
            , height (px 4000)
            , alignTop
            , centerX
            , paddingEach { top = 36, left = 48, right = 15, bottom = 16 }
            , spacing 40
            ]
            [ column 
                [ spacing 12
                , width (fill |> maximum 760)
                ] 
                [ el
                    [ Region.heading 1
                    , alignLeft
                    , Font.size 48
                    , Font.light
                    ]
                    (text "Buttons") 
                , paragraph
                    [ alignLeft
                    , Font.size 24
                    , Font.light
                    , spacing 12
                    ]
                    [ (text "Use Bootstrap’s custom button styles for actions in forms, dialogs, and more with support for multiple sizes, states, and more.") ]
                ]

            , column 
                [ spacing 10
                , width (fill |> maximum 760)
                ] 
                [ el
                   [ Region.heading 2
                   , alignLeft
                   , Font.size 32
                   ]
                   (text "Examples")
                , paragraph
                    [ alignLeft ]
                    [ (text "Bootstrap includes several predefined button styles, each serving its own semantic purpose, with a few extras thrown in for more control.") ]
                ]

            , el [ width fill ]
               ( wrappedRow 
                    [ alignLeft
                    , padding 16
                    , Border.width 3
                    , Border.color invisibleGrey
                    , spacing 8
                    , width fill
                    ] 
                    [ Input.button
                        [ Background.color colorPrimary
                        , Font.color white
                        , padding 12
                        , Border.rounded 4
                        , width shrink
                        , mouseOver [ Background.color colorPrimaryHover ]
                        ]
                        { onPress = Nothing
                        , label = text "Primary"
                        }

                    , Input.button
                        [ Background.color colorSecondary
                        , Font.color white
                        , padding 12
                        , Border.rounded 4
                        , width shrink
                        , mouseOver [ Background.color colorSecondaryHover ]
                        ]
                        { onPress = Nothing
                        , label = text "Secondary"
                        }

                    , Input.button
                        [ Background.color colorSuccess
                        , Font.color white
                        , padding 12
                        , Border.rounded 4
                        , width shrink
                        , mouseOver [ Background.color colorSuccessHover ]
                        ]
                        { onPress = Nothing
                        , label = text "Success"
                        }

                    , Input.button
                        [ Background.color colorDanger
                        , Font.color white
                        , padding 12
                        , Border.rounded 4
                        , width shrink
                        , mouseOver [ Background.color colorDangerHover ]
                        ]
                        { onPress = Nothing
                        , label = text "Danger"
                        }
                    ]
                )

            , column 
                [ spacing 20
                , width fill
                ]
                [ column 
                    [ spacing 10
                    , width (fill |> maximum 760) 
                    ] 
                    [ el
                       [ Region.heading 2
                       , alignLeft
                       , Font.size 32
                       ]
                       (text "Outline buttons")
                    , paragraph [ alignLeft ]
                        [ (text "In need of a button, but not the hefty background colors they bring?") ]
                    ]

                , wrappedRow 
                    [ alignLeft
                    , padding 16
                    , Border.width 3
                    , Border.color invisibleGrey
                    , spacing 8
                    , width fill
                    ] 
                    [ Input.button
                        [ Font.color colorPrimary
                        , padding 11
                        , Border.color colorPrimary
                        , Border.width 1
                        , Border.rounded 4
                        , width shrink
                        , mouseOver 
                            [ Background.color colorPrimary
                            , Font.color white
                            , Border.color colorPrimary
                            ]
                        ]
                        { onPress = Nothing
                        , label = text "Primary"
                        }

                    , Input.button
                        [ Font.color colorSecondary
                        , padding 11
                        , Border.color colorSecondary
                        , Border.width 1
                        , Border.rounded 4
                        , width shrink
                        , mouseOver 
                            [ Background.color colorSecondary
                            , Font.color white
                            , Border.color colorSecondary
                            ]
                        ]
                        { onPress = Nothing
                        , label = text "Secondary"
                        }

                    , Input.button
                        [ Font.color colorSuccess
                        , padding 11
                        , Border.color colorSuccess
                        , Border.width 1
                        , Border.rounded 4
                        , width shrink
                        , mouseOver 
                            [ Background.color colorSuccess
                            , Font.color white
                            , Border.color colorSuccess
                            ]
                        ]
                        { onPress = Nothing
                        , label = text "Success"
                        }

                    , Input.button
                        [ Font.color colorDanger
                        , padding 11
                        , Border.color colorDanger
                        , Border.width 1
                        , Border.rounded 4
                        , width shrink
                        , mouseOver 
                            [ Background.color colorDanger
                            , Font.color white
                            , Border.color colorDanger
                            ]
                        ]
                        { onPress = Nothing
                        , label = text "Danger"
                        }
                    ]
                ]

            , column 
                [ spacing 20
                , width fill 
                ]
                [ column [ spacing 10 ]
                    [ el
                       [ Region.heading 2
                       , alignLeft
                       , Font.size 32
                       ]
                       (text "Sizes")
                    , paragraph [ alignLeft ]
                        [ (text "Fancy larger or smaller buttons?") ]
                    ]

                , wrappedRow 
                    [ alignLeft
                    , padding 16
                    , Border.width 3
                    , Border.color invisibleGrey
                    , spacing 8
                    , width fill
                    ] 
                    [ Input.button
                        [ Background.color colorPrimary
                        , Font.color white
                        , padding 16
                        , Border.rounded 5
                        , width shrink
                        , Font.size 20
                        , mouseOver [ Background.color colorPrimaryHover ]
                        ]
                        { onPress = Nothing
                        , label = text "Large"
                        }

                    , Input.button
                        [ Background.color colorPrimary
                        , Font.color white
                        , padding 12
                        , Border.rounded 4
                        , width shrink
                        , mouseOver [ Background.color colorPrimaryHover ]
                        ]
                        { onPress = Nothing
                        , label = text "Normal"
                        }

                    , Input.button
                        [ Background.color colorPrimary
                        , Font.color white
                        , padding 8
                        , Border.rounded 3
                        , width shrink
                        , Font.size 14
                        , mouseOver [ Background.color colorPrimaryHover ]
                        ]
                        { onPress = Nothing
                        , label = text "Small"
                        }
                    ]
                ]
            ]