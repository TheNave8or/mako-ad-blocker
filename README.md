# mako-ad-blocker
An ad blocker for Mako streaming platform using image recognition to identify ads.

## Installation

To use this ad blocker, you will need to install the following dependencies:

1. [Dark Reader](https://darkreader.org/) - A browser extension that helps you read web pages in a more comfortable and efficient way by inverting brightness and contrast. this is crucial for the project - this extension recognizes ads as a different element than the video itself, so it thinks the video needs "darkening" and what happens is that the ad gets completely blacked out.
2. [VideoSpeed Controller](https://github.com/igrigorik/videospeed) - A browser extension that allows you to control the playback speed of HTML5 videos.

## Usage

1. Install the dependencies mentioned above.
2. Download the latest version of the `Main.ahk` and `Setup.ahk` scripts from the repository.
3. Run the `Setup.ahk` script to create a shortcut on your desktop.
4. Double-click the shortcut to start the `Main.ahk` script.
5. Configure the ad blocker by adjusting the settings in the `settings.ini` file.

### Recommended Settings

To make ads as short as possible and mute them, you can set the following VideoSpeed Controller preferences:

1. Open the VideoSpeed Controller options.
2. Click on the "Options" button.
3. In the "Preferred speed" dropdown, select "16".

## Contributing

Contributions are welcome! If you have any suggestions or improvements, please feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.