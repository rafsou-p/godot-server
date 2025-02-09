extends Node

var server = WebSocketServer.new()
var compteur = 0

func _ready():
    server.listen(8080, ["*"])  # Démarre sur le port 8080
    print("Serveur lancé sur Railway!")

func _process(delta):
    server.poll()
    for peer_id in server.get_peer_ids():
        var msg = server.get_peer(peer_id).get_packet()
        if msg:
            if msg.get_string_from_utf8() == "increment":
                compteur += 1
                broadcast_compteur()

func broadcast_compteur():
    var message = "Compteur: " + str(compteur)
    for peer_id in server.get_peer_ids():
        server.get_peer(peer_id).put_packet(message.to_utf8())
