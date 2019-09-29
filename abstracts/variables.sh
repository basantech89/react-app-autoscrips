. ./utils/cra.sh

project_dir="$loc/$project"

set_project_root_dir() {
  if [ -z "$loc" ]; then
      read -p 'Pl type the project root directory: ' project_dir
      echo "Press Y|y for yes, n|N for No"
      printf "Confirm the project root directory - %s: " "$project_dir"
      while read -r confirm_dir; do
        case "$confirm_dir" in
          ["Yy"]) break ;;
          ["Nn"])
            read -p 'Pl type the project root directory again: ' project_dir
            printf "Confirm the project root directory - %s: " "$project_dir" ;;
          *) printf "Incorrect input, Press Y|y for yes, n|N for No: "
        esac
      done
  fi
}