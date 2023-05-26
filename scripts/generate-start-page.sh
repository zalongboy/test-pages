#!/bin/bash

# Specify the directory you want to generate the index.html file for
docs_directory="../docs"
index_file="${docs_directory}/index.html"

# Remove the existing index.html file if it exists
if [[ -f "${index_file}" ]]; then
  rm "${index_file}"
fi

# Create the index.html file
touch "${index_file}"

# Write the HTML header to the index.html file
cat <<EOF > "${index_file}"
<html>
<head>
<title>Documented APIs</title>
</head>
<body>
EOF

# Loop through the subdirectories and generate list items with links
for api_folder in "${docs_directory}"/*/; do
  if [[ -f "${api_folder}/index.html" ]]; then
    api_name=$(basename "${api_folder}")
    echo "<li><a href=\"${api_folder}/index.html\">${api_name}</a></li>" >> "${index_file}"
  fi
done

# Write the HTML footer to the index.html file
echo "</body>" >> "${index_file}"
echo "</html>" >> "${index_file}"

echo "index.html generated at ${index_file}"
