#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>

$gameTitle = "Disney Dreamlight Valley"

Func Start($title)
    If Not WinExists($gameTitle) Then
        MsgBox($MB_OK, $title, $gameTitle & " must be open.")
        Exit
    EndIf

    $result = InputBox($title, "How many " & $title & " do you want to cook? (1-1000)")
    $quantity = Number($result)
    If Not IsNumber($quantity) Then
        MsgBox($MB_OK, $title, "The quantity must be a number. (1-1000)")
        Exit
    EndIf

    If $quantity < 1 Or $quantity > 1000 Then
        MsgBox($MB_OK, $title, "The quantity must be a number. (1-1000)")
        Exit
    EndIf

    Return $quantity
EndFunc

Func Activate()
    WinActivate($gameTitle)
    $handle = WinGetHandle($gameTitle)
    WinSetOnTop($handle, "", 0)

    $window_size = WinGetClientSize($handle)
    $window_position = WinGetPos($handle)

    ;MsgBox($MB_OK, $title, "Window Size Width=" & $window_size[0] & @CRLF & "Window Size Height=" & $window_size[1] & @CRLF & "Window Position X Position=" & $window_position[0] & @CRLF & "Window Position Y Position=" & $window_position[1] & @CRLF & "Window Position Width=" & $window_position[2] & @CRLF & "Window Position Height=" & $window_position[3])

    $window_top = $window_position[1]
    $window_bottom = $window_top + $window_size[1]
    $window_left = $window_position[0]
    $window_right = $window_left + $window_size[0]

    Local $array[4]
    $array[0] = $window_top
    $array[1] = $window_bottom
    $array[2] = $window_left
    $array[3] = $window_right
    return $array
EndFunc

Func PickRecipe($windowLeft, $windowTop, $downScrolls)
    MouseMove($windowLeft + 90, $windowTop + 130)
    Sleep(500)
    MouseClick($MOUSE_CLICK_LEFT)
    Sleep(500)
    MouseMove($windowLeft + 380, $windowTop + 300)
    Sleep(500)
    For $i = 0 to $downScrolls
        MouseWheel($MOUSE_WHEEL_DOWN, 1)
        Sleep(50)
    Next
    Sleep(500)
    MouseClick($MOUSE_CLICK_LEFT)
    Sleep(500)
EndFunc

Func Autofill($windowLeft, $windowTop)
    ; Autofill
    MouseMove($windowLeft + 1925, $windowTop + 1230)
    Sleep(500)
    MouseClick($MOUSE_CLICK_LEFT)
    Sleep(500)
EndFunc

Func StartCooking($windowLeft, $windowTop)
    ; Start cooking
    MouseMove($windowLeft + 1300, $windowTop + 1360)
    Sleep(500)
    MouseClick($MOUSE_CLICK_LEFT)
    Sleep(4000)
    MouseClick($MOUSE_CLICK_LEFT)
    Sleep(1000)
EndFunc

Func RemoveFourthItem($windowLeft, $windowTop)
    MouseMove($windowLeft + 1500, $windowTop + 1130)
    Sleep(500)
    MouseClick($MOUSE_CLICK_LEFT)
    Sleep(500)
EndFunc

Func PageUp($windowLeft, $windowTop)
    MouseMove($windowLeft + 800, $windowTop + 500)
    Sleep(500)
    MouseClick($MOUSE_CLICK_LEFT)
    Sleep(500)
EndFunc

Func PageDown($windowLeft, $windowTop)
    MouseMove($windowLeft + 800, $windowTop + 1030)
    Sleep(500)
    MouseClick($MOUSE_CLICK_LEFT)
    Sleep(500)
EndFunc

Func SelectTopMiddleSlot($windowLeft, $windowTop)
    MouseClickDrag($MOUSE_CLICK_LEFT, $windowLeft + 800, $windowTop + 625, $windowLeft + 1290, $windowTop + 650)
    Sleep(500)
EndFunc

Func SelectBottomMiddleSlot($windowLeft, $windowTop)
    MouseClickDrag($MOUSE_CLICK_LEFT, $windowLeft + 800, $windowTop + 910, $windowLeft + 1290, $windowTop + 650)
    Sleep(500)
EndFunc
