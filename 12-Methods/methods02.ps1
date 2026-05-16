2# function Verb-Noun

function Create-Configration {   
    [CmdletBinding()]
    param (#ValueFromPipelineByPropertyName help me to pick value from object property name 
        [Parameter(Mandatory ,ValueFromPipeline,ValueFromPipelineByPropertyName)]
        [string]
        $Name,
        [Parameter(ValueFromPipelineByPropertyName)]
        [string]
        $Version = "1.0.0",
        [Parameter(Mandatory = $true)]
        [string]
        $Path,  
        [parameter(ValueFromPipelineByPropertyName)]
        [string]
        [Alias("Os")]
        [ValidateSet("Linux", "Windows")]
        $OperatingSystem = "Windows"
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
            $OperatingSystem | Out-File -FilePath "$path\$($Name).cfg" -Append -Force
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

$ConfigPath = ".\12-Methods\Configs"


# ValueFromPipelineByPropertyName
$IISServer =  [PSCustomObject]@{
    Name = "ISSServer2002"
    Version = "1.0.3"
    Os = "Windows"
}
$IISServer | Create-Configration -Path $ConfigPath 


$Servers = Import-Csv  -Path ".\12-Methods\servers.csv" -Delimiter ','
$Servers | Create-Configration -Path $ConfigPath -Verbose

