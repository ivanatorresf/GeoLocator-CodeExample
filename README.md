# geo_locator_implementation

[GEOLOCATOR 5.3.0](https://pub.dev/packages/geolocator) 


## Usage

To use this plugin, add geolocator as a dependency in your pubspec.yaml file. For example: 
 
```
dependencies:
   geolocator: ^5.3.0
```

# Permissions
##Android

Permissions 
Android 
On Android you'll need to add either the ACCESS_COARSE_LOCATION or the ACCESS_FINE_LOCATION permission to your Android Manifest. To do so open the AndroidManifest.xml file (located under android/app/src/main) and add one of the following two lines as direct children of the <manifest> tag:

```
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```


##iOS 
On iOS you'll need to add the NSLocationWhenInUseUsageDescription to your Info.plist file (located under ios/Runner/Base.lproj) in order to access the device's location. Simply open your Info.plist file and add the following:

```
<key>NSLocationWhenInUseUsageDescription</key>
<string>This app needs access to location when open.</string>

```
If you would like to access the device's location when your App is running in the background, you should also add the NSLocationAlwaysAndWhenInUseUsageDescription (if your App support iOS 10 or earlier you should also add the key NSLocationAlwaysUsageDescription) key to your Info.plist file:

```
<key>NSLocationAlwaysUsageDescription</key>
<string>This app needs access to location when in the background.</string>
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>This app needs access to location when open and in the background.</string
```