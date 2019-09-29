#!/bin/sh
. ./abstracts/colors.sh
. ./abstracts/variables.sh
. ./deps/basic.sh
. ./utils/upgrade.sh
. ./utils/pkg.sh
. ./utils/outputs.sh
. ./phases/post-installation/add-assets.sh

post_installation() {
  cd "$project_dir" || exit
  if ! cat pacakge.json | grep react-router-dom &> /dev/null; then
      yarn add react-router-dom bootstrap reactstrap react-popper font-awesome redux react-redux redux-thunk redux-logger prop-types
  fi
  add_assets
}

