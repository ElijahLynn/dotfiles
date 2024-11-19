abbr -a -- amend 'git commit --amend --no-edit'
abbr -a -- cdgr 'cd (git rev-parse --show-toplevel)'
abbr -a -- ch 'chezmoi'
abbr -a -- code 'code-insiders'
abbr -a -- dep 'ssh deploy'
abbr -a -- g 'git'
abbr -a -- ga 'git add'
abbr -a -- gaa 'git add --all'
abbr -a -- gap 'git add --patch'
abbr -a -- gau 'git add --update'
abbr -a -- gay 'git apply'
abbr -a -- gb 'go build'
abbr -a -- gc 'git commit'
abbr -a -- gca 'git commit --amend'
abbr -a -- gg 'git graph'
abbr -a -- gd  'git diff'
abbr -a -- gds 'git diff --staged'
abbr -a -- gf 'git fetch'
abbr -a -- gfa 'git fetch --all'
abbr -a -- gl 'git log --oneline'
abbr -a -- gpush 'git push'
abbr -a -- gpop 'git stash pop'
abbr -a -- gpull 'git pull'
abbr -a -- grs 'git restore --staged'
abbr -a -- gs 'git status'
abbr -a -- gstash 'git stash'
abbr -a -- hm 'history --merge'
abbr -a -- ip-remote 'curl --silent ipinfo.io/ip | tee /dev/tty | pbcopy'
abbr -a -- ip-local 'ipconfig getifaddr en0 | tee /dev/tty | pbcopy'
abbr -a -- ipu 'ip-update'
abbr -a -- ku 'kubectl'
abbr -a -- ll 'ls -al'
abbr -a -- sub 'ssh submit'
abbr -a -- tf 'terraform'
abbr -a -- ts 'tcp_states'

## Joseph Sinclair Aliases
## https://github.com/jsync-swirlds/public-scripts/blob/main/.alias
abbr -a grdlProjects "$GRADLE projects $GRADLE_CLEAN_OPTS"
abbr -a grdlClean "$GRADLE clean --warning-mode=summary $GRADLE_PARALLEL_OPTS $GRADLE_CLEAN_OPTS"
abbr -a grdlTest "$GRADLE assemble $GRADLE_COMPILE_OPTS && $GRADLE test $GRADLE_TEST_OPTS"
abbr -a grdlHapi "$GRADLE hapiTest -Dsonar.gradle.skipCompile=true $GRADLE_TEST_OPTS $GRADLE_CLEAN_OPTS"
abbr -a grdlModules "$GRADLE checkAllModuleInfo $GRADLE_COMPILE_OPTS"
abbr -a grdlCompile "$GRADLE assemble $GRADLE_COMPILE_OPTS"
abbr -a grdlCleanCompile "$GRADLE clean assemble $GRADLE_COMPILE_OPTS"
abbr -a grdlCleanTest "grdlCleanCompile && $GRADLE test $GRADLE_TEST_OPTS"
abbr -a grdlScanTest "grdlCleanCompile && $GRADLE test $GRADLE_TEST_OPTS $GRADLE_CLEAN_OPTS --scan"
abbr -a grdlFastTest "$GRADLE test --warning-mode=summary $GRADLE_TEST_OPTS"
abbr -a grdlExtraCleanTest "grdlCleanCompile && grdlModules && $GRADLE test $GRADLE_TEST_OPTS $GRADLE_CLEAN_OPTS"
abbr -a grdlSpotless "grdlCompile && $GRADLE $GRADLE_PARALLEL_OPTS $GRADLE_CLEAN_OPTS checkAllModuleInfo spotlessCheck --warning-mode=summary -Dsonar.gradle.skipCompile=true"
abbr -a grdlReformat "$GRADLE $GRADLE_PARALLEL_OPTS $GRADLE_CLEAN_OPTS spotlessApply --warning-mode=summary -Dsonar.gradle.skipCompile=true"
abbr -a finalPRChecks "grdlReformat && grdlExtraCleanTest && $GRADLE build --warning-mode=summary $GRADLE_TEST_OPTS && grdlHapi"
abbr -a pbjInt "$GRADLE $GRADLE_CLEAN_OPTS clean :generatePbjSource :generateProto && $GRADLE $GRADLE_CLEAN_OPTS assemble test $GRADLE_PARALLEL_OPTS $GRADLE_UT_OPTS"
abbr -a pbjCore "$GRADLE $GRADLE_CLEAN_OPTS clean assemble test $GRADLE_PARALLEL_OPTS $GRADLE_UT_OPTS publishToMavenLocal"

