
(Get-Content test.txt) `
    -replace '\w+\.sdp.smartdubai.ae', 'hostname.organization' `
    -replace '\d+\.\d+\.\d+\.\d+', '0.0.0.0' | Set-Content test.txt
    }
