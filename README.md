# test-pages

## Proposed approach

Deployed url: https://zalongboy.github.io/test-pages/

1. Nest API application repos write the swagger.json files to an S3 bucket (existing pattern)
2. New clp-docs repo will:

   - Fetch all swagger.json files in this S3 bucketed in application subdirectories, tagged latest
   - Scripts set up basic swagger templates and folder structure
   - Host on Github pages, deploy with GitHub Actions
   - Trigger deploy manually with GitHub actions ad hoc OR maybe application repos can make request to GHA API in deploy workflow

Directory structure:

    clp-docs/
    ├── infrastructure/
    │   └── terraform/
    │       └── s3.tf
    ├── docs/
    ├── index.html
    ├── using-apis/
    │   └── helm/
    │       └── index.html
    │       └── helm-swagger.json
    │   └── another-api/
    │       └── index.html
    │       └── another-api-swagger.json
    ├── scripts/
    │   └── generate-swagger-template.sh
    │   └── generate-start-page.sh
    └── .github/
        └── workflows/
            └── deploy-pages.yml
