doctype 5
html
  head
    title surfaceEnigma
    script type="text/javascript" src="./se.js"
    link type="text/css" rel="stylesheet" src="./se.css"
    / = javascript_include_tag \
      "jquery",
      "arc.js"
  body
    img#cmat.cha href="mage-tra.png" alt='mage character'
    img#cma.cha href="mage.png" alt='mage character'
    img#cro.cha href="rogue.png" alt='rogue character'
    img#cwa.cha href="warrior.png" alt='warrior character'
    img#car.cha href="archer.png" alt='archer character'
    img#cva.cha href="vampire.png" alt='vampire character'

    form#blue
      &text#blue
      &text#doom
