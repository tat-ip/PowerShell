#Add voice to your scripts
# Define the message you want to have read out loud
$Message = 'This is awesome. We now know how to use PowerShell Text To Speech'

# Create a SpeechSynthesizer object
Add-Type -AssemblyName System.Speech
$Speech = New-Object System.Speech.Synthesis.SpeechSynthesizer

# Set the desired voice (you can choose between 'David' and 'Zira')
$Speech.SelectVoice("Microsoft Zira Desktop")

# Make PowerShell speak the message
$Speech.Speak($Message)
