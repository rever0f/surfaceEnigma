// se.js
//
// author rever0f
//
// 20140803
//
// translator from arc to js

// alert('aleph');

// cross over arc to javascript
//
// parameters
//
// a-function call array is an function indexed
//   list the elements being the argument calls
//   only goes one level deep
//
// return
//
// function return array with error object of
// indexed strings on error
(new ArcJS.Primitives('user')).define({
  'xjs': [{dot: -1}, function(funcCall) {
      var elblue=document.getElementById('blue');
    // var fc=funcCall;
    // alert(typeof(fc));
    // if(fc instanceof Array)
    //     alert('mess');
    // alert(fc instanceof Array);
      alert('cookie');
      elblue.innerHTML='cookie';
  }]
});

// alert('brave-js');

// conkeror needs a jumpstart
function aev() {
    if (!ArcJS) return;
    // alert('a');
    if (!ArcJS.context) return;
    // alert('b');
    if (!ArcJS.context().evaluate) return;
    // alert('c');
    // ArcJS.context().evaluate('(= b 1)');
    ArcJS.context().evaluate('(xjs "a")');
    // todo get a function defined
    ArcJS.context().evaluate('(a)');
    // alert('a');
}

function gbutton() {
    ArcJS.context().evaluate('(a)');
    alert('aleph');
}
