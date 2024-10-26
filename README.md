# flutter_playground

A new Flutter project.

## Deeplinks

Navigate using deeplink:
### Android

`adb shell 'am start -d "<flutterplayground/http/https>://flutter_playground.com/<route>"'`

```bash
 adb shell 'am start -d "flutterplayground://flutter_playground.com/navigationWithArgs/profile/42?name=herman&hobbies=coding,games"'
```
```bash
adb shell 'am start -d "flutterplayground://flutter_playground.com/navigationWithArgs/purchase/42?productId=food&notes=delivery"'
```
```bash
adb shell 'am start -d "flutterplayground://flutter_playground.com/navigationWithArgs/whatever/42?param1=hello&param2=world"'
```
### iOS
TODO
## Navigate programmatically:

```dart
NavigationDestinationWithArgsRoute(...).go(context)
```
