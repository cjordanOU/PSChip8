# Initializes system memory

function Initialize-Memory {
    param (
        [Parameter(Position=0,Mandatory=$false,HelpMessage="Set the size of the emulated system memory in kilobytes (Default: 4)")]
        [int32] $size = 4
    )

    $memorySize = $size * 1024

    [array] $memoryArray = New-Object byte[] $memorySize

    Write-Debug "The size of the array is $([math]::Round($memoryArray.Length / 1KB, 2)) kilobytes."

    return $memoryArray
}