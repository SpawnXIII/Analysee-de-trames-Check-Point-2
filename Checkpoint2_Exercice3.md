
# Checkpoint 2 - Exercice 3

## Vérification d'une infrastructure réseau

### Découverte du réseau

#### Q.3.1 Quel est le matériel réseau A ? Quel est son rôle sur ce schéma vis-à-vis des ordinateurs ?
**Réponse**  
Le matériel réseau A correspond à un switch. Son rôle est de permettre la communication entre les ordinateurs du réseau local (LAN) en transmettant les trames Ethernet entre les appareils connectés.

#### Q.3.2 Quel est le matériel réseau B ? Quel est son rôle pour le réseau 10.10.0.0/16 ?
**Réponse**  
Le matériel B est un routeur. Son rôle est d'agir comme une passerelle par défaut pour le réseau 10.10.0.0/16, permettant aux ordinateurs de ce réseau de communiquer avec d'autres réseaux externes.

#### Q.3.3 Que signifie f0/0 et g1/0 sur l’élément B ?
**Réponse :**  
- **f0/0** : Interface Fast Ethernet 0/0 (100 Mbps).  
- **g1/0** : Interface Gigabit Ethernet 1/0 (1 Gbps).  
Ces interfaces représentent des ports physiques sur le routeur.

#### Q.3.4 Pour l'ordinateur PC2, que représente /16 dans son adresse IP ?
**Réponse :**  
Le **/16** indique que le masque de sous-réseau est 255.255.0.0, ce qui signifie que les 16 premiers bits de l'adresse IP sont utilisés pour identifier le réseau.

#### Q.3.5 Pour ce même ordinateur, que représente l'adresse 10.10.255.254 ?
**Réponse :**  
C'est l'adresse IP de la passerelle par défaut. Elle permet à l'ordinateur d'envoyer du trafic vers d'autres réseaux en passant par le routeur.

---

### Étude théorique

#### Q.3.6 Pour les ordinateurs PC1, PC2, et PC5 donne :
- **PC1 (10.10.4.1/16)** :
  - Adresse de réseau : 10.10.0.0
  - Première adresse disponible : 10.10.0.1
  - Dernière adresse disponible : 10.10.255.254
  - Adresse de diffusion : 10.10.255.255

- **PC2 (10.11.80.2/16)** :
  - Adresse de réseau : 10.11.0.0
  - Première adresse disponible : 10.11.0.1
  - Dernière adresse disponible : 10.11.255.254
  - Adresse de diffusion : 10.11.255.255

- **PC5 (10.10.4.7/15)** :
  - Adresse de réseau : 10.10.0.0
  - Première adresse disponible : 10.10.0.1
  - Dernière adresse disponible : 10.11.255.254
  - Adresse de diffusion : 10.11.255.255

#### Q.3.7 Indique parmi tous les ordinateurs du schéma, lesquels vont pouvoir communiquer entre-eux.
**Réponse**  
- PC1, PC3, PC4, et PC5 peuvent communiquer entre eux car ils appartiennent au même réseau 10.10.0.0/15.
- PC2 est dans un réseau différent (10.11.0.0/16) et nécessite un routeur pour communiquer avec les autres.

#### Q.3.8 Indique ceux qui vont pouvoir atteindre le réseau 172.16.5.0/24.
**Réponse**  
Tous les ordinateurs peuvent atteindre ce réseau si une route est configurée sur le routeur pour acheminer le trafic vers 172.16.5.0/24.

#### Q.3.9 Quel incidence y-a-t'il pour les ordinateurs PC2 et PC3 si on interverti leur ports de connexion sur le matériel A ?
**Réponse**  
Aucune incidence. Le switch (matériel A) fonctionne au niveau 2 (couche de liaison) et relaie les trames en fonction des adresses MAC, pas des ports physiques.

#### Q.3.10 On souhaite mettre la configuration IP des ordinateurs en dynamique. Quelles sont les modifications possibles ?
**Réponse**  
- Installer et configurer un serveur DHCP sur le réseau.
- Les ordinateurs doivent être configurés pour obtenir une adresse IP automatiquement (DHCP).

---

### Analyse de trames

#### Fichier 1 :
- **Q.3.11** : Sur le paquet N°5, l'adresse MAC qui initialise la communication est `00:50:79:66:68:00` (PC1).  
- **Q.3.12** : Oui, la communication a réussi entre PC1 et PC4.  
- **Q.3.13** : 
  - Request : PC1 (10.10.4.1, MAC: `00:50:79:66:68:00`)
  - Reply : PC4 (10.10.4.2, MAC: `00:50:79:66:68:03`)  
- **Q.3.14** : Protocole encapsulé : ARP (Address Resolution Protocol). Son rôle est de résoudre les adresses IP en adresses MAC.  
- **Q.3.15** :  
  - A (Switch) : Transfère les trames entre les appareils du réseau local.
  - B (Routeur) : Relaye les requêtes entre différents sous-réseaux.

#### Fichier 2 :
- **Q.3.16** : L'adresse IP qui initialise est `10.10.4.1` (PC1).  
- **Q.3.17** : Protocole encapsulé : ICMP (Internet Control Message Protocol). Son rôle est de diagnostiquer les connexions réseau (par exemple, Ping).  
- **Q.3.18** : Oui, la communication a réussi entre PC1 et PC2.  
- **Q.3.19** : La ligne du paquet N°2 montre une requête ICMP (Echo Request) envoyée par PC1 à PC2.  
- **Q.3.20** :  
  - A (Switch) : Permet la communication locale entre PC1 et PC2.  
  - B (Routeur) : Pas impliqué directement dans cette capture, car PC1 et PC2 sont sur le même réseau.

#### Fichier 3 :
- **Q.3.21** : 
  - Source : PC3 (10.10.80.3)
  - Destination : PC2 (10.11.80.2)  
- **Q.3.22** : 
  - Adresse MAC source : `00:50:79:66:66:F3` (PC3)
  - Adresse MAC destination : `CA:01:DA:D2:00:08` (Routeur B)  
  Cela montre que le trafic passe par le routeur pour atteindre une autre sous-réseau.  
- **Q.3.23** : La communication a été enregistrée sur l'interface `g2/0` du routeur R2.

