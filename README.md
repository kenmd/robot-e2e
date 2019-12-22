# Robot Framework Hello World Example

* Try out Robot Framework - E2E test framework in Python
* Simple sample tests for starter code including DDT (Data Driven Tests)
* SeleniumLibrary: Selenium with chrome driver
  - read test cases from CSV
  - search google for each test keywords
  - check search result
* SikuliLibrary: pure Sikuli sample without Selenium
  - search google and check the result using image recognition
* see https://robotframework.org/

----------

## Robotframework SeleniumLibrary Example

```bash
brew install pyenv pipenv
brew cask install chromedriver
pipenv install
pipenv shell

cd hello_robot
rflint google_search.robot  # lint check
robot google_search.robot   # run e2e test
open report.html
```

## Robotframework SikuliLibrary Example on Mac

```bash
# not sure if it's really necessary for mac users to install these.
brew install opencv tesseract maven
opencv_version 
> 4.1.2
tesseract --version
> tesseract 4.1.0

# pipenv install robotframework-SikuliLibrary will install old version for windows.
# therefore you need to install locally.
git clone https://github.com/rainmanwy/robotframework-SikuliLibrary.git ~
cd ~/robotframework-SikuliLibrary
mvn package

pipenv install -e ~/robotframework-SikuliLibrary

# you don't need the log file
export DISABLE_SIKULI_LOG=yes

# assume using Chrome and Google in English version
# for reproducibility, open new chrome incognito window before you start.
cd hello_sikuli
rflint sikuli_google_search.robot   # lint check (let's not worry about doc error)
robot sikuli_google_search.robot    # run e2e test

open report.html
```

### [Important] note for Mac Retina users about images for SikuliLibrary

* `Command-Shift-5` to take screenshot.
* open it with Preview app and halve the size and resolution.
* see Adjust Retina MacBook screenshots to be actual size
  - https://www.macissues.com/2014/03/29/adjust-retina-macbook-screenshots-to-be-actual-size/

## GUI

* https://marketplace.visualstudio.com/items?itemName=TomiTurtiainen.rf-intellisense
* https://github.com/robotframework/RIDE
* https://github.com/nokia/RED

## Setup command log

```bash
pipenv --python 3.7
pipenv install robotframework docutils
pipenv install robotframework-seleniumlibrary
pipenv install robotframework-debuglibrary
pipenv install robotframework-datadriver
pipenv install robotframework-lint
```

## Update Packages

```bash
pipenv update --outdated    # check
pipenv update               # update
```

## Reference

* Quick Start Blog: https://thinkami.hatenablog.com/entry/2017/12/03/100540
* How to DDT: https://thinkpalm.com/blogs/data-driven-testing-robot-framework/
* How to CSV: https://pypi.org/project/robotframework-datadriver/
* BuiltIn Keywords
  - https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
* SikuliLibrary Keywords
  - http://rainmanwy.github.io/robotframework-SikuliLibrary/doc/SikuliLibrary.html
* SikuliLibrary Demo
  - https://github.com/rainmanwy/robotframework-SikuliLibrary/tree/master/demo
