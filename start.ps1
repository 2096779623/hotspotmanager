. ".\init.ps1"
if ($tetheringManager.TetheringOperationalState -eq "On")
{
    echo "��⵽�ѿ����ȵ㣬����Ҫ�ٴο�����"
    exit 0
} else
{
    $tetheringManager.StartTetheringAsync()| Out-Null
    sleep 5
        if ($tetheringManager.TetheringOperationalState -eq "On")
    {
        echo "�ɹ������ȵ㣡"
    } else {
        echo "�����ȵ�ʧ�ܣ�"
    }
}