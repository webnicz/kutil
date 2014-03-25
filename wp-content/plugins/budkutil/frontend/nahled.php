<?
$umisteni = explode( 'wp-content', $_SERVER['SCRIPT_FILENAME'] );
require_once( $umisteni[0] . 'wp-load.php' );

function sanitize($string) {
	return addslashes($string);
}

$imageName 		= sanitize($_GET['a']);
$squareSize 	= sanitize($_GET['s']);

Class resize
{
	private $image;
    private $width;
    private $height;
	private $imageResized;

	function __construct($fileName, $dirName)
	{
		$this->image 		= $this->openImage($dirName.$fileName);
		$this->fileName  	= $fileName;
	    $this->width  		= imagesx($this->image);
	    $this->height 		= imagesy($this->image);

	    if(!file_exists($dirName.$fileName))
	    	exit();
	}

	private function openImage($file)
	{
		$extension = strtolower(strrchr($file, '.'));

		switch($extension)
		{
			case '.jpg':
			case '.jpeg':
				$img = @imagecreatefromjpeg($file);
				break;
			case '.gif':
				$img = @imagecreatefromgif($file);
				break;
			case '.png':
				$img = @imagecreatefrompng($file);
				break;
			default:
				$img = false;
				break;
		}
		return $img;
	}

	public function resizeImage($newWidth, $newHeight, $option="auto")
	{
		$optionArray = $this->getDimensions($newWidth, $newHeight, $option);

		$optimalWidth  = $optionArray['optimalWidth'];
		$optimalHeight = $optionArray['optimalHeight'];

		$this->imageResized = imagecreatetruecolor($optimalWidth, $optimalHeight);
		imagecopyresampled($this->imageResized, $this->image, 0, 0, 0, 0, $optimalWidth, $optimalHeight, $this->width, $this->height);

		if ($option == 'crop') {
			$this->crop($optimalWidth, $optimalHeight, $newWidth, $newHeight);
		}

		$extension = strrchr($this->fileName, '.');
		$extension = strtolower($extension);

		switch($extension)
		{
			case '.jpg':
			case '.jpeg':
				if (imagetypes() & IMG_JPG) {
					Header("Content-Type: Image/jpeg");
					imagejpeg($this->imageResized);
				}
				break;

			case '.gif':
				if (imagetypes() & IMG_GIF) {
					Header("Content-Type: Image/gif");
					imagegif($nahled);	
				}
				break;

			case '.png':
				if (imagetypes() & IMG_PNG) {
					 Header("Content-Type: Image/png");
					 imagepng($nahled);
				}
				break;

			default:
				break;
		}

		imagedestroy($this->imageResized);
	}
	
	private function getDimensions($newWidth, $newHeight, $option)
	{

	   switch ($option)
		{
			case 'auto':
				$optionArray = $this->getSizeByAuto($newWidth, $newHeight);
				$optimalWidth = $optionArray['optimalWidth'];
				$optimalHeight = $optionArray['optimalHeight'];
				break;
			case 'crop':
				$optionArray = $this->getOptimalCrop($newWidth, $newHeight);
				$optimalWidth = $optionArray['optimalWidth'];
				$optimalHeight = $optionArray['optimalHeight'];
				break;
		}
		return array('optimalWidth' => $optimalWidth, 'optimalHeight' => $optimalHeight);
	}

	private function getSizeByFixedHeight($newHeight)
	{
		$ratio = $this->width / $this->height;
		$newWidth = $newHeight * $ratio;
		return $newWidth;
	}

	private function getSizeByFixedWidth($newWidth)
	{
		$ratio = $this->height / $this->width;
		$newHeight = $newWidth * $ratio;
		return $newHeight;
	}

	private function getSizeByAuto($newWidth, $newHeight)
	{
		if ($this->height < $this->width)
		{
			$optimalWidth = $newWidth;
			$optimalHeight= $this->getSizeByFixedWidth($newWidth);
		}
		elseif ($this->height > $this->width)
		{
			$optimalWidth = $this->getSizeByFixedHeight($newHeight);
			$optimalHeight= $newHeight;
		}
		else
		{
			if ($newHeight < $newWidth) {
				$optimalWidth = $newWidth;
				$optimalHeight= $this->getSizeByFixedWidth($newWidth);
			} else if ($newHeight > $newWidth) {
				$optimalWidth = $this->getSizeByFixedHeight($newHeight);
				$optimalHeight= $newHeight;
			} else {
				$optimalWidth = $newWidth;
				$optimalHeight= $newHeight;
			}
		}

		return array('optimalWidth' => $optimalWidth, 'optimalHeight' => $optimalHeight);
	}

	private function getOptimalCrop($newWidth, $newHeight)
	{

		$heightRatio = $this->height / $newHeight;
		$widthRatio  = $this->width /  $newWidth;

		if ($heightRatio < $widthRatio) {
			$optimalRatio = $heightRatio;
		} else {
			$optimalRatio = $widthRatio;
		}

		$optimalHeight = $this->height / $optimalRatio;
		$optimalWidth  = $this->width  / $optimalRatio;

		return array('optimalWidth' => $optimalWidth, 'optimalHeight' => $optimalHeight);
	}

	private function crop($optimalWidth, $optimalHeight, $newWidth, $newHeight)
	{
		$cropStartX = ( $optimalWidth / 2) - ( $newWidth /2 );
		$cropStartY = ( $optimalHeight/ 2) - ( $newHeight/2 );

		$crop = $this->imageResized;
		//imagedestroy($this->imageResized);

		$this->imageResized = imagecreatetruecolor($newWidth , $newHeight);
		imagecopyresampled($this->imageResized, $crop , 0, 0, $cropStartX, $cropStartY, $newWidth, $newHeight , $newWidth, $newHeight);
	}
}

$resize = new resize($imageName, ABSPATH.'wp-content/uploads/');
$resize->resizeImage($squareSize, $squareSize, 'auto');
?>