Add-Type -AssemblyName System.Windows.Forms
$openFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$openFileDialog.InitialDirectory = "C:\"
$openFileDialog.Filter = "Boot files (*.img)|*.img|All files (*.*)|*.*"
$openFileDialog.ShowDialog() | Out-Null
$openFileDialog.FileName