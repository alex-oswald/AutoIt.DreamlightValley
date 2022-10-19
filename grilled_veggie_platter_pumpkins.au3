; More coin per pumpkin with a 3 pumpkin platter
; 4115 / 5 = 823
; 2787 /3 = 929

; Display Mode: Windowed
; Resolution: 2560x1440

#include <dreamlight_commands.au3>

$item = "Pumpkin Grilled Veggie Platter"
$quantity = Start($item)

$window = Activate()
$window_top = $window[0]
$window_bottom = $window[1]
$window_left = $window[2]
$window_right = $window[3]

For $i = 1 to $quantity
    Cook($window_left, $window_top)
Next

Func Cook($windowLeft, $windowTop)
    PageDown($windowLeft, $windowTop)
    ; Select pumpkin
    SelectBottomMiddleSlot($windowLeft, $windowTop)
    ; Select pumpkin
    SelectBottomMiddleSlot($windowLeft, $windowTop)
    ; Select pumpkin
    SelectBottomMiddleSlot($windowLeft, $windowTop)
    StartCooking($windowLeft, $windowTop)
EndFunc
