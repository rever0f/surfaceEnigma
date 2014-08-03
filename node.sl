doctype 5
html
  head
    title surfaceEnigma
    / script type='text/javascript' src='./arc-js/arc.min.js'
    script type='text/javascript' src='./jquery-1.11.1.min.js'
    script type='text/javascript' src='./arc-js/arc_loader.js'
    script type='text/javascript' src='./se.js'
    link type='text/css' rel='stylesheet' href='./se.css'
    / = javascript_include_tag \
      'jquery',
      'arc.js'
  body
    img#cmat.cha src='./mage-tra.png' alt='mage character'
    img#cma.cha src='./mage.png' alt='mage character'
    img#cro.cha src='./rogue.png' alt='rogue character'
    img#cwa.cha src='./warrior.png' alt='warrior character'
    img#car.cha src='./archer.png' alt='archer character'
    img#cva.cha src='./vampire.png' alt='vampire character'

    / form#blue
      &text#blue
      &text#doom
