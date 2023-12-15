# Initializes system display

function Initialize-Display {
    param (
        [Parameter(Position=0,Mandatory=$false,helpMessage="Set the height of the display (Default: 64)")]
        [int32] $height = 32,

        [Parameter(Position=1,Mandatory=$false,helpMessage="Set the width of the display (Default: 32)")]
        [int32] $width = 64,

        [Parameter(Position=2,Mandatory=$false,helpMessage="Set the scaling of the display (Default: 4)")]
        [int32] $scale = 4
    )

    $form = New-Object System.Windows.Forms.Form
    $form.Text = "PSChip8"
    $form.BackColor = [System.Drawing.Color]::Gray
    $form.Size = New-Object System.Drawing.Size($(($width*$scale)+$width+$width),$(($height*$scale)+$height*$scale))
    $form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
    $form.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen

    $panel = New-Object System.Windows.Forms.Panel
    $panel.Location = New-Object System.Drawing.Point($(($form.Width - $panel.Width) / 2), $(($form.Height - $panel.Height) / 2))
    $panel.Size = New-Object System.Drawing.Size($($width*$scale), $($height*$scale))
    $panel.BackColor = [System.Drawing.Color]::Black
    $form.Controls.Add($panel)

    Write-Debug "Display initialized with width: $($width)px ($($width*$scale)), height: $($height)px ($($height*$scale)), scale: $($scale)x"

    return $form, $panel
}
