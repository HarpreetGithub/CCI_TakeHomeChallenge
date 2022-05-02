## Prerequisite

- Verify that Robot Framework is installed 

```bash
harpreet@harpreet:~/CCI_Harpreet$ robot --version
Robot Framework 5.0 (Python 3.8.10 on linux)
```
Robot Framework: https://robotframework.org/

- Install the Robot Framework SeleniumLibrary

```bash
pip install --upgrade robotframework-seleniumlibrary
```
Note: Need to install webdrivers separately 

- Install the Robot Framework RequestsLibrary

```bash
pip install robotframework-requests
```

## Run tests

### UI automation test
Build using the Selenium Library and Page Object Model (POM)

```bash
cd {project_folder}
run commond: robot -d results Tests/CCI_UI_Test1.robot
```
SeleniumLibrary: https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html

### API automation test
Build using the Requests Library 

```bash
cd {project_folder}
run commond: robot -d results Tests/CCI_API_Test1.robot
```
RequestsLibrary: https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html

### RabiitMQ automation test
Build using the Pika Library 

```bash
cd {project_folder}
run commond: robot -d results Tests/CCI_RabbitMQ.robot
```
Pika: https://pika.readthedocs.io/en/stable/intro.html
