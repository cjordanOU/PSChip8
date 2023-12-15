# Initializes system timer

function Initialize-SystemTimer {
    param (
        [Parameter(Position=0,Mandatory=$false,HelpMessage="Set the hertz of the display timer (Default: 60)")]
        [int32] $hertz = 60,

        [Parameter(Position=1,Mandatory=$false,HelpMessage="Set the hertz of the display timer (Default: 60)")]
        [switch] $soundTimerMode
    )

    [float] $delayTimer = 255
    $delay = [Math]::Round(1000/$hertz,2)
    $decrement = [Math]::Round((256/$delay),2)
    Write-Debug "Delay Timer decrementing every $delay milliseconds"

    $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
    $totalTime = [System.Diagnostics.Stopwatch]::StartNew()

    while ($delayTimer -gt 0) {
        if ($stopwatch.ElapsedMilliseconds -ge ($delay * 3.5)) {
            # TODO // fix logic hack in if statement
            $delayTimer = [Math]::Round($delayTimer - $decrement,0)
            if ($delayTimer -le 0) {
                $delayTimer = 0
            }
            Write-Debug "Delay Timer at $delayTimer [Elapsed: $($totalTime.ElapsedMilliseconds)ms]"
            $stopwatch.Restart()
            if ($soundTimerMode -eq $true) {
                [Console]::Beep(500,$($delay*3.5))
            }
        }
    }

    return 0
}