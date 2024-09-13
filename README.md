# tech-radar

Create your own tech radar vizualisation to show current technology choices in your organization.

## Get started

1. Clone the repository

```console
git clone https://github.com/crayonboxdev/tech-radar
```

2. Create a `radar.config` file from the example and edit the values:

```console
cp radar.config.example radar.config
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

3. Modify the `template.html` file to fit your needs.
4. Run `./build.sh`, it creates an index.html file from the template and the `radar.config` file
5. Open the `index.html` in your browser
6. Customize `style.css`
7. Deploy your website using a provider of your choice

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

## Credits

This project is built on top of amazing open source work:

- [Thoughtworks](https://www.thoughtworks.com/radar) created the initial Tech Radar concept and provides a library to [build your own radar](https://github.com/thoughtworks/build-your-own-radar).
- [Zalando](https://github.com/zalando/tech-radar) built the [visualization](https://opensource.zalando.com/tech-radar/) used in this project.
