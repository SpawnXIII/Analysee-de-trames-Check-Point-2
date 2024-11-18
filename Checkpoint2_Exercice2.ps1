
function Log {
    param([string]$FilePath, [string]$Content)

    # Vérifie si le fichier existe, sinon le crée
    If (-not (Test-Path -Path $FilePath)) {
        New-Item -ItemType File -Path $FilePath | Out-Null
    }

    # Construit la ligne de journal
    $Date = Get-Date -Format "dd/MM/yyyy-HH:mm:ss"
    $User = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
    $logLine = "$Date;$User;$Content"

    # Ajoute la ligne de journal au fichier
    Add-Content -Path $FilePath -Value $logLine
}

Function Random-Password {
    param([int]$length = 10)  # Défaut à 10 caractères

    $punc = 46..46
    $digits = 48..57
    $letters = 65..90 + 97..122
    $password = Get-Random -Count $length -InputObject ($punc + $digits + $letters) |
        ForEach-Object { [char]$_ } -join ""
    Return $password
}

Function ManageAccentsAndCapitalLetters {
    param([String]$String)

    $StringWithoutAccent = $String -replace '[éèêë]', 'e' `
                                      -replace '[àâä]', 'a' `
                                      -replace '[îï]', 'i' `
                                      -replace '[ôö]', 'o' `
                                      -replace '[ùûü]', 'u'
    $StringWithoutAccentAndCapitalLetters = $StringWithoutAccent.ToLower()
    Return $StringWithoutAccentAndCapitalLetters
}

$Path = "C:\Scripts"
$CsvFile = "$Path\Users.csv"
$LogFile = "$Path\Log.log"

# Début de l'activité du script
Log -FilePath $LogFile -Content "Début de l'exécution du script."

# Importation du fichier CSV avec seulement les colonnes nécessaires
$Users = Import-Csv -Path $CsvFile -Delimiter ";" -Encoding UTF8 | Select-Object `
    -Property prenom, nom, description

Log -FilePath $LogFile -Content "Importation des utilisateurs depuis le fichier CSV : $CsvFile."

foreach ($User in $Users) {
    $Prenom = ManageAccentsAndCapitalLetters -String $User.prenom
    $Nom = ManageAccentsAndCapitalLetters -String $User.nom
    $Name = "$Prenom.$Nom"  # Initialisation unique de la variable $Name

    # Vérification si l'utilisateur existe déjà
    If (-not (Get-LocalUser -Name $Name -ErrorAction SilentlyContinue)) {
        $Pass = Random-Password -length 10  # Mot de passe de 10 caractères
        $Password = ConvertTo-SecureString $Pass -AsPlainText -Force
        $Description = $User.description  # Utilisation directe du champ Description

        $UserInfo = @{
            Name                 = $Name
            FullName             = "$Prenom $Nom"
            Description          = $Description
            Password             = $Password
            AccountNeverExpires  = $true
            PasswordNeverExpires = $true  # Empêche l'expiration du mot de passe
        }

        try {
            # Création de l'utilisateur local
            New-LocalUser @UserInfo

            # Ajout de l'utilisateur au groupe "Utilisateurs"
            $LocalGroupName = "Utilisateurs"  # Vérifiez le nom du groupe local selon la langue du système
            Add-LocalGroupMember -Group $LocalGroupName -Member $Name

            $Message = "Utilisateur $Name créé avec succès avec le mot de passe : $Pass. Description : $Description."
            Log -FilePath $LogFile -Content $Message
            Write-Host $Message
        } catch {
            $ErrorMessage = "Erreur lors de la création ou de l'ajout au groupe pour l'utilisateur $Name : $_"
            Log -FilePath $LogFile -Content $ErrorMessage
            Write-Error $ErrorMessage
        }
    } else {
        # Affichage si l'utilisateur existe déjà
        $Message = "L'utilisateur $Name existe déjà dans le système."
        Log -FilePath $LogFile -Content $Message
        Write-Host $Message
    }
}

# Fin de l'activité du script
Log -FilePath $LogFile -Content "Fin de l'exécution du script."
