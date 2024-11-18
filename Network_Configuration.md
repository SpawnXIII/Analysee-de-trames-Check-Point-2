
# Configuration réseau - Analyse et Résolutions

## Q 1.1
Pour pinger les deux machines entre elles, cela ne marche pas car elles ne sont pas dans le même réseau.  
Le serveur est sur le réseau **172.16.10.0/24** et le client est sur le réseau **172.16.100.0/24**, et le client ne possède pas de passerelle qui pointe vers son serveur.  
Ainsi, il ne peut trouver le DHCP du serveur.

**Solution**  
Je modifie les paramètres de la carte réseau du client en lui attribuant une IP statique et une passerelle pointant vers son serveur. À ce moment-là, je trouve une réponse à ma requête de ping positive et la communication entre le serveur et son client est établie.

---

## Q 1.2
Cette question a été nommée optionnelle.  
À la fin de mes tests, je reviens dessus et constate que depuis les réglages effectués, je peux pinger avec les noms des machines également.

---

## Q 1.3
Je modifie la configuration du client pour qu’il prenne le DHCP du serveur, donc je redéfinis en IP dynamique l’IP du client.  
Le client ne pourra récupérer une adresse comprise entre **172.16.10.1 et 172.16.10.19** incluses, car ces adresses sont réservées en exclusions, selon les règles définies.

---

## Q 1.4
Non, le client ne peut pas obtenir une adresse spécifique car la plage de réservation est comprise entre **172.16.10.1 et 172.16.10.19** incluses, ainsi qu'une autre adresse réservée : **172.16.10.241**.

**Solution**  
Je modifie les règles sur le DHCP. Je réserve alors une adresse spécifique grâce à l'adresse MAC du client.  
- Je vais dans **Réservations** et j’en crée une nouvelle.  
- Je définis **172.16.10.15** comme adresse IP souhaitée et j'associe cette adresse à la MAC du client.  
- Sur le client, je fais un `Renew` pour lui réattribuer une nouvelle adresse délivrée par le DHCP.  
- Je vérifie alors qu’il lui a bien attribué l’adresse voulue.
