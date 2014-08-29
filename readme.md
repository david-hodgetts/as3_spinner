# AS3 Spinner

a simple waiting spinner class

## Usage

Instantiate and add to Stage.

			var spinner:Spinner = new Spinner();
			addChild(spinner);

			// when done simply remove from stage

The constructor has arguments to configure the *radius*, *segment length*, and *stroke width*.
Note: the bounding box is *radius* + *segment length* (+ a bit to account for the round capStyle). 

## TODO

add configuration options for color and animation playback speed.

## Licence

[MIT](http://opensource.org/licenses/MIT)