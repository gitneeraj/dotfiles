return {
    lintCommand = './node_modules/.bin/eslint --stdin --stdin-filename ${INPUT} -f visualstudio',
    lintStdin = true,
    lintFormats = {"%f(%l,%c): %tarning %m", "%f(%l,%c): %rror %m"},
    lintIgnoreExitCode = true,
    formatCommand = "./node_modules/.bin/eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}
