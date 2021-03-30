
function GetWhole($num){
    $res=0
    [Int]$step=$num.Length-1
    for ($j=0; $j -le $num.Length-1; $j++){
        $res+=[int]([string]$num.Chars($j))*[math]::pow(2,$step)
        $step-=1
    }
    return $res
}

function GetFrac($num){
    $res=0
    [Int]$step=-1
    for ($j=0; $j -le $num.Length-1; $j++){
        $res+=[int]([string]$num.Chars($j))*[math]::pow(2,$step)
        $step-=1
    }
    return $res
}



[string]$inputNumber=$args[0]
if (-not ($inputNumber | Select-String -Pattern '^-?[0-1]+\.?[0-1]*$' -Quiet)){
    Write-Output "error input"
    Exit
} 

#проверка на унарный знак 
[string]$firstChar = [string]$inputNumber.Substring(0,1)
$sing=''
if ( $firstChar -eq '-'){
    $inputNumber=$inputNumber.Substring(1, $inputNumber.Length -1 )
    $sing='-'
} else {
    if ( $firstChar -eq '+'){
    $inputNumber=$inputNumber.Substring(1, $inputNumber.Length -1 )
}}



# разделяем число 
[string]$wholePart=''
[string]$fracPart=''
$fl=0

for ($i=0; $i -le $inputNumber.Length-1; $i++){
    if ($inputNumber.Chars($i) -eq '.')  {
        $i++
        $fl = 1
        }
    if ($fl -eq 0) {
        $wholePart=$wholePart + $inputNumber.Chars($i)
    } else {
        $fracPart=$fracPart + $inputNumber.Chars($i)
    }
}

[float]$transformWhole = GetWhole($wholePart)
[float]$transformFrac = GetFrac($fracPart)

if ([string]($transformWhole+$transformFrac) -eq 0) {
    Write-Output 0
    Exit
}
if ($transformFrac -eq 0){
    Write-Output ($sing + $transformWhole)
} else {
    Write-Output ($sing + [string]($transformWhole+$transformFrac))
}
