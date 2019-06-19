$outputFile = "out.csv"
if (Test-Path $outputFile) 
{
  Remove-Item $OutputFile
}

$Database = Get-Content "Database.txt" | ConvertFrom-Csv
$Other = Get-Content "Other.txt" | ConvertFrom-Csv
Compare-Object $Database $Other -Property keycol -ExcludeDifferent -IncludeEqual -PassThru | Export-Csv $outputFile -NoTypeInformation

