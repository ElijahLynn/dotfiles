## Joseph Sinclair Gradle config
## Adapted to fish from https://github.com/jsync-swirlds/public-scripts/blob/main/.alias

# Define GRADLE_CMD as a function instead of a variable (formerly a GRADLE variable in bash)
function GRADLE_CMD
    if test -f "./gradlew"
        nice -n 20 ./gradlew $argv
    else
        echo "Error: gradlew not found in current directory"
        return 1
    end
end

set --export GRADLE_UT_OPTS ' -Dtestlogger.showPassed=false -Dtestlogger.showSkipped=false -Dtestlogger.showPassedStandardStreams=false -Dtestlogger.theme=mocha-parallel '
set --export GRADLE_PARALLEL_OPTS '--parallel --max-workers=12'
set --export GRADLE_CLEAN_OPTS --no-daemon --no-build-cache --no-configuration-cache
set --export GRADLE_COMPILE_OPTS "-Dsonar.gradle.skipCompile=true --warning-mode=summary $GRADLE_PARALLEL_OPTS $GRADLE_CLEAN_OPTS"
set --export GRADLE_TEST_OPTS "--no-daemon $GRADLE_PARALLEL_OPTS $GRADLE_UT_OPTS"
alias grdlProjects 'GRADLE_CMD projects $GRADLE_CLEAN_OPTS'
alias grdlClean 'GRADLE_CMD clean --warning-mode=summary $GRADLE_PARALLEL_OPTS $GRADLE_CLEAN_OPTS'
alias grdlTest 'GRADLE_CMD assemble $GRADLE_COMPILE_OPTS; and GRADLE_CMD test $GRADLE_TEST_OPTS'
alias grdlHapi 'GRADLE_CMD hapiTest -Dsonar.gradle.skipCompile=true $GRADLE_TEST_OPTS $GRADLE_CLEAN_OPTS'
alias grdlModules 'GRADLE_CMD checkAllModuleInfo $GRADLE_COMPILE_OPTS'
alias grdlCompile 'GRADLE_CMD assemble $GRADLE_COMPILE_OPTS'
alias grdlCleanCompile 'GRADLE_CMD clean assemble $GRADLE_COMPILE_OPTS'
alias grdlCleanTest 'grdlCleanCompile; and GRADLE_CMD test $GRADLE_TEST_OPTS'
alias grdlScanTest 'grdlCleanCompile; and GRADLE_CMD test $GRADLE_TEST_OPTS $GRADLE_CLEAN_OPTS --scan'
alias grdlFastTest 'GRADLE_CMD test --warning-mode=summary $GRADLE_TEST_OPTS'
alias grdlExtraCleanTest 'grdlCleanCompile; and grdlModules; and GRADLE_CMD test $GRADLE_TEST_OPTS $GRADLE_CLEAN_OPTS'
alias grdlSpotless 'grdlCompile; and GRADLE_CMD $GRADLE_PARALLEL_OPTS $GRADLE_CLEAN_OPTS checkAllModuleInfo spotlessCheck --warning-mode=summary -Dsonar.gradle.skipCompile=true'
alias grdlReformat 'GRADLE_CMD $GRADLE_PARALLEL_OPTS $GRADLE_CLEAN_OPTS spotlessApply --warning-mode=summary -Dsonar.gradle.skipCompile=true'
alias finalPRChecks 'grdlReformat; and grdlExtraCleanTest; and GRADLE_CMD build --warning-mode=summary $GRADLE_TEST_OPTS; and grdlHapi'
alias pbjInt 'GRADLE_CMD $GRADLE_CLEAN_OPTS clean :generatePbjSource :generateProto; and GRADLE_CMD $GRADLE_CLEAN_OPTS assemble test $GRADLE_PARALLEL_OPTS $GRADLE_UT_OPTS'
alias pbjCore 'GRADLE_CMD clean assemble test $GRADLE_PARALLEL_OPTS $GRADLE_UT_OPTS publishToMavenLocal'
