# Mako Ad Blocker

An ad blocker for the Mako/N12/12 streaming platform using image recognition to identify ads.

## Installation

### Compiled Version (Recommended)

- **Download the Compiled Version**: You can download the precompiled version of the Mako Ad Blocker from the [releases page](https://github.com/TheNave8or/mako-ad-blocker/releases). Simply run the application once, and it will configure itself automatically.

- **Preconfigured Settings**: The preconfigured settings are recommended for the best experience. However, if you need to customize the settings, you can:
  - Use the "Setup" shortcut created by the compiled version.
  - Or, manually run the `Setup.ahk` script if you're using the AutoHotkey version.

### AutoHotkey Version

1. **Download the Scripts**:
   - Download the latest versions of `Main.ahk` and `Setup.ahk`.

2. **Run Setup**:
   - Run the `Setup.ahk` script to create a shortcut on your desktop.
   - Configure the ad blocker by adjusting the settings in the `settings.ini` file.

## Usage

1. **Install Dependencies**:
   - [Dark Reader](https://darkreader.org/)
   - [VideoSpeed Controller](https://github.com/igrigorik/videospeed) or any other video speed control extension. To use the fast forward feature, make sure the `fastforward` variable is set to `1`.

2. **Customize Settings**:
   - You can customize your settings through the `settings.ini` file or by running the `Setup.ahk` script.

3. **Start the Ad Blocker**:
   - Run the `Main.ahk` script or the compiled version to start the ad blocker.
   - **F8** will toggle the script on and off.
   - While the script is scanning for ads, a tray icon will indicate that the script is active.

### Icons

- **Stopped Icon**: When the script is not scanning for ads, the tray icon will show as:
  <br><img src="stopped.ico" alt="Stopped Icon" width="32" height="32" style="vertical-align: middle; margin-top: 5px;">

- **Scanning Icon**: When the script is scanning for ads, the tray icon will show as:
  <br><img src="scanning.ico" alt="Scanning Icon" width="32" height="32" style="vertical-align: middle; margin-top: 2px;">

### Recommended Settings

To optimize your ad blocking experience:
- Set VideoSpeed Controller's preferred speed to `16`.
- Use the recommended settings in the `settings.ini` file.

## Contributing

Contributions are welcome! If you have suggestions or improvements, please feel free to open an issue or submit a pull request.
