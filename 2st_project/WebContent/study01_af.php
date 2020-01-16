<?php

$imageKind = array ('image/pjpeg', 'image/jpeg', 'image/JPG', 'image/X-PNG', 'image/PNG', 'image/png', 'image/x-png');
$dir = "./imgs/";

for($i=0; $i<$_POST['image_count']; $i++) {
	
	$image_id = "image_".$i;
	$image_file = time().$i.".jpg";

	if(isset($_FILES[$image_id]) && !$_FILES[$image_id]['error']) {
		if(in_array($_FILES[$image_id]['type'], $imageKind)) {
			if(move_uploaded_file($_FILES[$image_id]['tmp_name'], $dir.$image_file)) {
				echo "Success Upload Image <br/>";
			} else {
				echo "Error Upload Image <br/>";
			}
		} else {
			echo "Not Image Type <br/>";
		}
	} else {
		echo "Image Upload Fail <br/>";
	}

}


?>