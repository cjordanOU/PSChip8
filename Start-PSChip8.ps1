#############################################################################################################################
## Includes
#Add-Type -AssemblyName System.Drawing


#############################################################################################################################
## Import functions

# Initializes system memory
. "$($PSScriptRoot)\system\Initialize-Memory.ps1"

# Initializes system data registers
. "$($PSScriptRoot)\system\Initialize-DataRegisters.ps1"



#############################################################################################################################
## Main Logic

$memoryArray = Initialize-Memory

$dataRegisterArray = Initialize-DataRegisters -Debug

