<!--
*** This readme was adapted from Best-README-Template.
  https://github.com/othneildrew/Best-README-Template
-->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
<div align="left">

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]

</div>

<a href="https://github.com/Kaweees/modern_python">
    <img alt="Python Logo" src="assets/img/python.png" align="right" width="150">
</a>

<div align="left">
    <h1><em><a href="https://github.com/Kaweees/modern_python">~modern_python</a></em></h1>
</div>

<!-- ABOUT THE PROJECT -->

A template for developing production-ready Python applications.

### Built With

[![Python][Python-shield]][Python-url]
[![Pytest][Pytest-shield]][Pytest-url]
[![Nix][Nix-shield]][Nix-url]
[![Codecov][Codecov-shield]][Codecov-url]
[![GitHub Actions][github-actions-shield]][github-actions-url]

<!-- PROJECT PREVIEW -->
## Preview

<p align="center">
    <img src="assets/img/demo.mp4" width = "80%" alt = "Video demonstration"/>
</p>

<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

Before attempting to build this project, make sure you have [direnv](https://direnv.net/) and [Nix](https://nixos.org/download.html) with [Flake](https://nixos.wiki/wiki/Flakes) support installed on your machine.

### Installation

To get a local copy of the project up and running on your machine, follow these simple steps:

1. Clone the project repository

    ```sh
    git clone https://github.com/Kaweees/modern_python.git
    cd modern_python
    ```

2. Install the project dependencies

   If you have `direnv` installed, simply allow the environment:

   ```sh
   direnv allow
   ```

   Otherwise, you can use `nix-shell` to enter the environment:

   ```sh
   nix-shell --max-jobs $(nproc) # Linux / Windows (WSL)
   nix-shell --max-jobs $(sysctl -n hw.ncpu) # macOS
   ```

3. Run the project

    ```sh
    just run <package_name>
    ```

<!-- PROJECT FILE STRUCTURE -->
## Project Structure

```sh
modern_python/
├── .github/                       - GitHub Actions CI/CD workflows
├── scripts/                       - Standalone scripts
├── shared/
│   └── utils/                     - Shared utility functions
├── src/                           - Project packages
│   ├── core/                      - Core application logic
│   └── ...                        - Other packages
├── tests/                         - Project tests (mirrors the main project structure)
├── LICENSE                        - Project license
└── README.md                      - You are here
```

## License

The source code for [Kaweees/modern_python](https://github.com/Kaweees/modern_python) is distributed under the terms of the GNU General Public License v3.0, as I firmly believe that collaborating on free and open-source software fosters innovations that mutually and equitably beneficial to both collaborators and users alike. See [`LICENSE`](./LICENSE) for details and more information.

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/Kaweees/modern_python.svg?style=for-the-badge
[contributors-url]: https://github.com/Kaweees/modern_python/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Kaweees/modern_python.svg?style=for-the-badge
[forks-url]: https://github.com/Kaweees/modern_python/network/members
[stars-shield]: https://img.shields.io/github/stars/Kaweees/modern_python.svg?style=for-the-badge
[stars-url]: https://github.com/Kaweees/modern_python/stargazers

<!-- MARKDOWN SHIELD BAGDES & LINKS -->
<!-- https://github.com/Ileriayo/markdown-badges -->

[Python-shield]: https://img.shields.io/badge/Python-%23008080.svg?style=for-the-badge&logo=python&logoColor=FFDD54&labelColor=222222&color=306998
[Python-url]: https://www.python.org/
[Pytest-shield]: https://img.shields.io/badge/pytest-%23008080.svg?style=for-the-badge&logo=pytest&logoColor=2F9FE3&labelColor=222222&color=2F9FE3
[Pytest-url]: https://docs.pytest.org
[Nix-shield]: https://img.shields.io/badge/NIX-%23008080.svg?style=for-the-badge&logo=NixOS&logoColor=5277C3&labelColor=222222&color=5277C3
[Nix-url]: https://nixos.org/
[Codecov-shield]: https://img.shields.io/badge/codecov-%23008080.svg?style=for-the-badge&logo=codecov&logoColor=FF0077&labelColor=222222&color=FF0077
[Codecov-url]: https://codecov.io/
[github-actions-shield]: https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=2671E5&labelColor=222222&color=2671E5
[github-actions-url]: https://github.com/features/actions
