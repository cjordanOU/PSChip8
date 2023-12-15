#############################################################################################################################
## Includes
Add-Type -AssemblyName System.Windows.Forms

#############################################################################################################################
## Import functions

# Memory
. "$($PSScriptRoot)\system\Initialize-Memory.ps1"

# Data Registers
. "$($PSScriptRoot)\system\Initialize-DataRegisters.ps1"

# Display
. "$($PSScriptRoot)\system\Initialize-Display.ps1"

# Timer
. "$($PSScriptRoot)\system\Initialize-SystemTimer.ps1"

#############################################################################################################################
## Main Logic

# Initialize Memory
[Array] $memoryArray = Initialize-Memory

# Initialize Registers
[Array] $dataRegisterArray = Initialize-DataRegisters
$indexRegister = New-Object System.UInt16

# Initialize Display
[Array] $display = Initialize-Display -height 128
#$display[0].ShowDialog()

# Initialize Timers
[Int16] $delayTimer = Initialize-SystemTimer
[Int16] $soundTimer = Initialize-SystemTimer -soundTimerMode

# Initialize Stack
$stack = New-Object System.Collections.Stack

Measure-Command { Initialize-SystemTimer -soundTimerMode }
Measure-Command { Initialize-SystemTimer }
