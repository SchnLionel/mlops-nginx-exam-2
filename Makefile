# Commande pour tout lancer
start-project:
	docker compose up -d --build

# Commande pour tout arrêter
stop-project:
	docker compose down

# Commande pour lancer les tests automatiques
test:
	bash tests/run_tests.sh