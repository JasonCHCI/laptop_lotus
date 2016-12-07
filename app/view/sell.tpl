<link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/sellSheet.css">
<h2>Items current for sale:</h2>
<text>Below is an interactive graphic which you may look at, edit, remove or add new products to our site with.</text>

<div id="tab">

 <div id="mainBubble" style="height: 618px;"><svg class="mainBubbleSVG" width="882.436" height="618"></svg></div>
<script type="text/javascript" src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>	
	
<script type="text/javascript">
 var w = window.innerWidth*0.68*0.95;
   var h = Math.ceil(w*0.7);
   var oR = 0;
   var nTop = 1;
   var whichExpanded = -1;
   var numOptions = 3;
   var optionsRendered = false;
   
   var svgContainer = d3.select("#mainBubble")
      .style("height", h+"px");
   
   var svg = d3.select("#mainBubble").append("svg")
		.attr("class", "mainBubbleSVG")
   		.attr("width", w + 200)
   		.attr("height",h)
		.on("mouseleave", function() {return resetBubbles();});
		
  var mainNote = svg.append("text")
	.attr("id", "bubbleItemNote")
	.attr("x", 10)
	.attr("y", 15)
	.attr("font-size", 12)
	.attr("dominant-baseline", "middle")
	.attr("alignment-baseline", "middle")
	.style("fill", "#888888")
	.text(function(d) {return "Waiting for information to be loaded.";});	
    d3.json("main_bubble.json", function(error, root) {
    	console.log(error);
	
    	var bubbleObj = svg.selectAll(".topBubble")
      			.data(root.children)
      		.enter().append("g")
      			.attr("id", function(d,i) {return "topBubbleAndText_" + i});
      		
      	console.log(root);	
      	nTop = root.children.length;
      	oR = w/(1+3*nTop);	
		h = Math.ceil(w/nTop*3);
		svgContainer.style("height",h+"px");
      	
      	var colVals = d3.scale.category10();
   		
    	bubbleObj.append("circle")
      		.attr("class", "topBubble")
      		.attr("id", function(d,i) {return "topBubble" + i;})
      		.attr("r", function(d) { return oR; })
      		.attr("cx", function(d, i) {return oR*(3*(1+i)-1);})
      		.attr("cy", (h+oR)/3)
      		.style("fill", function(d,i) { return colVals(i); }) // #1f77b4
   		.style("opacity",0.3)
      		.on("mouseover", function(d,i) {return activateBubble(d,i);});
		
      		
    	bubbleObj.append("text")
      		.attr("class", "topBubbleText")
      		.attr("x", function(d, i) {return oR*(3*(1+i)-1);})
      		.attr("y", (h+oR)/3)
		.style("fill", function(d,i) { return colVals(i); }) // #1f77b4
      		.attr("font-size", 30)
      		.attr("text-anchor", "middle")
		.attr("dominant-baseline", "middle")
		.attr("alignment-baseline", "middle")
      		.text(function(d) {return d.name})    	
      		.on("mouseover", function(d,i) {return activateBubble(d,i);});
      	
      	
      	for(var iB = 0; iB < nTop; iB++)
      	{
			var childTemp = new Object();
				childTemp["name"] ="New";
				childTemp["address"] = "http://localhost/laptop_lotus/detail/view/" + 1; //TODO pass item id
				childTemp["note"] = "Add a new item of this brand.";
				childTemp["iB"] = iB; //needed to create as we go down
			var newChildren = [];
			var oldChildren = root.children[iB].children;
			newChildren.push(childTemp);
			for(i = 0; i < oldChildren.length; i++){
				newChildren.push(oldChildren[i]);
			}
      		var childBubbles = svg.selectAll(".childBubble" + iB)
      			.data(newChildren)
      			.enter().append("g");
			
      		childBubbles.append("circle")
      			.attr("class", "childBubble" + iB)
      			.attr("id", function(d,i) {return "childBubble_" + iB + "sub_" + i;})
      			.attr("r",  function(d) {return oR/3.0;})
      			.attr("cx", function(d,i) {
					d["cx"] = oR*(3*(iB+1)-1) + oR*1.5*Math.cos((i-2)*45/180*3.1415926); 
					return d.cx;
				})
      			.attr("cy", function(d,i) {
					d["cy"] = (h+oR)/3 +        oR*1.5*Math.sin((i-2)*45/180*3.1415926); 
					return d.cy
				})
      			.attr("cursor","pointer")
      			.style("opacity",0.5)
      			.style("fill", "#eee")
      			.on("mouseover", function(d,i) {
			    //window.open(d.address);
					renderOptions(d,i);
				})
				.on("mouseover", function(d,i) {
					var noteText = "";
					if (d.note == null || d.note == "") {
						noteText = d.address;
					} else {
						noteText = d.note;
					}
					d3.select("#bubbleItemNote").text(noteText);
				})
				.append("svg:title")
				.text(function(d) { return d.address; });	
				childBubbles.append("text")
					.attr("class", "childBubbleText" + iB)
					.attr("x", function(d,i) {return d.cx})
					.attr("y", function(d,i) {return d.cy})
					.style("opacity",0.5)
					.attr("text-anchor", "middle")
					.style("fill", function(d,i) { return colVals(iB); }) // #1f77b4
					.attr("font-size", 6)
					.attr("cursor","pointer")
					.attr("dominant-baseline", "middle")
					.attr("alignment-baseline", "middle")
					.text(function(d) {return d.name})    	
					.on("mouseover", function(d,i) {
					//window.open(d.address);
						renderOptions(d,i);
					});	
     	}
 		
      });	
		
	renderOptions = function(d,i){
		if(whichExpanded == -1){
			return;
		}	
		if(optionsRendered){
			hideOptions();
		}
		if(i == 0){//no need for it on "new"
			return;
		}
		console.log("activating option bubbles: " + whichExpanded);
		var viewChild = new Object();
			viewChild["name"] ="View";
			viewChild["address"] = "http://localhost/laptop_lotus/detail/view/" + 1; //TODO pass item id
			viewChild["note"] = "View this item.";	
			
		var editChild = new Object();
			editChild["name"] ="Edit";
			editChild["address"] = "http://localhost/laptop_lotus/detail/view/" + 1; //TODO pass item id
			editChild["note"] = "Edit this item.";

		var deleteChild = new Object();
			deleteChild["name"] ="Delete";
			deleteChild["address"] = "http://localhost/laptop_lotus/detail/view/" + 1; //TODO pass item id
			deleteChild["note"] = "Delete this item.";	
		
		var optionChildren = [];
			optionChildren.push(viewChild);
			optionChildren.push(editChild);
			optionChildren.push(deleteChild);
		
		var optionBubbles = svg.selectAll(".optionBubble")
			.data(optionChildren)
			.enter().append("g");
		var iB = whichExpanded;
		//console.log("(" + ox + "," + oy + ")");
		
		//Create bubbles
		//var ox = d.expX - oR *1.1*Math.cos((i + j+1)*45/180*3.1415926);
		//var oy = d.expY - oR*1.1*Math.sin((i + j+1)*45/180*3.1415926);
		var expX = d.expX;
		var expY = d.expY;
		
	
		optionBubbles.append("circle")
			.attr("class", "optionBubble")
			.attr("id", function(d,ii) {return "optionBubble" + i;})
			.attr("r",  function(d) {return oR/3.0;})  //should be scaled correctly
			.attr("cx", function(d,ii) {return (expX - oR *1.1*Math.cos((i + ii +1)*45/180*3.1415926));})
			.attr("cy", function(d,ii) {return (expY - oR*1.1*Math.sin((i + ii +1)*45/180*3.1415926));})
			.attr("cursor","pointer")
			.style("opacity",0.5)
			.style("fill", "#eee")
			.on("mouseover", function(d,i) {
				var noteText = "Testing";
				if (d.note == null || d.note == "") {
					noteText = d.address;
				} else {
					noteText = d.note;
				};
			});
		var colVals = d3.scale.category10();			
		optionBubbles.append("text")
			.attr("class", "optionBubbleText")
			.attr("x", function(d,ii) {return (expX - oR *1.1*Math.cos((i + ii +1)*45/180*3.1415926));})
			.attr("y", function(d,ii) {return (expY - oR*1.1*Math.sin((i + ii +1)*45/180*3.1415926));})
			.style("opacity",0.5)
			.attr("text-anchor", "middle")
		.style("fill", function(d,i) { return colVals(iB); }) // #1f77b4
			.attr("font-size", 6)
			.attr("cursor","pointer")
			.attr("dominant-baseline", "middle")
		.attr("alignment-baseline", "middle")
			.text(function(d) {return d.name});

		optionsRendered = true;
	}
	
	hideOptions = function(){
		//TODO stop on click options to children???
		console.log("closing old options");
		var optionBubbles = svg.selectAll(".optionBubble")
			.remove();//hide
		console.log(optionBubbles);
		var optionBubbleText = svg.selectAll(".optionBubbleText")
			.remove();//hide
		optionsRendered = false;
	}
	
	resetBubbles = function () {
		whichExpanded = -1;
		w = window.innerWidth*0.68*0.95;
	  
		oR = w/(1+3*nTop);
	  
		h = Math.ceil(w/nTop*3);
		svgContainer.style("height",h+"px");
		mainNote.attr("y",15);
		  
		svg.attr("width", w + 200);
		svg.attr("height",h);	      
			
		var t = svg.transition()
			.duration(650);
		
		t.selectAll(".topBubble")
			.attr("r", function(d) { return oR; })
			.attr("cx", function(d, i) {return oR*(3*(1+i)-1);})
			.attr("cy", (h+oR)/3);
		t.selectAll(".topBubbleText")
			.attr("font-size", 30)
			.attr("x", function(d, i) {return oR*(3*(1+i)-1);})
			.attr("y", (h+oR)/3);
			
		for(var k = 0; k < nTop; k++) 
		{
			t.selectAll(".childBubbleText" + k)
				.attr("x", function(d,i) {return (oR*(3*(k+1)-1) + oR*1.5*Math.cos((i-2)*45/180*3.1415926));})
				.attr("y", function(d,i) {return ((h+oR)/3 +        oR*1.5*Math.sin((i-2)*45/180*3.1415926));})
				.attr("font-size", 6)
				.style("opacity",0.5);
			t.selectAll(".childBubble" + k)
				.attr("r",  function(d) {return oR/3.0;})
				.style("opacity",0.5)
				//cx cy used for later calculation of option bubbles.
				.attr("cx", function(d,i) {
					d["cx"] = oR*(3*(k+1)-1) + oR*1.5*Math.cos((i-2)*45/180*3.1415926); 
					return d.cx;
				})
				.attr("cy", function(d,i) {
					d["cy"] = (h+oR)/3 +        oR*1.5*Math.sin((i-2)*45/180*3.1415926); 
					return d.cy
				})		
		  }	  
		//turning off options
		hideOptions();
	}
	
	
	function activateBubble(d,i) {
	
		// increase this bubble and decrease others
		var t = svg.transition()
			.duration(d3.event.altKey ? 7500 : 350);

		t.selectAll(".topBubble")
			.attr("cx", function(d,ii){
				if(i == ii) {
					// Nothing to change
					return oR*(3*(1+ii)-1) - 0.6*oR*(ii-1);
				} else {
					// Push away a little bit
					if(ii < i){
						// left side
						return oR*0.6*(3*(1+ii)-1);
					} else {
						// right side
						return oR*(nTop*3+1) - oR*0.6*(3*(nTop-ii)-1);
					}
				}	  			
			})
			.attr("r", function(d, ii) { 
				if(i == ii)
					return oR*1.8;
				else
					return oR*0.8;
				});
				
		t.selectAll(".topBubbleText")
			.attr("x", function(d,ii){
				if(i == ii) {
					// Nothing to change
					return oR*(3*(1+ii)-1) - 0.6*oR*(ii-1);
				} else {
					// Push away a little bit
					if(ii < i){
						// left side
						return oR*0.6*(3*(1+ii)-1);
					} else {
						// right side
						return oR*(nTop*3+1) - oR*0.6*(3*(nTop-ii)-1);
					}
				}	  			
			})	      	
			.attr("font-size", function(d,ii){
				if(i == ii)
					return 30*1.5;
				else
					return 30*0.6;	      		
			});

		var signSide = -1;
		for(var k = 0; k < nTop; k++) 
		{
			signSide = 1;
			if(k < nTop/2) signSide = 1;
			t.selectAll(".childBubbleText" + k)
				.attr("x", function(d,i) {d["expX"] = oR*(3*(k+1)-1) - 0.6*oR*(k-1) + signSide*oR*2.5*Math.cos((i-2)*45/180*3.1415926); return d.expX;})
				.attr("y", function(d,i) {d["expY"] = (h+oR)/3 + signSide*oR*2.5*Math.sin((i-2)*45/180*3.1415926); return d.expY;})
				.attr("font-size", function(){
						return (k==i)?12:6;
					})
				.style("opacity",function(){
						return (k==i)?1:0;
					});
				
			t.selectAll(".childBubble" + k)
				.attr("cx", function(d,i) {d["expX"] = oR*(3*(k+1)-1) - 0.6*oR*(k-1) + signSide*oR*2.5*Math.cos((i-2)*45/180*3.1415926); return d.expX;})
				.attr("cy", function(d,i) {d["expY"] = (h+oR)/3 + signSide*oR*2.5*Math.sin((i-2)*45/180*3.1415926);return d.expY;})
				.attr("r", function(){
						return (k==i)?(oR*0.55):(oR/3.0);				
				})
				.style("opacity", function(){
						return (k==i)?1:0;					
					});	
					
		}

		whichExpanded = i;
		console.log("turning off optionBubbles");
		hideOptions();
	}
	
	window.onresize = resetBubbles;
</script>

</div>
<div id="adddiv">
	<form action="<?= BASE_URL ?>/add/" method="POST">
		<button id="add" type="submit">Add</button>
	</form>
</div>
<div id="shipdiv">
	<form action="<?= BASE_URL ?>/ship/" method="POST">
		<button id="ship" type="submit">Generate shipping label</button>
	</form>
</div>
