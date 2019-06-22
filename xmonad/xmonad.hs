import XMonad 
--import XMonad.Layout.Magnifier

main = xmonad $ def 
    { borderWidth       = 5
    , terminal          = "urxvt"
    , normalBorderColor = "#cccccc"
    , focusedBorderColor = "#cd8b00"}
 --   , layoutHook = MyLayout
 --   }

--MyLayout = magifier 1.5
