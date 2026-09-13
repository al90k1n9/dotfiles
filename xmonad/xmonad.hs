import XMonad
import XMonad.Util.EZConfig
import XMonad.Util.EZConfig (mkKeymap)
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Layout.Spacing (spacingRaw, Border(..))

myLayout = spacingRaw True (Border 5 5 5 5) True (Border 5 5 5 5) True $ layoutHook def

myTerminal = "kitty"
main :: IO ()
main = xmonad $ def
 { modMask = mod4Mask --mod4Mask is the windows key
 , layoutHook = myLayout
 , terminal = myTerminal
 , keys = myKeys
 }
-- `additionalKeysP`
--    [ ("M-<Return>", spawn myTerminal)
--    , ("M-p", spawn "dmenu_run")
--    ]
myKeys c = mkKeymap c $
    [ ("M-<Return>", spawn myTerminal)               -- Open terminal
    , ("M-p",        spawn "dmenu_run")               -- Run dmenu
    , ("M-c",      kill)                            -- Close focused window
    , ("M-<Space>",  sendMessage NextLayout)          -- Cycle layouts
    ]
