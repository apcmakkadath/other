Get-ChildItem "C:\Users\aravind.chaliyadath\temp" -Filter *.txt | Foreach-Object 
{
    
      #$content=Get-Content -ReadCount 1000
        wtite-host("$_")
     

}

##================================================================================

<#1..100 | ForEach-Object { Add-Content -Path .\LineNumbers.txt -Value "This is line $_." }
Get-Content -Path .\LineNumbers.txt#>
#$dirtywords="C:\Users\chaliyadath.aravind\Documents\dirtywords.txt"

[string[]]
 
foreach($file in Get-ChildItem -File .)
{
    $keywords= Get-Content -Path "C:\Users\chaliyadath.aravind\Documents\dirtywords.txt"
    $keywords | foreach($_){
    #write-host("$_ $file")
    (Get-Content -ReadCount 1000 $file) -replace "$_", "kxB09Iui" | Set-Content "$file.processed"
    }
}


##================================================================================

[string[]]$keywords= Get-Content -Path "C:\Users\chaliyadath.aravind\Documents\dirtywords.txt"
#$keywords | foreach ($_) {write-host("$_")}
#foreach($line in $keywords){((Get-Content .\file1.txt) -replace "$line", 'xxxxx')}

