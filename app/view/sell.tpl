<link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/sellSheet.css">
<h2>Items current for sale:</h2>
<text>Below is an interactive graphic which you may look at, edit, remove or add new products to our site with.</text>

<div id="tab">

 <div id="mainBubble" style="height: 618px;"><svg class="mainBubbleSVG" width="882.436" height="618"></svg></div>
<script type="text/javascript" src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<?php
//~~~~~~~~~~~~~~~~~~~This php script retrieves all items in the database and prints json format to file called test.json~~~~~~~~~~~~~//

$products = Product::getAllProducts(); //Retrieve all items in database
$dell = array("name" => "Dell", "children" => array());	// Dell array with name and children
$lenovo = array("name" => "Lenovo", "children" => array()); // Lenovo array with name and children
$apple = array("name" => "Apple", "children" => array());	// apple array with name and children
$other = array("name" => "Other", "children" => array());	// apple array with name and children
$add = array("name" => "+", "children" => array());	// apple array with name and children



$arr =  array("name" => "bubble", "children" => array()); //Final JSON array


$lenovoChildren = array(); //array of children of lenovo items
$dellChildren = array(); //array of children of dell items
$appleChildren = array(); //array of children of apple items
$otherChildren = array(); //array of children of other items
$addChildren = array(); //No children for add bubble

while ($row = mysql_fetch_array($products, MYSQL_ASSOC)) {
  if ($row['user_id'] == $_SESSION['id']) {
		if ($row['brand'] == 'lenovo') {
			$temp = array(
				"name" => $row['title'],
				"address" => $row['id'],
				"note" => $row['price']
				);
			array_push($lenovoChildren, $temp); //Add to the children array
		}

		if ($row['brand'] == 'apple') {
			$temp = array(
				"name" => $row['title'],
				"address" => $row['id'],
				"note" => $row['price']
				);
			array_push($appleChildren, $temp); //Add to the children array
		}

		if ($row['brand'] == 'dell') {
			$temp = array(
				"name" => $row['title'],
				"address" => $row['id'],
				"note" => $row['price']
				);
			array_push($dellChildren, $temp); //Add to the children array

		}}

    if ($row['brand'] == 'other') {
			$temp = array(
				"name" => $row['title'],
				"address" => $row['id'],
				"note" => $row['price']
				);
			array_push($otherChildren, $temp); //Add to the children array

		}
	}


	$dell['children'] = $dellChildren; //Sets the children field to the children array
	$lenovo['children'] = $lenovoChildren; //Sets the children field to the children array
	$apple['children'] = $appleChildren; //Sets the children field to the children array
  $other['children'] = $otherChildren; //Sets the children field to the children array
  $add['children'] = $addChildren; //Sets the children field to the children array
	$result = array(); //Creates a result array


	///Merges all 5 results
	array_push($result, $dell);
	array_push($result, $lenovo);
	array_push($result, $apple);
  array_push($result, $other);
  array_push($result, $add);


	//Sets the children field of bubble to the result
	$arr['children'] = $result;


//~~~~~~~~~~This creates a json object in javascript ~~~~~~~~~~~~~~//
/*	echo "<script>";
	echo "var jsonText = ".json_encode($arr)."";
	echo "</script>";*/


	//Writes to a file called test.json to load data
	$file = fopen("../../test.json", "w") or die ("unable to open file");
	fwrite($file, json_encode($arr));

?>
<script type="text/javascript">
var base_url = "http://localhost/laptop_lotus/";
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
    d3.json("test.json", function(error, root) {
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
      .attr("cursor",function(d) {
        if (d.name === "+") {
          return "pointer";
        }
      })
      .on("click", function(d) {
        if (d.name === "+") {
          window.location.href=base_url + "add/";
        }
      })
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
          .attr("cursor",function(d) {
            if (d.name === "+") {
              return "pointer";
            }
          })
          .on("click", function(d) {
            if (d.name === "+") {
              window.location.href=base_url + "add/";
            }
          })
      		.on("mouseover", function(d,i) {return activateBubble(d,i);});


      	for(var iB = 0; iB < nTop; iB++)
      	{
      		var childBubbles = svg.selectAll(".childBubble" + iB)
      			.data(root.children[iB].children)
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
            .on("click", function(d, i) {
              if (d.name === "Shipping Label") {
                window.location.href=base_url + "ship/";
              } if (d.name === "Add") {
                window.location.href=base_url + "add/";
              }
            })
      			.on("mouseover", function(d,i) {
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
		if(whichExpanded == -1 || whichExpanded == 4){
			return;
		}
		if(optionsRendered){
			hideOptions();
		}
		console.log("activating option bubbles: " + whichExpanded);
    console.log(d);
		var viewChild = new Object();
			viewChild["name"] ="View";
			viewChild["address"] = base_url + "detail/view/" + d.address;
			viewChild["note"] = "View this item.";

		var editChild = new Object();
			editChild["name"] ="Edit";
			editChild["address"] = base_url + "edit/" + d.address;
			editChild["note"] = "Edit this item.";

		var deleteChild = new Object();
			deleteChild["name"] ="Delete";
			deleteChild["address"] = base_url + "delete/" + d.address; + 1;
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
      .on("click", function(d) {
        window.location.href=d.address;
      })
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
			.style("opacity",0.8)
			.attr("text-anchor", "middle")
      .on("click", function(d) {
        window.location.href=d.address;
      })
		.style("fill", function(d,i) { return colVals(iB); }) // #1f77b4
			.attr("font-size", 12)
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
