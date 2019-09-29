add_assets() {
  if [ ! -d src/assets ]; then
    mkdir -p src/assets/imgs
    create_7_1_pattern
    write_all_styles
  fi
}

create_7_1_pattern() {
  if [ ! -d src/assets/stylesheets ]; then
    # The 7-1 pattern
    mkdir -p src/assets/stylesheets/{abstracts,base,components,layout,screens,themes}
    touch src/assets/stylesheets/abstracts/{_variables.scss,_functions.scss,_mixins.scss,_all.scss}
    touch src/assets/stylesheets/base/{_reset.scss,_all.scss}
    touch src/assets/stylesheets/components/{_buttons.scss,_all.scss}
    touch src/assets/stylesheets/layout/{_header.scss,_footer.scss,_all.scss}
    touch src/assets/stylesheets/screens/{_home.scss,_about.scss,_contact.scss,_all.scss}
    touch src/assets/stylesheets/themes/{_default.scss,_all.scss}
    touch src/assets/stylesheets/main.scss
  fi
}

write_all_styles() {
cat > src/assets/stylesheets/abstracts/_all.scss << EOF
  @import _variables
  @import _functions
  @import _mixins
EOF

cat > src/assets/stylesheets/base/_all.scss << EOF
  @import _reset
EOF

cat > src/assets/stylesheets/components/_all.scss << EOF
  @import _buttons
EOF

cat > src/assets/stylesheets/layout/_all.scss << EOF
  @import _header
  @import _footer
EOF

cat > src/assets/stylesheets/screens/_all.scss << EOF
  @import _home
  @import _about
  @import _contact
EOF

cat > src/assets/stylesheets/themes/_all.scss << EOF
  @import _default
EOF

cat > src/assets/stylesheets/main.scss << EOF
  @import abstracts/_all.scss
  @import base/_all.scss
  @import layout/_all.scss
  @import components/_all.scss
  @import screens/_all.scss
  @import themes/_all.scss
EOF
}