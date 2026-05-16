2# function Verb-Noun

function Create-Configration {   
    [CmdletBinding()]
    param (
        [Parameter(Mandatory ,ValueFromPipeline, ValueFromPipelineByPropertyName,ValueFromRemainingArguments)]
        [string]
        $Name,
        [Parameter()]
        [string]
        $Version = "1.0.0",
        [Parameter(Mandatory = $true)]
        [string]
        $Path,  
        [parameter()]
        [string]
        [ValidateSet("Linux", "Windows")]
        $Os = "Windows"
    ) 

    begin {
        Write-Verbose "Begin Block" # verbose is telling the user what is going on 
        # you can use it to open connection with database
        $CounterPassed = 0 
        $CounterFailed = 0
    }

    process {
        try {
        
            Write-Verbose "From my function $Name with $Version , Path : $Path"
            New-Item -Path "$Path" -Name "$Name.cfg" -ItemType File -ErrorAction Stop
            $Version | Out-File -FilePath "$Path\$($Name).cfg"
            $os | Out-File -FilePath "$path\$($Name).cfg" -Append -Force
            $CounterPassed++
        }
        catch {
            Write-Output "From catch"
            Write-Output $_.Exception.Message
            $CounterFailed++
        }
        Write-Debug "Configration Created : $CounterPassed , Configration Failed : $CounterFailed"   
    }


    end {
        Write-Verbose "End block"    
        # you can use it to close connection with database    
        Write-Output "Configration Created : $CounterPassed , Configration Failed : $CounterFailed"
    }
}



$Names = @("Test01", "Test02", "Test03","Test04")


$Names | Create-Configration -Path "012-Methods\Configs" -Version "1.0.2" -os Linux -Verbose -Debug


Get-ChildItem -Path "012-Methods\Configs" | Remove-Item
