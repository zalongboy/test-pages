#!/bin/bash

# Specify the directory you want to generate the index.html file for
docs_directory="./docs"
index_file="${docs_directory}/index.html"

# Remove the existing index.html file if it exists
if [[ -f "${index_file}" ]]; then
  rm "${index_file}"
fi

# Create the index.html file
touch "${index_file}"

# Write the HTML header to the index.html file
cat <<EOF > "${index_file}"
<!DOCTYPE html>
<html>
  <head>
    <title>Documented APIs</title>
  </head>
  <body>
    <h1>Documented APIs</h1>
    <div id="using-apis">
EOF

# Loop through the subdirectories and generate list items with links
for api_folder in "${docs_directory}"/*/; do
  if [[ -f "${api_folder}index.html" ]]; then
    api_name=$(basename "${api_folder}")
    relative_link=".${api_folder#"$docs_directory"}index.html"
    cat <<EOF >> "${index_file}"
      <li><a href="${relative_link}">${api_name}</a></li>
EOF
  fi
done

# Write the HTML footer to the index.html file
cat <<EOF >> "${index_file}"
    </div>
  </body>
</html>
EOF

echo "index.html generated at ${index_file}"
