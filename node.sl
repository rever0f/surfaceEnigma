- a=["mage",'rogue','warrior','archer','vampire']
doctype 5
html
  head
    title surfaceEnigma
    script type='text/javascript' src='./gravity/jquery-1.11.1.min.js'
    script type='text/javascript' src='./gravity/arc.js'
    script type='text/javascript' src='./gravity/arc_loader.js'
    script type='text/javascript' src='./se.js'
    script type='text/arc' src='./se.arc' (xjs "a")
    link type='text/css' rel='stylesheet' href='./se.css'
    / = javascript_include_tag \
      'jquery',
      'arc.js'
  body
    - for v in a
      - za=File.file?(v+'-tra.png')?v+'-tra':v
      img#cma.cha src = '#{za}.png' alt='#{v} character' onclick='arc:(xjs "a")'

    / form#blue
      &text#blue
      &text#doom

    #blue aleph
    &button#go value='go' onclick='aev()'
    / script type='text/javascript'
      | alert('doom');
       
