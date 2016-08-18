import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import Graphics.X11.ExtraTypes.XF86  
import System.IO

main = do
    xmproc <- spawnPipe "xmobar"

    xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        -- , modMask = mod4Mask     -- Rebind Mod to the Windows key
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock; xset dpms force off")
        -- Screenshots
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "xfce4-screenshooter")
        -- Volume keys
        , ((0, 0x1008FF11), spawn "amixer set Master 2%-")
        , ((0, 0x1008FF13), spawn "amixer set Master 2%+")
        , ((0, 0x1008FF12), spawn "amixer set Master toggle")
        -- Audio previous. TODO: Figure out a nice way to do this
        -- , ((0, 0x1008FF16), spawn "")
        -- Play/pause.
        -- , ((0, 0x1008FF14), spawn "")
        -- Audio next.
        -- , ((0, 0x1008FF17), spawn "")
        
        -- Brightness keys
        , ((0, xF86XK_MonBrightnessUp),   spawn "xbacklight +10%")
        , ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -10%")
        ]

