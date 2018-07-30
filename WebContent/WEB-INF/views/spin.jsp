<html>
    <head>
        <title>HTML5 Canvas Winning Wheel</title>
        <link rel="stylesheet" href="assets/one_image_per_segment/main.css" type="text/css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script type="text/javascript" src="assets/js/Winwheel.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenMax.min.js"></script>
        <script src="assets/js/Winwheel.min.js"></script>  		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		 
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div align="center">
            <h1>Winwheel.js example wheel - one image per segment</h1>
            <br />
            <p>Here is an example of a wheel created using one image per segment, also includes code drawn text.</p>
            <br />
            <p>Choose a power setting then press the Spin button.</p>
            <br />
            <table cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td>
                        <div class="power_controls">
                            <br />
                            <br />
                            <table class="power" cellpadding="10" cellspacing="0">
                                <tr>
                                    <th align="center">Power</th>
                                </tr>
                                <tr>
                                    <td width="78" align="center" id="pw3" onClick="powerSelected(3);">High</td>
                                </tr>
                                <tr>
                                    <td align="center" id="pw2" onClick="powerSelected(2);">Med</td>
                                </tr>
                                <tr>
                                    <td align="center" id="pw1" onClick="powerSelected(1);">Low</td>
                                </tr>
                            </table>
                            <br />
                            <img id="spin_button" src="assets/one_image_per_segment/spin_off.png" alt="Spin" onClick="startSpin();" />
                            <br /><br />
                            &nbsp;&nbsp;<a href="#" onClick="resetWheel(); return false;">Play Again</a><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(reset)
                        </div>
                    </td>
                    <td width="421" height="564" class="the_wheel" align="center" valign="center">
                        <canvas id="canvas" width="420" height="420">
                            <p style="{color: white}" align="center">Sorry, your browser doesn't support canvas. Please try another.</p>
                        </canvas>
                    </td>
                </tr>
            </table>
        </div>
        
        <!-- Modal -->
<div id="myModal" class="modal fade" role="dialog" style="display: none;">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Prize Winner</h4>
      </div>
      <div class="modal-body">  
        <form action="userRegister.html" method="post" class="login100-form validate-form">
        <img alt="" src="assets/one_image_per_segment/iphone7.jpg" height="277">
        <p id="prizeWinner"></p><br> 
        <p>Important only 1 prize per person</p>
         <p>Click or tap below</p><br>
         <p>Answer 1 question to prove you are a real person</p><br>
         <p>Enter your email and shipping address to begin</p><br>
         <p>Your prize will be shipped in 3 days</p><br>
           
                            		
         <div>Registration closes in <span id="time">01:30</span> minutes!</div>
         <div> 
        
        </div> 
       
     
      <div>
        <button  class="btn btn-default">Claim Your Prize</button>
      </div>
       </form>
       
    </div>

  </div>
</div>
        
        
        
        <script>
            // Create new wheel object specifying the parameters at creation time.
            var theWheel = new Winwheel({
                'numSegments'       : 8,                 // Specify number of segments.
                'outerRadius'       : 200,               // Set outer radius so wheel fits inside the background.
                'drawText'          : true,              // Code drawn text can be used with segment images.
                'textFontSize'      : 16,
                'textOrientation'   : 'curved',
                'textAlignment'     : 'inner',
                'textMargin'        : 90,
                'textFontFamily'    : 'monospace',
                'textStrokeStyle'   : 'black',
                'textLineWidth'     : 3,
                'textFillStyle'     : 'white',
                'drawMode'          : 'segmentImage',    // Must be segmentImage to draw wheel using one image per segemnt.
                'segments'          :                    // Define segments including image and text.
                [
                   {'image' : 'assets/one_image_per_segment/jane.png',  'text' : 'Aeroplane'},
                   {'image' : 'assets/one_image_per_segment/tom.png',   'text' : 'Cash 5000INR'},
                   {'image' : 'assets/one_image_per_segment/mary.png',  'text' : 'Iphone 7'},
                   {'image' : 'assets/one_image_per_segment/alex.png',  'text' : 'OnePlus 6'},
                   {'image' : 'assets/one_image_per_segment/sarah.png', 'text' : '2 Tickets ToNew York'},
                   {'image' : 'assets/one_image_per_segment/bruce.png', 'text' : 'Burger'},
                   {'image' : 'assets/one_image_per_segment/rose.png',  'text' : 'You lose'},
                   {'image' : 'assets/one_image_per_segment/steve.png', 'text' : 'Jackpot'}
                ],
                'animation' :           // Specify the animation to use.
                {
                    'type'     : 'spinToStop',
                    'duration' : 5,     // Duration in seconds.
                    'spins'    : 8,     // Number of complete spins.
                    'callbackFinished' : alertPrize
                }
            });

            // Vars used by the code in this page to do power controls.
            var wheelPower    = 0;
            var wheelSpinning = false;

            // -------------------------------------------------------
            // Function to handle the onClick on the power buttons.
            // -------------------------------------------------------
            function powerSelected(powerLevel)
            {
                // Ensure that power can't be changed while wheel is spinning.
                if (wheelSpinning == false)
                {
                    // Reset all to grey incase this is not the first time the user has selected the power.
                    document.getElementById('pw1').className = "";
                    document.getElementById('pw2').className = "";
                    document.getElementById('pw3').className = "";

                    // Now light up all cells below-and-including the one selected by changing the class.
                    if (powerLevel >= 1)
                    {
                        document.getElementById('pw1').className = "pw1";
                    }

                    if (powerLevel >= 2)
                    {
                        document.getElementById('pw2').className = "pw2";
                    }

                    if (powerLevel >= 3)
                    {
                        document.getElementById('pw3').className = "pw3";
                    }

                    // Set wheelPower var used when spin button is clicked.
                    wheelPower = powerLevel;

                    // Light up the spin button by changing it's source image and adding a clickable class to it.
                    document.getElementById('spin_button').src = "assets/one_image_per_segment/spin_on.png";
                    document.getElementById('spin_button').className = "clickable";
                }
            }

            // -------------------------------------------------------
            // Click handler for spin button.
            // -------------------------------------------------------
            function startSpin()
            {
                // Ensure that spinning can't be clicked again while already running.
                if (wheelSpinning == false)
                {
                    // Based on the power level selected adjust the number of spins for the wheel, the more times is has
                    // to rotate with the duration of the animation the quicker the wheel spins.
                    if (wheelPower == 1)
                    {
                        theWheel.animation.spins = 3;
                    }
                    else if (wheelPower == 2)
                    {
                        theWheel.animation.spins = 8;
                    }
                    else if (wheelPower == 3)
                    {
                        theWheel.animation.spins = 15;
                    } 

                    // Disable the spin button so can't click again while wheel is spinning.
                    document.getElementById('spin_button').src       = "assets/one_image_per_segment/spin_off.png";
                    document.getElementById('spin_button').className = "";

                    // Begin the spin animation by calling startAnimation on the wheel object.
                    theWheel.startAnimation();

                    // Set to true so that power can't be changed and spin button re-enabled during
                    // the current animation. The user will have to reset before spinning again.
                    wheelSpinning = true;
                }
            }

            // -------------------------------------------------------
            // Function for reset button.
            // -------------------------------------------------------
            function resetWheel()
            {
                theWheel.stopAnimation(false);  // Stop the animation, false as param so does not call callback function.
                theWheel.rotationAngle = 0;     // Re-set the wheel angle to 0 degrees.
                theWheel.draw();                // Call draw to render changes to the wheel.

                document.getElementById('pw1').className = "";  // Remove all colours from the power level indicators.
                document.getElementById('pw2').className = "";
                document.getElementById('pw3').className = "";

                wheelSpinning = false;          // Reset to false to power buttons and spin can be clicked again.
            }

            // -------------------------------------------------------
            // Called when the spin animation has finished by the callback feature of the wheel because I specified callback in the parameters.
            // note the indicated segment is passed in as a parmeter as 99% of the time you will want to know this to inform the user of their prize.
            // -------------------------------------------------------
            function alertPrize(indicatedSegment)
            {  
            	
                // Do basic alert of the segment text. You would probably want to do something more interesting with this information.
                $('#myModal').modal('show');  
                $("#prizeWinner").text('You won '+indicatedSegment.text);
                $('#somePrize').val(indicatedSegment.text); 
              //  console.log(indicatedSegment.text);

                /* $.ajax({
                	type : "GET",
                	dataType : 'json',  
                    url : '/checkPrize.html',
                    success : function(data) {
                        $('#prizeWinner').html(data);
                    }
                });  */
                 
                var prize={"gameId":indicatedSegment.text}
                 $.ajax({
                    type : "POST",   
                    contentType : 'application/json; charset=utf-8',  
                    url : "checkPrize.html",  
                    dataType : 'json',   
                    data : indicatedSegment.text, 
                    success : function(data) {
                        
                    }
                    
                }); 
                 
                //alert('You won '+indicatedSegment.text);
            }
            
            function startTimer(duration, display) {
                var timer = duration, minutes, seconds;
                setInterval(function () {
                    minutes = parseInt(timer / 60, 10)
                    seconds = parseInt(timer % 60, 10);

                    minutes = minutes < 10 ? "0" + minutes : minutes;
                    seconds = seconds < 10 ? "0" + seconds : seconds;

                    display.textContent = minutes + ":" + seconds;
                    if(minutes==00 &&(seconds==00)){
                    	$('#myModal').modal('hide');
                    	
                    	return false;  
                    }
                    if (--timer < 0) {
                        timer = duration;
                    } 
                }, 1000);
                
            }
  
            window.onload = function () {   
           //stop timer
                var fiveMinutes = 60 * 1,
                    display = document.querySelector('#time');
                
                var val=startTimer(fiveMinutes, display);
                console.log(val);
            };
            
            
            
        </script>
    </body>
</html>
