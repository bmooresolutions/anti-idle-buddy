Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

function Simulate-MouseMove {
    $pos = [System.Windows.Forms.Cursor]::Position
    $x = $pos.X
    $y = $pos.Y
    $newPos = New-Object System.Drawing.Point ($x + 1), ($y + 1)
    [System.Windows.Forms.Cursor]::Position = $newPos
    Start-Sleep -Milliseconds 100
    [System.Windows.Forms.Cursor]::Position = $pos
}

function Hold-W-Key {
    $signature = @"
[DllImport("user32.dll", SetLastError=true)]
public static extern void keybd_event(byte bVk, byte bScan, int dwFlags, int dwExtraInfo);
"@
    $type = Add-Type -MemberDefinition $signature -Name "Keyboard" -Namespace "WinAPI" -PassThru
    $VK_W = 0x57
    $KEYEVENTF_KEYDOWN = 0x0000
    $KEYEVENTF_KEYUP = 0x0002

    # Press and hold W
    $type::keybd_event($VK_W, 0, $KEYEVENTF_KEYDOWN, 0)
    Start-Sleep -Seconds 4
    # Release W
    $type::keybd_event($VK_W, 0, $KEYEVENTF_KEYUP, 0)
}

while ($true) {
    Simulate-MouseMove
    Hold-W-Key
    Start-Sleep -Seconds 28  # 32 seconds total: 4s hold + 28s wait
}
