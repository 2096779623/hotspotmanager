. ".\init.ps1"
if ($tetheringManager.TetheringOperationalState -eq "On")
{
    $tetheringManager.StopTetheringAsync()| Out-Null
    sleep 5
    if ($tetheringManager.TetheringOperationalState -eq "Off")
    {
        echo "�ɹ��ر��ȵ㣡"
    } else {
        echo "�ر��ȵ�ʧ�ܣ�"    
    }
} else
{
    echo "û�п����ȵ㣬����Ҫ�رգ�"
}