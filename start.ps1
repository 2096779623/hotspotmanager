. ".\init.ps1"
if ($tetheringManager.TetheringOperationalState -eq "On")
{
    echo "检测到已开启热点，不需要再次开启！"
    exit 0
} else
{
    $tetheringManager.StartTetheringAsync()| Out-Null
    sleep 5
        if ($tetheringManager.TetheringOperationalState -eq "On")
    {
        echo "成功开启热点！"
    } else {
        echo "开启热点失败！"
    }
}