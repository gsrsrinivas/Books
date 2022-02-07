$strWMI = "\\" + $fileServer + "\root\cimv2:win32_LogicalShareSecuritySetting.Name='" + $share.name + "'"
$objWMI_ThisShareSec = [wmi]$strWMI




$shareSec = gwmi Win32_LogicalShareSecuritySetting -filter "name='$($share.name)'" 
if($shareSec) {  
$sd = $shareSec.invokeMethod('GetSecurityDescriptor',$null,$null)  
$ShareInfo += $sd.Descriptor.DACL 
