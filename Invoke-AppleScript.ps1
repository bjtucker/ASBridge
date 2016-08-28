<#
.SYNOPSIS
    Run an AppleScript on the host machine.
.DESCRIPTION
    Accepts an AppleScript as a string argument or pipleine input. Runs the
    provided script using osascript. Returns the output as a string to the pipeline.

    AppleScript only runs on Macs. Tested on MacOS 10.11.

.EXAMPLE
    PS> "1 + 1" | invoke-applescript

    2
.EXAMPLE
    PS> invoke-applescript -script "return 1 + 1"

    2
.PARAMETER Script
    A string containing the AppleScript to run.

#>
function Invoke-AppleScript {
    [CmdletBinding(PositionalBinding=$false,
                   ConfirmImpact='Medium')]
    [Alias()]
    [OutputType([String])]
    Param (
        # Param1 help description
        [Parameter(Mandatory=$true,
                   Position=0,
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true)]
        $Script
    )
    process {
        $Script | osascript
    }
}
