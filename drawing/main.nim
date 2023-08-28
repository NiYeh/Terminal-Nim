import os, random
import illwill

var
  gBufferStars = newTerminalBuffer(terminalWidth(), terminalHeight())
  num1:int = 0
  num2:int = 1
  num3:int = 2
  num4:int = 3
  num5:int = 4
  num6:int = 5
  textnum:int = 0

  colorArr:array = [fgWhite, fgYellow, fgBlue, fgRed, fgMagenta, fgGreen, fgCyan]
  textArr:array = ["我是 IKUN", "社會我坤哥", "你幹嘛哎呦", "只因你太美", "拒絕小黑子"]

# ===================================== IKUN
proc updataScreen(tb:var TerminalBuffer) =

  tb.copyFrom(gBufferStars)

  tb.setForegroundColor(fgGreen)
  tb.write(0,0, "按Q退出程序")

  tb.setForegroundColor(fgWhite)
  tb.write(0,1, "按I隨機配色")
  tb.setForegroundColor(fgWhite)
  tb.write(10,1, "按K隨機台詞")

  tb.setForegroundColor(fgCyan)
  tb.write(0,2, textArr[textnum])

  tb.setForegroundColor(colorArr[num1])
  tb.write(35,3, "wxz asbc")
  tb.setForegroundColor(colorArr[num1])
  tb.write(34,4, "axbzmvjchd")
  tb.setForegroundColor(colorArr[num1])
  tb.write(34,5, "skzx  smznx")
  tb.setForegroundColor(colorArr[num2])
  tb.write(37,5, "sldnx")
  tb.setForegroundColor(colorArr[num1])
  tb.write(34,6, "skx")
  tb.setForegroundColor(colorArr[num2])
  tb.write(37,6, "zbxmcx")
  tb.setForegroundColor(colorArr[num2])
  tb.write(37,7, "qisox")
  tb.setForegroundColor(colorArr[num3])
  tb.write(36,7, "q")
  
  tb.setForegroundColor(colorArr[num3])
  tb.write(34,8, "  cmflvod") # 9
  tb.setForegroundColor(colorArr[num1])
  tb.write(34,8, "zn") # 2

  tb.setForegroundColor(colorArr[num3])
  tb.write(32,9, "znc  lvodosw") # 11
  tb.setForegroundColor(colorArr[num1])
  tb.write(35,9, "mf") # 2
  tb.setForegroundColor(colorArr[num1])
  tb.write(44,9, "sws") # 3

  tb.setForegroundColor(colorArr[num3])
  tb.write(31,10, "zncmf  odsdn   td") # 12
  tb.setForegroundColor(colorArr[num1])
  tb.write(36,10, "lv") # 2
  tb.setForegroundColor(colorArr[num1])
  tb.write(43,10, "ziw") # 3

  tb.setForegroundColor(colorArr[num3])
  tb.write(30,11, "zncmflv       wtsf") # 11
  tb.setForegroundColor(colorArr[num1])
  tb.write(37,11, "od") # 2
  tb.setForegroundColor(colorArr[num1])
  tb.write(41, 11, "nzi") # 2
  tb.setForegroundColor(colorArr[num4])
  tb.write(39,11, "sd") # 2

  tb.setForegroundColor(colorArr[num3])
  tb.write(29,12, "zncdflvoe    clksjd") # 15
  tb.setForegroundColor(colorArr[num4])
  tb.write(38,12, "srns") # 2

  tb.setForegroundColor(colorArr[num3])
  tb.write(28,13, "zxnc  lvoes  fclksjk") # 16
  tb.setForegroundColor(colorArr[num1])
  tb.write(39, 13, "dn") # 2

  tb.setForegroundColor(colorArr[num3])
  tb.write(28,14, " xnce lvoes  fclksjf") # 16
  tb.setForegroundColor(colorArr[num1])
  tb.write(39, 14, "dn") # 2

  tb.setForegroundColor(colorArr[num3])
  tb.write(28,15, "  nceflvoes  fclksjg") # 16
  tb.setForegroundColor(colorArr[num1])
  tb.write(39, 15, "dn") # 2

  tb.setForegroundColor(colorArr[num3])
  tb.write(28,16, "   ceflvoes  fclksjg") # 15
  tb.setForegroundColor(colorArr[num1])
  tb.write(39, 16, "dn") # 2

  tb.setForegroundColor(colorArr[num3])
  tb.write(29,17, "    eflvoe  clksd") #11
  tb.setForegroundColor(colorArr[num4])
  tb.write(39, 17, "sf") # 2

  tb.setForegroundColor(colorArr[num5])
  tb.write(34,18, "eflvoeclksd") #11

  tb.setForegroundColor(colorArr[num5])
  tb.write(33,19, "eflvoassclksd") #13

  tb.setForegroundColor(colorArr[num5])
  tb.write(32,20, "eflkn     sldkd") #10

  tb.setForegroundColor(colorArr[num5])
  tb.write(31,21, "eflkn       aldkd") #10

  tb.setForegroundColor(colorArr[num5])
  tb.write(30,22, "eflkn         rdksd") #10

  tb.setForegroundColor(colorArr[num5])
  tb.write(30,23, "sflk           sdks") #8

  tb.setForegroundColor(colorArr[num5])
  tb.write(30,24, "dflk           sdks") #8

  tb.setForegroundColor(colorArr[num5])
  tb.write(30,25, "dflk           sdks") #8

  tb.setForegroundColor(colorArr[num5])
  tb.write(30,26, "wflk           sdks") #8

  tb.setForegroundColor(colorArr[num6])
  tb.write(30,27, "flkn           sdks") #8

  tb.setForegroundColor(colorArr[num6])
  tb.write(29,28, "sflkn           sdksf") #8

  tb.setForegroundColor(colorArr[num6])
  tb.write(28,29, "daflkn           sdksgo") #8

# ===================================== 退出程序
proc exitProc() {.noconv.} =
  illwillDeinit();
  showCursor()
  quit(0)

# ===================================== 主函數
proc main() =
  illwillInit(fullscreen=true, mouse=true)
  setControlCHook(exitProc); hideCursor()
  hideCursor()

  var tb = newTerminalBuffer(terminalWidth(), terminalHeight())

  while true:
    var key = getKey()
    case key
      of Key.None:
        discard
      of Key.Q:
        exitProc()
      of Key.I:
        num1 = rand(0..6)
        num2 = rand(0..6)
        num3 = rand(0..6)
        num4 = rand(0..6)
        num5 = rand(0..6)
        num6 = rand(0..6)
      of Key.K:
        textnum = rand(0..4)
      else:
        discard

    tb.updataScreen()
    tb.display()
    sleep(20)

main()
