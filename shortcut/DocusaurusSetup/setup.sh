#!/bin/bash

tool_path="$HOME/tools/shortcut/DocusaurusSetup/"

echo "current directry: "`pwd`
echo "Create docusaurus projects here?(Y/n)"
read answer

if [ $answer != "Y" ]; then
    echo "Please move directroy"
    exit
fi

echo "Project name(default: Docusaurus):"
read project_name

if [ -z "$project_name" ]; then
  project_name="Docusaurus"
fi

# create Docusaurus project
npx create-docusaurus@latest $project_name classic --typescript
cd $project_name

# setting TypeScript
npm install --save-dev typescript @docusaurus/module-type-aliases @tsconfig/docusaurus
cat > tsconfig.json << "EOF"
{
  "extends": "@tsconfig/docusaurus/tsconfig.json",
  "compilerOptions": {
    "baseUrl": "."
  }
}
EOF

# add search window
npm install --save-dev @cmfcmf/docusaurus-search-local

# add simple plant uml
npm install --save-dev @akebifiky/remark-simple-plantuml

# copy docusaurus.config.js
cp $tool_path/configures/docusaurus.config.js ./

# copy docker-compose.yml
cp $tool_path/configures/docker-compose.yml ./

# replace package.json
sed -i '' "s/\"start\": \"docusaurus start\"/\"start\": \"docusaurus start --host 0.0.0.0\"/g" package.json
sed -i '' "s/\"serve\": \"docusaurus serve\"/\"serve\": \"docusaurus serve --host 0.0.0.0\"/g" package.json

# additional docusaurus setting
mkdir projects
touch projects/intro.md
echo 'Introduction' >> projects/intro.md
cp sidebars.js sidebarsProjects.js

docker-compose up -d
