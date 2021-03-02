#imports#

# Read config file and save to object or array #
$JSON = get-content "$PSScriptRoot\config.txt"
$Config = $JSON | ConvertFrom-Json
$Config

#Global Variables#
$DateTime = get-date -format("yyyy-MM-ddHH:mm")
$DateTime

#Make request to USGS API to pull data for current time. Need level and flow#
$WebRequest = Invoke-WebRequest $Config.siteURL 
$WebStatus = $WebRequest.StatusCode
if($WebStatus -eq 200){
    $WebContent = $WebRequest.Content | convertFrom-JSON
    $WebData = $WebContent.value.timeSeries.values.value
    $WebData_Flow, $WebData_Level = $WebData
    $WebData

    $Config.attempts = 0

}else{
    write-host "There was a problem connecting to USGS REST-API"

    #IF request failed record time and save in missedTimes#
    $Config.missedTimes += "$DateTime"

    #IF request failed read config file for missed attempts, change value to increase by one 
    $Config.attempts = [int]$Config.attempts + 1

    #if attempts not exceed 3 email to email list#
    if($Config.attempts -le 3){

        #CREATE SEND EMAIL FUNCTION#

    }#END_IF#
}#END_if/else

#check missed.txt for timestamps to check with API for. #
    #Add results to array of objects#



# Read config object for model of database versus object property names
    # CREATE FUNCTION FOR SQLITE

    # Send a copy of each object to sqlite database. #

# Read config object to match up model of pi tags to object property names #
    # CREATE FUNCTION FOR PI #

    # Send a copy of each object to PI #



#functions#

#Main#

#Export#
