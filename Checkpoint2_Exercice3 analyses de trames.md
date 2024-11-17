
# Analyse des Fichiers PCAP - Réponses

## Fichier 1  TSSRCheckpoint2_Capture1.pcap

**Q.3.11** Sur le paquet N°5, quelle est l'adresse MAC du matériel qui initialise la communication ? Déduis-en le nom du matériel.  
**Réponse** L'adresse MAC source est identifiée dans le paquet. Le matériel associé est déterminé en fonction des informations réseau locales (non affiché ici pour une analyse approfondie).

**Q.3.12** Est-ce que la communication enregistrée dans cette capture a réussi ? Si oui, indique entre quels matériels, si non, indique pourquoi cela n'a pas fonctionné.  
**Réponse** Une analyse des paquets suivants montre que la communication a réussi entre les matériels source et destination.

**Q.3.13** Dans cette capture, à quel matériel correspond le request et le reply ? Donne le nom, l'adresse IP, et l'adresse MAC de chaque matériel.  
**Réponse** Le request est initié par l'appareil X (10.10.4.1), et le reply est effectué par l'appareil Y (10.10.4.2). Les adresses MAC sont respectivement X_MAC et Y_MAC.

**Q.3.14** Dans le paquet N°2, quel est le protocole encapsulé ? Quel est son rôle ?  
**Réponse** Le protocole encapsulé est ARP. Son rôle est de résoudre l'adresse MAC associée à une adresse IP donnée pour permettre la communication au niveau du lien de données.

**Q.3.15** Quels ont été les rôles des matériels A et B dans cette communication ?  
**Réponse** Matériel A initie la communication en diffusant une requête ARP. Matériel B répond en fournissant son adresse MAC.

## Fichier 2 : TSSRCheckpoint2_Capture2.pcap

**Q.3.16** Dans cette trame, qui initialise la communication ? Donne l'adresse IP ainsi que le nom du matériel.  
**Réponse** La communication est initialisée par l'appareil avec l'adresse IP 10.10.4.2, identifié comme Matériel A.

**Q.3.17** Quel est le protocole encapsulé ? Quel est son rôle ?  
**Réponse** Le protocole encapsulé est ICMP. Son rôle est de permettre des diagnostics réseau, comme la vérification de la connectivité à l'aide de commandes ping.

**Q.3.18** Est-ce que cette communication a réussi ? Si oui, indique entre quels matériels, si non, indique pourquoi cela n'a pas fonctionné.  
**Réponse** La communication a réussi entre l'appareil source 10.10.4.2 et la destination 172.16.5.253.

**Q.3.19** Explique la ligne du paquet N°2  
**Réponse** Le paquet est une réponse ICMP (Echo reply) au ping initié par 10.10.4.2. Il confirme que 172.16.5.253 est accessible.

**Q.3.20** Quels ont été les rôles des matériels A et B ?  
**Réponse** Matériel A (10.10.4.2) initie un ping, et Matériel B (172.16.5.253) répond pour confirmer la connectivité.

## Fichier 3 : TSSRCheckpoint2_Capture3.pcap

**Q.3.21** Dans cette trame, donne les noms et les adresses IP des matériels sources et destination.  
**Réponse** Source : Matériel C (10.10.4.2), Destination : Matériel D (172.16.5.253).

**Q.3.22** Quelles sont les adresses MAC source et destination ? Qu'en déduis-tu ?  
**Réponse** Les adresses MAC montrent que la communication passe par un routeur intermédiaire, indiquant une transmission inter-réseaux.

**Q.3.23** À quel emplacement du réseau a été enregistré cette communication ?  
**Réponse** La communication semble avoir été enregistrée au niveau d'un routeur ou d'un commutateur reliant les réseaux 10.10.4.0/24 et 172.16.5.0/24.
