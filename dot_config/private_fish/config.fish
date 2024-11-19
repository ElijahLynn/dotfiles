## Homebrew integration
eval (/opt/homebrew/bin/brew shellenv)

## https://iterm2.com/documentation-shell-integration.html
# Not needed in Warp, delete once I fully commit to Warp
# source ~/.iterm2_shell_integration.fish

## asdf support
## https://asdf-vm.com/guide/getting-started.html
source /opt/homebrew/opt/asdf/libexec/asdf.fish

## SDKMan Support
## https://github.com/sdkman/sdkman-cli/issues/671#issuecomment-1765078814
fish_add_path (find ~/.sdkman/candidates/*/current/bin -maxdepth 0)

## grep
## https://stackoverflow.com/a/77054092/292408
set --global --export PATH $HOMEBREW_PREFIX/opt/grep/libexec/gnubin $PATH

set --global fish_greeting ""


# function just_the_time --description 'Shows just the time in 24-hour format'
#     date +"%H:%M:%S"
# end

# Not needed in Warp, delete once I fully commit to Warp
# function fish_prompt
#     set --local return_code $status
#     echo "  "
#     echo ----------------------------------------------
#     echo -n (just_the_time)
#     echo " RC: $return_code"
#     echo ----------------------------------------------

#     set --global __fish_git_prompt_show_informative_status yes
#     set --global __fish_git_prompt_showuntrackedfiles yes
#     echo -e (set_color $fish_color_cwd) (prompt_pwd)(set_color brown)(fish_git_prompt)
#     echo (iterm2_prompt_mark) ""
# end

## Joseph Sinclair Gradle config
## https://github.com/jsync-swirlds/public-scripts/blob/main/.alias
set -x GRADLE 'nice -n 20 gradle '
set -x GRADLE_UT_OPTS ' -Dtestlogger.showPassed=false -Dtestlogger.showSkipped=false -Dtestlogger.showPassedStandardStreams=false -Dtestlogger.theme=mocha-parallel '
set -x GRADLE_PARALLEL_OPTS '--parallel --max-workers=12'
set -x GRADLE_CLEAN_OPTS '--no-daemon --no-build-cache --no-configuration-cache'
set -x GRADLE_COMPILE_OPTS "-Dsonar.gradle.skipCompile=true --warning-mode=summary $GRADLE_PARALLEL_OPTS $GRADLE_CLEAN_OPTS"
set -x GRADLE_TEST_OPTS "--no-daemon $GRADLE_PARALLEL_OPTS $GRADLE_UT_OPTS"
alias grdlProjects "$GRADLE projects $GRADLE_CLEAN_OPTS"
alias grdlClean "$GRADLE clean --warning-mode=summary $GRADLE_PARALLEL_OPTS $GRADLE_CLEAN_OPTS"
alias grdlTest "$GRADLE assemble $GRADLE_COMPILE_OPTS; and $GRADLE test $GRADLE_TEST_OPTS"
alias grdlHapi "$GRADLE hapiTest -Dsonar.gradle.skipCompile=true $GRADLE_TEST_OPTS $GRADLE_CLEAN_OPTS"
alias grdlModules "$GRADLE checkAllModuleInfo $GRADLE_COMPILE_OPTS"
alias grdlCompile "$GRADLE assemble $GRADLE_COMPILE_OPTS"
alias grdlCleanCompile "$GRADLE clean assemble $GRADLE_COMPILE_OPTS"
alias grdlCleanTest "grdlCleanCompile; and $GRADLE test $GRADLE_TEST_OPTS"
alias grdlScanTest "grdlCleanCompile; and $GRADLE test $GRADLE_TEST_OPTS $GRADLE_CLEAN_OPTS --scan"
alias grdlFastTest "$GRADLE test --warning-mode=summary $GRADLE_TEST_OPTS"
alias grdlExtraCleanTest "grdlCleanCompile; and grdlModules; and $GRADLE test $GRADLE_TEST_OPTS $GRADLE_CLEAN_OPTS"
alias grdlSpotless "grdlCompile; and $GRADLE $GRADLE_PARALLEL_OPTS $GRADLE_CLEAN_OPTS checkAllModuleInfo spotlessCheck --warning-mode=summary -Dsonar.gradle.skipCompile=true"
alias grdlReformat "$GRADLE $GRADLE_PARALLEL_OPTS $GRADLE_CLEAN_OPTS spotlessApply --warning-mode=summary -Dsonar.gradle.skipCompile=true"
alias finalPRChecks "grdlReformat; and grdlExtraCleanTest; and $GRADLE build --warning-mode=summary $GRADLE_TEST_OPTS; and grdlHapi"
alias pbjInt "$GRADLE $GRADLE_CLEAN_OPTS clean :generatePbjSource :generateProto; and $GRADLE $GRADLE_CLEAN_OPTS assemble test $GRADLE_PARALLEL_OPTS $GRADLE_UT_OPTS"
alias pbjCore "$GRADLE $GRADLE_CLEAN_OPTS clean assemble test $GRADLE_PARALLEL_OPTS $GRADLE_UT_OPTS publishToMavenLocal"

# Created by `pipx` on 2023-11-09 23:11:55
set PATH $PATH /Users/user/.local/bin
source ~/.config/fish/completions/kubectl.fish
