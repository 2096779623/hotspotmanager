. ".\init.ps1"
if ($tetheringManager.TetheringOperationalState -eq "On")
{
    $tetheringManager.StopTetheringAsync()| Out-Null
    sleep 5
    if ($tetheringManager.TetheringOperationalState -eq "Off")
    {
        echo "成功关闭热点！"
    } else {
        echo "关闭热点失败！"    
    }
} else
{
    echo "没有开启热点，不需要关闭！"
}