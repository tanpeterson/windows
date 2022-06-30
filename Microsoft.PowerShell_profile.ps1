# For the first time install Terminal-Icons with
# Install-Module -Name Terminal-Icons -Repository PSGallery
Import-Module Terminal-Icons

oh-my-posh --init --shell pwsh --config ~/ohmyposh-theme.omp.json | Invoke-Expression

# History

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

# Alias



# Directory Alias

function work {
    cd "~/desktop/work"
}

# Git

function gwa {
    work
    git worktree add $args
    cd "~/desktop/work/$args"
    #echo ".env file info here" >> .env
    npm i
    code .
}

function bare($link, $name) {
  git clone --bare $link $name
}

function grb {
  git pull --rebase origin master
}

function gfp {
    git push -f origin $args
}

function gp {
    git push --set-upstream origin $args
}

function gco {
    git add .
    git commit -m $args
}

function gfeat {
    if($null -eq $args[1]) {
        gco "feat: $($args[0])"
    }else {
        gco "feat($($args[0])): $($args[1])"
    }
}

function gfix {
    if($null -eq $args[1]) {
        gco "fix: $($args[0])"
    }else {
        gco "fix($($args[0])): $($args[1])"
    }
}

function gtest {
    if($null -eq $args[1]) {
        gco "test: $($args[0])"
    }else {
        gco "test($($args[0])): $($args[1])"
    }
}

function gdocs {
    if($null -eq $args[1]) {
        gco "docs: $($args[0])"
    }else {
        gco "docs($($args[0])): $($args[1])"
    }
}

function gstyle {
    if($null -eq $args[1]) {
        gco "style: $($args[0])"
    }else {
        gco "style($($args[0])): $($args[1])"
    }
}

function grefactor {
    if($null -eq $args[1]) {
        gco "refactor: $($args[0])"
    }else {
        gco "refactor($($args[0])): $($args[1])"
    }
}

function gperf {
    if($null -eq $args[1]) {
        gco "perf: $($args[0])"
    }else {
        gco "perf($($args[0])): $($args[1])"
    }
}

function gchore {
    if($null -eq $args[1]) {
        gco "chore: $($args[0])"
    }else {
        gco "chore($($args[0])): $($args[1])"
    }
}

function goops {
    git add .
    git commit --amend --no-edit
}

# Macros

# Inspired by Scott's profile https://gist.github.com/shanselman/25f5550ad186189e0e68916c6d7f44c3
Set-PSReadLineKeyHandler -Key Ctrl+Shift+b `
    -BriefDescription BuildCurrentDirectory `
    -LongDescription "Build the current directory" `
    -ScriptBlock {
        [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
        if(Test-Path -Path ".\package.json") {
            [Microsoft.PowerShell.PSConsoleReadLine]::Insert("npm run build")
        }else {
            [Microsoft.PowerShell.PSConsoleReadLine]::Insert("dotnet build")
        }
        [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
    }

Set-PSReadLineKeyHandler -Key Ctrl+Shift+t `
    -BriefDescription BuildCurrentDirectory `
    -LongDescription "Build the current directory" `
    -ScriptBlock {
        [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
        if(Test-Path -Path ".\package.json") {
            [Microsoft.PowerShell.PSConsoleReadLine]::Insert("npm run test")
        }else {
            [Microsoft.PowerShell.PSConsoleReadLine]::Insert("dotnet test")
        }
        [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
    }

Set-PSReadLineKeyHandler -Key Ctrl+Shift+s `
    -BriefDescription StartCurrentDirectory `
    -LongDescription "Start the current directory" `
    -ScriptBlock {
        [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
        if(Test-Path -Path ".\package.json") {
            [Microsoft.PowerShell.PSConsoleReadLine]::Insert("npm start")
        }else {
            [Microsoft.PowerShell.PSConsoleReadLine]::Insert("dotnet run")
        }
        [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
    }
