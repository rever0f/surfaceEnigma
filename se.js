// se.js
//
// author rever0f
//
// 20140803
//
// translator from arc to js

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
  'xjs': [{dot: -1}, function xjs(funcCall) {
    var fc=funcCall;
    alert(typeof(fc));
    if(fc instanceof Array)
        alert('mess');
    alert(fc instanceof Array);
  }]
});
