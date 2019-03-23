$erroractionpreference = "stop"

function test ($name, $tools, $expected) {
  $actual = invoke-expression ".\missing_tools.bat $tools"
  $success = "$actual" -eq "$expected"
  if (!$success) { $host.setshouldexit(1) }
  if (!$success) { write-host "o" -nonewline -foregroundcolor:red }
  else { write-host "x" -nonewline -foregroundcolor:green }
  write-host " $name"
  write-host "  > $tools"
  write-host "    '$actual' " -nonewline
  if (!$success) { write-host "!=" -nonewline -foregroundcolor:red }
  else { write-host "==" -nonewline -foregroundcolor:green }
  write-host " '$expected'`n"
}

test "binary in current directory" "exists.exe" ""
test "binary in `$PATH" "git.exe" ""
test "1x non-existent binary" "non-existent-1.exe" "non-existent-1.exe"
test "2x non-existent binaries" "non-existent-1.exe non-existent-2.exe" "non-existent-1.exe, and non-existent-2.exe"
test "3x non-existent binaries" "non-existent-1.exe non-existent-2.exe non-existent-3.exe" "non-existent-1.exe, non-existent-2.exe, and non-existent-3.exe"
test "1x existent binary, 3x non-existent binaries, 1x existent binary" "exists.exe non-existent-1.exe non-existent-2.exe non-existent-3.exe exists.exe" "non-existent-1.exe, non-existent-2.exe, and non-existent-3.exe"
