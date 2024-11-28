## Joseph Sinclair Gradle config
## Adapted to fish from https://github.com/jsync-swirlds/public-scripts/blob/main/.alias

# Define gradle_cmd as a function instead of a variable (formerly a GRADLE variable in bash)
function gradle_cmd
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
alias grdlProjects 'gradle_cmd projects $GRADLE_CLEAN_OPTS'
alias grdlClean 'gradle_cmd clean --warning-mode=summary $GRADLE_PARALLEL_OPTS $GRADLE_CLEAN_OPTS'
alias grdlTest 'gradle_cmd assemble $GRADLE_COMPILE_OPTS; and gradle_cmd test $GRADLE_TEST_OPTS'
alias grdlHapi 'gradle_cmd hapiTest -Dsonar.gradle.skipCompile=true $GRADLE_TEST_OPTS $GRADLE_CLEAN_OPTS'
alias grdlModules 'gradle_cmd checkAllModuleInfo $GRADLE_COMPILE_OPTS'
alias grdlCompile 'gradle_cmd assemble $GRADLE_COMPILE_OPTS'
alias grdlCleanCompile 'gradle_cmd clean assemble $GRADLE_COMPILE_OPTS'
alias grdlCleanTest 'grdlCleanCompile; and gradle_cmd test $GRADLE_TEST_OPTS'
alias grdlScanTest 'grdlCleanCompile; and gradle_cmd test $GRADLE_TEST_OPTS $GRADLE_CLEAN_OPTS --scan'
alias grdlFastTest 'gradle_cmd test --warning-mode=summary $GRADLE_TEST_OPTS'
alias grdlExtraCleanTest 'grdlCleanCompile; and grdlModules; and gradle_cmd test $GRADLE_TEST_OPTS $GRADLE_CLEAN_OPTS'
alias grdlSpotless 'grdlCompile; and gradle_cmd $GRADLE_PARALLEL_OPTS $GRADLE_CLEAN_OPTS checkAllModuleInfo spotlessCheck --warning-mode=summary -Dsonar.gradle.skipCompile=true'
alias grdlReformat 'gradle_cmd $GRADLE_PARALLEL_OPTS $GRADLE_CLEAN_OPTS spotlessApply --warning-mode=summary -Dsonar.gradle.skipCompile=true'
alias finalPRChecks 'grdlReformat; and grdlExtraCleanTest; and gradle_cmd build --warning-mode=summary $GRADLE_TEST_OPTS; and grdlHapi'
alias pbjInt 'gradle_cmd $GRADLE_CLEAN_OPTS clean :generatePbjSource :generateProto; and gradle_cmd $GRADLE_CLEAN_OPTS assemble test $GRADLE_PARALLEL_OPTS $GRADLE_UT_OPTS'
alias pbjCore 'gradle_cmd clean assemble test $GRADLE_PARALLEL_OPTS $GRADLE_UT_OPTS publishToMavenLocal'
