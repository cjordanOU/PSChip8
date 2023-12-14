# Initializes system data registers

function Initialize-Display {
    param (
        [Parameter(Position=0,Mandatory=$false,helpMessage="Set the height of the display (Default: 64)")]
        [int32] $height = 64,

        [Parameter(Position=1,Mandatory=$false,helpMessage="Set the width of the display (Default: 32)")]
        [int32] $width = 32
    )

    Add-Type -AssemblyName System.Windows.Forms
    $Form = New-Object System.Windows.Forms.Form
    $Form.Text = "64x32 Window with Black Background"
    $Form.BackColor = [System.Drawing.Color]::Black
    $Form.Size = New-Object System.Drawing.Size(1280, 720)
    $Form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
    $Form.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
    $Form.ShowDialog()
}

Initialize-Display