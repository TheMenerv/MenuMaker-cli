########################
# DEVELOPPED BY MENERV #
#  version: 19.09.001  #
########################


 Clear-Host


# - Description: This function create and display menu.
# - Parameters:
#   - $Title:
#       - Type: String
#       - Description: The title that display in menu's header
#  - $Choices:
#       - Type: Array[Objects] where Objects is {number, label, response}
#       - Description: Contain a list of available choices where:
#           - number is the number that the user must be enter for select this choice
#           - label is string that contain a description of this choice
#           - response is the string that this function return for this choice (Cannot be 'unknow')
function MenuMaker($Title, $Choices) {

    # Loop in menu while user haven't selected a valid choice
    Do{

        # Default response
        $Response = "unknow"
        
        # Displaying Menu
        Clear-Host
        Write-Host "========== " $Title " =========="
        ForEach ($Choice in $Choices) {
            Write-Host $Choice.number ":" $Choice.label
        }
        $Selection = Read-Host "Please make a selection"

        # Check value submited by user
        ForEach ($Choice in $Choices) {
            if($Selection -eq $Choice.number) {
                $Response = $Choice.response
            }
        }

    } while ($Response -eq 'unknow')
    
    # Return the response
    return $Response

}

# HOW TO USE THIS FUNCTION:
# 1. first, create an array that contain object who represents the available choices for your menu
$OSMenuModel = @(
    @{ 'number' = '1'; 'label' = 'My operating system is Windows 10'; 'response' = 'Windows 10' }
    @{ 'number' = '2'; 'label' = 'My operating system is Windows 7'; 'response' = 'Windows 7' }
)
# 2. second, create, display and get the result of menu
$OS = MenuMaker "What is your operating system?" $OSMenuModel

# The menu was display with this format:

# ==========  What is your operating system?  ==========
# 1 : My operating system is Windows 10
# 2 : My operating system is Windows 7
# Please make a selection: 

# $OS contain 'Windows 10' or 'Windows 7', depending that the user's choice

# You can re-use the Menu Maker:
$ComputerMenuModel = @(
    @{ 'number' = '1'; 'label' = 'My computer is Dell'; 'response' = 'Dell' }
    @{ 'number' = '2'; 'label' = 'My computer is HP'; 'response' = 'HP' }
)
$Model = MenuMaker "What is your computer model?" $ComputerMenuModel
