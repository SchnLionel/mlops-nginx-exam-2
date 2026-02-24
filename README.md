# MLOps Nginx Exam - API Gateway & Machine Learning Deployment

Ce projet implémente une architecture MLOps robuste utilisant **Nginx** comme API Gateway pour servir un modèle de Machine Learning via **FastAPI**. Il répond à toutes les exigences de l'examen, incluant la scalabilité, la sécurité et le monitoring.

## 🏗️ Architecture

L'infrastructure est entièrement conteneurisée avec Docker et orchestrée via Docker Compose :

- **Nginx Gateway** : Seul point d'entrée du système. Gère le SSL, l'authentification, le rate limiting et le routage A/B.
- **API v1 (Production)** : Service FastAPI principal, déployé avec **3 répliques** pour garantir la haute disponibilité.
- **API v2 (Debug)** : Service FastAPI secondaire retournant des probabilités détaillées, utilisé pour les tests A/B.
- **Monitoring Stack** : 
    - **Nginx Exporter** : Collecte les métriques de Nginx.
    - **Prometheus** : Stocke les métriques.
    - **Grafana** : Visualise les données via des dashboards.

## 🚀 Fonctionnalités implémentées

1.  **Reverse Proxy** : Routage transparent vers les APIs.
2.  **Load Balancing** : Répartition de la charge sur 3 instances de `api-v1`.
3.  **HTTPS** : Chiffrement SSL (Certificats auto-signés) et redirection automatique HTTP (80) -> HTTPS (443).
4.  **Authentification Basique** : Protection de l'endpoint `/predict` (admin:admin).
5.  **Rate Limiting** : Protection contre les attaques par déni de service (configuré à 100 req/s pour les tests).
6.  **A/B Testing** : Routage vers `api-v2` si le header `X-Experiment-Group: debug` est présent.
7.  **Monitoring** : Stack complète Prometheus/Grafana opérationnelle.

## 🛠️ Utilisation

### Prérequis
- Docker et Docker Compose
- Make

### Lancer le projet
Pour construire et démarrer tous les services :
```bash
make start-project
```

### Exécuter les tests de validation
La commande suivante valide l'intégralité des fonctionnalités (Routage, Auth, Rate limit, Monitoring) :
```bash
make test
```

### Arrêter le projet
```bash
make stop-project
```

## 📊 Accès aux services
- **API Gateway** : [https://localhost/predict](https://localhost/predict)
- **Prometheus** : [http://localhost:9090](http://localhost:9090)
- **Grafana** : [http://localhost:3000](http://localhost:3000) (admin / admin)

## 📁 Structure du Projet
- `deployments/nginx/` : Configuration Nginx, Dockerfile et certificats.
- `deployments/prometheus/` : Configuration de collecte des métriques.
- `src/api/v1/` & `src/api/v2/` : Code source des APIs et modèles.
- `tests/` : Scripts de tests automatisés.
- `Makefile` : Point d'entrée pour l'automatisation.
