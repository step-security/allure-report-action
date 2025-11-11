# Allure Report with history action

Generates Allure Report with history.

Example workflow file [allure-report](https://github.com/step-security/allure-report-action/blob/main/.github/workflows/allure-report.yml)

## Inputs

### `allure_results`

**Required** The relative path to the Allure results directory. 

Default `allure-results`

### `allure_report`

**Required** The relative path to the directory where Allure will write the generated report. 

Default `allure-report`

### `gh_pages`

**Required** The relative path to the `gh-pages` branch folder. On first run this folder can be empty.
Also, you need to do a checkout of `gh-pages` branch, even it doesn't exist yet.

Default `gh-pages`

```yaml
- name: Get Allure history
  uses: actions/checkout@v5
  if: always()
  continue-on-error: true
  with:
    ref: gh-pages
    path: gh-pages
```

### `allure_history`

**Required** The relative path to the folder, that will be published to GitHub Pages.

Default `allure-history`

### `subfolder`

The relative path to the project folder, if you have few different projects in the repository. 
This relative path also will be added to GitHub Pages link.

Default ``

## Example usage (local action)

```yaml
- name: Test local action
  uses: ./allure-report-action
  if: always()
  id: allure-report
  with:
    allure_results: build/allure-results
    gh_pages: gh-pages
    allure_report: allure-report
    allure_history: allure-history
```

## Example usage (github action)

```yaml
- name: Test marketplace action
  uses: step-security/allure-report-action@v1
  if: always()
  id: allure-report
  with:
    allure_results: build/allure-results
    gh_pages: gh-pages
    allure_report: allure-report
    allure_history: allure-history
```

## Example usage (build to publish on different repo)

```yaml
- name: Test here and host elsewhere
  uses: step-security/allure-report-action@v1
  if: always()
  id: allure-report
  with:
    allure_results: build/allure-results
    gh_pages: gh-pages
    allure_report: allure-report
    allure_history: allure-history
    github_repo: your-org/allure-reports-host-server
    github_repo_owner: your-org
```
