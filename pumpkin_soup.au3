; Display Mode: Windowed
; Resolution: 2560x1440

#include <dreamlight_commands.au3>

$item = "Pumpkin Soup"
$quantity = Start($item)

$window = Activate()
$window_top = $window[0]
$window_bottom = $window[1]
$window_left = $window[2]
$window_right = $window[3]

; Pick recipe
PickRecipe($window_left, $window_top, 29)

For $i = 1 to $quantity
    Cook($window_left, $window_top)
Next

Func Cook($windowLeft, $windowTop)
    Autofill($windowLeft, $windowTop)
    ; Remove lettuce
    RemoveFourthItem($windowLeft, $windowTop)
    PageDown($windowLeft, $windowTop)
    ; Select onion
    SelectTopMiddleSlot($windowLeft, $windowTop)
    StartCooking($windowLeft, $windowTop)
EndFunc
