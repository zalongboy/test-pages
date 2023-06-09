# test-pages

## Proposed approach

1. Nest API application repos write the swagger.json files to an S3 bucket
2. New clp-docs repo will:

   - Fetch all swagger.json files in this S3 bucketed tagged latest
   - Scripts set up basic swagger templates and folder structure
   - Host on Github pages
   - Trigger deploy manually with GitHub actions ad hoc OR application repos can make request to GHA API in deploy workflow

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
    │   └── fetch-swagger-json.sh
    │   └── generate-start-page.sh
    └── .github/
        └── workflows/
            └── deploy-pages.yml
