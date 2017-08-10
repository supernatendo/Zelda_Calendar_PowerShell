$Games = @"
The Legend of Zelda
Zelda II: The Adventure of Link
A Link to the Past
Link's Awakening
Ocarina of Time
Majora's Mask
Oracle of Ages & Oracle of Seasons
Four Swords
The Wind Waker
Four Swords Adventures
The Minish Cap
Twilight Princess
Phantom Hourglass
Spirit Tracks
Skyward Sword
A Link Between Worlds
Tri Force Heroes
Breath of the Wild
"@

# Turn the string into an array
$Games = ($Games -split '[\r\n]') |? {$_} 
# Count all of the items in the array
$Objects = $Games.count

Clear-Host

# Define names of months
$Name_of_Month = @("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")

# Define Counters
$X = 0

# Find whole number of days to be the divisor
$Div = [math]::floor(366 / $Objects)

# Set initial day, month, and year
$Year = (Get-Date).Year; $Month = ((Get-Date).Month -1) ; $DayOfYear = (Get-Date).DayOfYear

# Loop through every object in the array
for ($j = 0;$j -lt $Objects; $j++){
    $StartOfYear = [datetime]::Parse("$Year-1-1")
    $DayOfMonth = ($StartOfYear.AddDays($DayOfYear - 1)).Day
    Write-Host ($Name_of_Month[$Month++] + " $DayOfMonth == "+ $Games[$X++] )
    
    # Reset month counter after Dec
    if ($Month -gt 11){$Month = 0}
    
    # Increment the day of year by the divisor
    $DayOfYear = $DayOfYear + $Div

    # Subtract the days of the year from the DayOFYear counter depending on leap year 
    if([System.DateTime]::isleapyear(($Year)) -and ($DayOfYear -ge 366)){
        $DayOfYear = $DayOfYear - 366
        $Year++
    }ELSEIF((![System.DateTime]::isleapyear(($Year)) -and ($DayOfYear -ge 365))){
        $DayOfYear = $DayOfYear - 365
        $Year++
    }
}
pause

