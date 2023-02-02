<a name="readme-top"></a>

<div align="center">

  <img src="https://cdn.alexishenry.eu/public/images/logo.png" alt="logo" width="220" height="auto" />
  <h1>Server maintenance tool</h1>
  
  <p>
    A server maintenance tool to manage your web server.
  </p>

<a href="https://alxishenry.github.io/docs"><strong>Documentation »</strong></a>

<h4>
    <a href="https://alexishenry.eu">Go to the site</a>
  <span> · </span>
    <a href="https://github.com/AlxisHenry/server-maintenance/issues">Report a bug</a>
  <span> · </span>
    <a href="https://github.com/AlxisHenry/server-maintenance/issues">I have an idea</a>
  </h4>
</div>

<br/>

# :notebook_with_decorative_cover: Summary

- [:notebook\_with\_decorative\_cover: About the project](#star2-about-the-project)
  * [:space\_invader: Techs](#space_invader-techs)
- [:toolbox: Getting Started](#toolbox-getting-started)
  * [:gear: Setup](#gear-setup)
  * [:gear: Configuration](#gear-config)
  * [:test\_tube: Tests](#test_tube-tests)
  * [:wrench: Available commands](#wrench-available-commands)
- [:wave: Authors](#wave-authors)

## :star2: About the project


### :space_invader: Techs

[![Shell](https://img.shields.io/badge/bash%20-hotpink.svg?&style=for-the-badge&logo=gnu-bash&logoColor=4EAA25&color=gray)]()

## :toolbox: Getting Started

### :gear: Setup

**Clone the repository**

```bash
git clone https://github.com/AlxisHenry/server-maintenance.git
```
### :gear: Configuration

To configure the program run the following command :

```bash
bash app.sh -c|--config || make config
```

### :test_tube: Tests

**Run the tests using the following command :**

```bash
bash app.sh -t |--tests || make tests
```

### :wrench: Available options

- **Display the help**

```bash
bash app.sh -h|--help
```

- **Setup configuration**

```bash
bash app.sh -c|--config || make config
```

- **Launch tests only**

```bash
bash app.sh -t|--tests || make tests
```

- **Skip checks (update, tests, etc...) and animations**

```bash
bash app.sh -s|--skip
```

- **Disable the update check only**

```bash
bash app.sh --no-update
```

- **Launch the program in production mode (test skipped)**

```bash
bash app.sh -m|--maintenance
```

## :wave: Authors

* **Alexis Henry** _alias_ [@AlxisHenry](https://github.com/AlxisHenry)

<!-- ## :page_with_curl: Liens utiles -->

<p align="right">(<a href="#readme-top">back to top</a>)</p>