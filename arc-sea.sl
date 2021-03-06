doctype html
html lang="en" 
  head
    meta http-equiv="content-type" content="text/html; charset=UTF-8" 
    meta charset="UTF-8" 
    title Demo: Strange attractor generator

    script type='text/javascript' src='./gravity/jquery-1.11.1.min.js'
    script type='text/javascript' src='./gravity/arc.js'
    script type='text/javascript' src='./gravity/arc_loader.js'
    script type="text/arc" src="./sea-demo.arc" 
      |  (main 0 255 0 0.8 10.0 28.0 (/ 8.0 3.0) 0.01 10000) 
  body
    h1#title Strange attractor generator
    div style="width:1060px;" 
      canvas#c1 width="500" height="500" style="border: 1px solid black; float:left;" 
      div style="float:right;width:550px;margin:0;padding:0;" 
        strong code
        br
        textarea#code style="width:500px;height:250px" readonly="true" 
          | (import arc.time)

            (let last nil
              (def cleanup-line () (= last nil))
              (def draw-line (x y)
              (when last (js-draw-line COLOR car.last cdr.last x y))
                (= last (cons x y))))

              (= timer-id nil)

              (def lorenz (x y z i)
                (draw-line x z)
                (if (> i 0)
                  (= timer-id
                    (set-timer lorenz 5 nil
                      (+ x (* D (* A (- y x))))
                      (+ y (* D (- (* x (- B z)) y)))
                      (+ z (* D (- (* x y) (* C z))))
                      (- i 1)))))

              (def main (r g b a _a _b _c _d n)
                (when timer-id (clear-timer timer-id))
                (cleanup-line)
                (= A _a B _b C _c D _d COLOR (+ "rgba(" r "," g "," b "," a ")"))
                (lorenz 1.0 1.0 1.0 n))
        br
        |  Values: a
        input#a value="10.0" type="text" 
        |  b
        input#b value="28.0" type="text" 
        |  c
        input#c value="2.666" type="text" 

        |  d
        input#d value="0.01" type="text" 
        |  n
        input#n value="10000" type="text" 

        br
        |  Line-color: R
        input#R value="0" type="text" 
        |  G
        input#G value="255" type="text" 
        |  B
        input#B value="0" type="text" 

        |  A
        input#A value="0.8" type="text" 
        br
        input#generate value="generate" type="button" 
        br
        br
    script type="text/javascript" 
      |  var canvas = document.getElementById('c1');

        function reset() {
          var ctx = canvas.getContext('2d');
          ctx.fillStyle = "rgb(0, 0, 0)";
          ctx.fillRect(0, 0, 500, 500);
        }

        var ratio = 10.0;
        var move = { x: 250, y: 0 };
        var X = function(x) { return (x * ratio) + move.x; };
        var Y = function(y) { return (y * ratio) + move.y; };

        // Defining new primitive functions (js-draw-line)
        (new ArcJS.Primitives('user')).define({
          'js-draw-line': [{dot: -1}, function(c, x1, y1, x2, y2) {
            var ctx = canvas.getContext('2d');
            ctx.beginPath();
            ctx.moveTo(X(x1), Y(y1));
            ctx.lineTo(X(x2), Y(y2));
            ctx.strokeStyle = c;
            ctx.lineWidth = 1;
            ctx.stroke();
          }]
        });

        $.ajax({ url: 'demo_at.arc', type: 'get', dataType: 'text' }).success(function(res){ $('#code').val(res); });

        $("#generate").click(function() {
          reset();
          var a = parseFloat($("#a").val());
          var b = parseFloat($("#b").val());
          var c = parseFloat($("#c").val());
          var d = parseFloat($("#d").val());
          var n = parseFloat($("#n").val());
          var R = parseFloat($("#R").val());
          var G = parseFloat($("#G").val());
          var B = parseFloat($("#B").val());
          var A = parseFloat($("#A").val());
          ArcJS.context().evaluate('(main '+R+' '+G+' '+B+' '+A+' '+a+' '+b+' '+c+' '+d+' '+n+')');
        });

        reset(); 
