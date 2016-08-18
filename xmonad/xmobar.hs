Config { font = "xft:Fixed-8"
        , borderColor = "black"
        , bgColor = "#000000"
        , fgColor = "#ffffff"
        , position = Top
        , border = BottomB
        , lowerOnStart     = True  -- send to bottom of window stack on start
        , hideOnStart      = False -- start with window unmapped (hidden)
        , allDesktops      = True  -- show on all desktops
        , overrideRedirect = True  -- set the Override Redirect Flag (xlib)
        , pickBroadest     = False -- choose the widest display (multi-monitor)        
        , persistent       = True  -- enable/disable hiding (True = disabled)
        , template = "%StdinReader% || %multicpu% | %memory% | %dynnetwork% | %battery% }{ %uname% | <fc=#ee9a00>%date%</fc> || %volume%"
        , sepChar = "%"
        , alignSep = "}{"
        , commands = [ Run DynNetwork ["-L","0","-H","32","--normal","green","--high","red"] 10
                     , Run MultiCpu ["-L","3","-H","50","--normal","green","--high","red"] 10
                     , Run Memory ["-t","Mem: <usedratio>%"] 10
                     , Run BatteryP ["BAT0"] ["-l red"] 10
                     , Run Com "uname" ["-s","-r"] "" 36000
                     , Run Date "%a %b %_d %Y %H:%M:%S" "date" 10
                     , Run StdinReader
                     , Run Com "sh" ["/home/slacker/.xmonad/volume.sh"] "volume" 10
                     ]
        }
