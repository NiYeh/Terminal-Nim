import illwill
import os, random

var
  tb = newTerminalBuffer(terminalWidth(), terminalHeight()) 
  colorArr = [fgWhite, fgYellow, fgCyan]

  boxColor:int = 1
  colorArr2 = [fgRed, fgBlue, fgGreen]
  gBufferStars = newTerminalBuffer(terminalWidth(), terminalHeight())

  gBox = newTerminalBuffer(13, 7)
  posX = 9
  posY = 9

# =========================== 結束進程
proc exitProc() {.noconv.} =
  illwillDeinit();
  showCursor()
  quit(0)

# =========================== 繪製圖案
proc drawBox(tb:var TerminalBuffer) =
  tb.copyFrom(gBox, 0, 0, gBox.width, gBox.height, posX, posY, transparency=true)

  gBox.setForegroundColor(colorArr2[boxColor])
  gBox.drawRect(0, 0, gBox.width-1, gBox.height-1)
  gBox.setForegroundColor(fgYellow)
  gBox.write(1, 1, "+=========+")
  gBox.setForegroundColor(fgYellow)
  gBox.write(1, 3, "=====+=====")
  gBox.setForegroundColor(fgYellow)
  gBox.write(1, 5, "+=========+")


# =========================== 畫星星
proc drawStar(tb:var TerminalBuffer) =
  var num:int = rand(0..2)
  let s = if rand(0..20) == 1:"*" else: ""
  let (x,y) = (rand(tb.width-1), rand(tb.height-1))

  gBufferStars.setForegroundColor(colorArr[num])
  gBufferStars.write(x, y, s)

  tb.copyFrom(gBufferStars)

  tb.setForegroundColor(fgGreen)
  tb.write(0,0, "按q退出程序")
  tb.write(0,1, "按r切換成紅色")
  tb.write(0,2, "按b切換成藍色")
  tb.write(0,3, "按g切換成綠色")
  tb.setForegroundColor(fgWhite)

# =========================== 主函數
proc main() =
  illwillInit(fullscreen=true, mouse=true)
  setControlCHook(exitProc)
  hideCursor()

  while true:
    var key = getKey()
    case key
      of Key.None:
        discard
      of Key.Escape, Key.Q:
        exitProc()
      of Key.A:
        posX = max(posX-1, 0)
      of Key.D:
        posX = min(posX+1, tb.width-1)
      of Key.W:
        posY = max(posY-1, 0)
      of Key.S:
        posY = min(posY+1, tb.height-1)
      of Key.R:
        boxColor = 0
        gBox.setForegroundColor(colorArr2[boxColor])
      of Key.B:
        boxColor = 1
        gBox.setForegroundColor(colorArr2[boxColor])
      of Key.G:
        boxColor = 2
        gBox.setForegroundColor(colorArr2[boxColor])
      else: discard

    tb.drawStar()
    tb.drawBox()

    tb.display()
    sleep(20)

main()
