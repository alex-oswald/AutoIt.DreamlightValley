; Display Mode: Windowed
; Resolution: 2560x1440

; Ingredients: 825
; Sell Value: 1230

; Stack 100
; Cost: 82,500
; Sell: 123k
; Profix: 40,500

#include <dreamlight_commands.au3>

$item = "Souffle"
$quantity = Start($item)

$window = Activate()
$window_top = $window[0]
$window_bottom = $window[1]
$window_left = $window[2]
$window_right = $window[3]

; Pick Souffle recipe
PickRecipe($window_left, $window_top, 37)

For $i = 1 to $quantity
    Cook($window_left, $window_top)
Next

Func Cook($windowLeft, $windowTop)
    Autofill($windowLeft, $windowTop)
    StartCooking($windowLeft, $windowTop)
EndFunc
