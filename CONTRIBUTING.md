# Contributing

## Repository Structure

| Repository Component | Description                                                                   |
|----------------------|-------------------------------------------------------------------------------|
| `README.md`          | Repository overview, gets compiled as the landing page for the documentation. |
| `CONTRIBUTING.md`    | Explains how to develop against this repository                               |
| `libraries`          | The base directory where the libraries are stored                             |
| `docs`               | Documentation not specific to a particular library.                           |

### Libary Structure

Within the `libraries` directory, there are several components to be aware of:

| Component | Description                                         |
|-----------|-----------------------------------------------------|
| README.md | The library's documentation page                    |
| steps     | The steps contributed by the library                |
| resources | Any reusable content for consumption by the library |
| src       | The classes contributed by the library              |
| test      | The unit tests for the library                      |

For example, the current repository's `maven` library: 

``` text
libraries/maven
├── README.md
├── resources
├── src
├── steps
│   └── build.groovy
└── test
    └── BuildSpec.groovy
```

## Documentation 

This repository uses [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) to build the documentation.

### Building the Docs

To build the documentation, run: 

``` bash
just build
```

This will build the documentation and produce static html in the `site` directory.

### Live Reloading

To see changes live as you make them, run: 

``` bash
just serve
```

The documentation will be accessible at http://localhost:8000.

## Running Tests

To run all the tests, run: 

``` bash
just test
```

The gradle test report is published to `target/reports/tests/test/index.html`. 

### For a specific library

To run tests for a specific library, `docker` for example, run:

``` bash
just test '*docker*'
```

### For a specific Specification file

To run tests for a specific Specification file, `test/docker/BuildSpec.groovy` for example, run:

``` bash
just test "*.BuildSpec"
```

## Linting

To lint the libraries, run: 

``` bash
just lint
```

The output will go to standard out. 