# tech-radar

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](./CODE_OF_CONDUCT.md)

Create your own tech radar vizualisation to show current technology choices in your organization.

## Get started

1. Clone the repository

```sh
git clone https://github.com/crayonboxdev/tech-radar
```

2. Create a `radar.config` file from the example and edit the values:

```sh
mv radar.config.example radar.config
```

> [!IMPORTANT]
> Escape special characters

```
ORG_NAME="EXAMPLE"
BASE_URL="www.example.com"
DATE="2024-09-12"
QUADRANTS=("Techniques" "Tools" "Platforms" "Languages \& Frameworks")
RINGS=("Adopt" "Trial" "Assess" "Hold")
```

3. Customize `template.html` for your organization
4. Run `./build.sh`
5. Open the generated `index.html` in your browser
6. Customize `style.css`
7. Deploy your website on your hosting provider

## Variables

| Template variable | Description           | Configuration |
| ----------------- | --------------------- | ------------- |
| [ORG_NAME]        | The organization name | ORG_NAME      |
| [DATE]            | Current date          | DATE          |
| [BASE_URL]        | Base Url              | BASE_URL      |
| [QUADRANT_0]      | Bottom-right section  | QUADRANTS     |
| [QUADRANT_1]      | Bottom-left section   | QUADRANTS     |
| [QUADRANT_2]      | Top-left section      | QUADRANTS     |
| [QUADRANT_3]      | Top-right section     | QUADRANTS     |
| [RING_0]          | Inner Ring            | RINGS         |
| [RING_1]          | Middle-Inner Ring     | RINGS         |
| [RING_2]          | Middle-Outer Ring     | RINGS         |
| [RING_3]          | Outer Ring            | RINGS         |

## Contributing

To contribute, please follow the guidelines outlined in the [CONTRIBUTING.md](./CONTRIBUTING.md) and the [Code of Conduct](./CODE_OF_CONDUCT.md).

## License

This project is licensed under [Apache 2.0](./LICENSE).

## Credits

This project is built on top of amazing open source work:

- [Thoughtworks](https://www.thoughtworks.com/radar) created the initial Tech Radar concept and provides a library to [build your own radar](https://github.com/thoughtworks/build-your-own-radar).
- [Zalando](https://github.com/zalando/tech-radar) built the [visualization](https://opensource.zalando.com/tech-radar/) used in this project.
