# Robot Framework Hello World Example

* Try out E2E test frame work in Python
* Simple sample tests of DDT (Data Driven Tests)
  - read test cases from CSV
  - search google for each test keywords
  - check search result
* see https://robotframework.org/

----------

## Run

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

## Reference

* Quick Start Blog: https://thinkami.hatenablog.com/entry/2017/12/03/100540
* How to DDT: https://thinkpalm.com/blogs/data-driven-testing-robot-framework/
* How to CSV: https://pypi.org/project/robotframework-datadriver/
