# Initializes system data registers

function Initialize-DataRegisters {
    param (
        [Parameter(Position=0,Mandatory=$false,helpMessage="Set the number of data registers (Default: 16)")]
        [int32] $size = 16
    )

    $trueSize = $size-1

    $dataRegisterArray = @{}

    for ($iterator = 0; $iterator -le $trueSize; $iterator++) {
        $hex = "{0:X}" -f $iterator
        #Write-Host $hex.GetType()
        $dataRegisterArray.Add("V$($hex)", 0)
    }

    if ($PSBoundParameters.ContainsKey('Debug')) {
        Write-Debug "Initialized Data Registers:`n $($dataRegisterArray | Format-Table -AutoSize | Out-String)"
    }

    return $dataRegisterArray
}