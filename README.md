# Robot Framework Hello World Example

* Trying out Robot Framework - E2E test framework in Python
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

# or upgrade
brew update && brew upgrade && brew upgrade --cask

# sync will install exactly as in Pipfile.lock
pipenv sync
pipenv shell

# or upgrade (see Update Packages)

which python
# .venv/bin/python
python -V
# Python 3.7.4

# before you run, make sure you can execute chromedriver
chromedriver --version
# ChromeDriver 91.0.4472.101 (af52a90bf87030dd1523486a1cd3ae25c5d76c9b-refs/branch-heads/4472@{#1462})

# if you got error, open it
open $(which chromedriver)
# then System Preferences > Security & Privacy > Open Anyway
# details: https://stackoverflow.com/questions/60362018

# Also make sure you have latest version of Chrome

cd hello_robot
rflint google_search.robot  # lint check
robot google_search.robot   # run e2e test
open report.html
```

## Robotframework SikuliLibrary Example on Mac

### Setup

```bash
# IMPORTANT: you need Java11 to recognize image

# setup jenv https://qiita.com/seijikohara/items/56cc4ac83ef9d686fab2
brew install --cask adoptopenjdk11
brew install jyenv
# jenv local 11
jenv versions

java -version
# openjdk version "11.0.11" 2021-04-20
# OpenJDK Runtime Environment AdoptOpenJDK-11.0.11+9 (build 11.0.11+9)
# OpenJDK 64-Bit Server VM AdoptOpenJDK-11.0.11+9 (build 11.0.11+9, mixed mode)

brew install opencv tesseract maven
opencv_version
# 4.5.3
tesseract --version
# tesseract 4.1.1
# ...

pipenv install robotframework-SikuliLibrary

# if the above does not not work, need to install locally
# c.f. how to install locally from the latest version on github
git clone https://github.com/rainmanwy/robotframework-SikuliLibrary.git ~/robotframework-SikuliLibrary
cd ~/robotframework-SikuliLibrary
# or git pull in here
mvn package

cd -  # back to the original directory

pipenv install -e ~/robotframework-SikuliLibrary

# you don't need the log file
export DISABLE_SIKULI_LOG=yes
```

### Run

```bash
# open Chrome and open "New Incognito Window" before you start.
# (for reproducibility, use incognito window of Chrome English version)
cd hello_sikuli
rflint sikuli_google_search.robot   # lint check (let's not worry about doc error)
robot sikuli_google_search.robot    # run e2e test

# Note: sometimes it failed when it try to open menu.
# in such case, please just retry.
# or try change the width of browser window size when it is not working.

open report.html
```

### Tesseract problem fix for Mac

__error message__

```
org.sikuli.script.SikuliXception: OCR: start: Tesseract library problems: Unable to load library 'tesseract':
dlopen(libtesseract.dylib, 9): image not found
dlopen(libtesseract.dylib, 9): image not found
Native library (darwin/libtesseract.dylib) not found in resource path
 (/Users/xxx/robotframework-SikuliLibrary/target/src/SikuliLibrary/lib/SikuliLibrary.jar)
```

__error fix__

* c.f. https://stackoverflow.com/a/30724844

```bash
cd ~/.m2/repository/net/sourceforge/tess4j/tess4j/4.4.1
mkdir darwin
jar uf tess4j-4.4.1.jar darwin
cp /usr/local/Cellar/tesseract/4.1.1/lib/libtesseract.4.dylib darwin/libtesseract.dylib
jar uf tess4j-4.4.1.jar darwin/libtesseract.dylib
jar tf tess4j-4.4.1.jar
```

* then rerun `mvn package` and `pipenv install -e ~/robotframework-SikuliLibrary`

### [Important] note for Mac Retina users about images for SikuliLibrary

* `Command-Shift-5` (or 4) to take screenshot.
* open it with Preview app and halve the size and resolution.
  - Preview > Tools > Adjust Size...
    - Width: half size
    - Resolution: 72 pixels/inch
  - Save as PNG
    - Remove check box of Alpha
  - remove EXIF https://www.youtube.com/watch?v=mVMGiMFGgsU
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
pipenv clean                # remove unused packages
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
