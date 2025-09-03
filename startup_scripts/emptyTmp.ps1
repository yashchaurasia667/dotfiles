$DIR = "C:/Tmp/"

function Empty-Dir {
  if (-not (Test-Path -Path $DIR)) {
    Write-Host "$DIR not found, Creating it"
    New-Item -Path $DIR -ItemType Directory | Out-Null
  } else {
    Write-Host "Clearing all contents from $DIR"
    Remove-Item "$DIR\*" -Recurse -Force
  }
}

Empty-Dir
Write-Host "Script finished"
