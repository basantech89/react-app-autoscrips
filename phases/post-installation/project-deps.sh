#!/bin/sh
. ./abstracts/colors.sh
. ./deps/basic.sh
. ./utils/upgrade.sh
. ./utils/pkg.sh

post_installation() {
  yarn add react-router-dom bootstrap reactstrap react-popper font-awesome redux react-redux redux-thunk redux-logger prop-types
  mkdir -p src/assets/imgs
  mkdir -p src/assets/stylesheets/
}