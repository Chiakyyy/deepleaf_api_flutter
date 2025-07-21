# deepleaf-api-flutter

haha

## Installation

```sh
flutter pub add deepleaf_ai_flutter
```

## Usage


```js
import 'package:deepleaf_api_flutter/deepleaf_api_flutter.dart';

const String apiKey = "YOUR_API_KEY";

// Initialize DeepLeaf API
final api = DeepleafApiFlutter(
  apiKey: apiKey,
  language: "en"
  );

final response = await api.getAPIUsage();
```


## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [flutter documentation](https://docs.flutter.dev/packages-and-plugins/developing-packages)
