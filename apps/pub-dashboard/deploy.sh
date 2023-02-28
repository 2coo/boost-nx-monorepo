gcloud services enable containerregistry.googleapis.com
gcloud services enable run.googleapis.com
gcloud --quiet auth configure-docker

docker build . --tag "gcr.io/$CLOUD_RUN_PROJECT_ID/$PUB_REPO_NAME:$GITHUB_SHA"

docker push gcr.io/$CLOUD_RUN_PROJECT_ID/$PUB_REPO_NAME:$GITHUB_SHA

gcloud components install beta --quiet
          gcloud beta run deploy $PUB_REPO_NAME --image gcr.io/$CLOUD_RUN_PROJECT_ID/$PUB_REPO_NAME:$GITHUB_SHA \
            --project $CLOUD_RUN_PROJECT_ID \
            --platform managed \
            --region $CLOUD_RUN_REGION \
            --allow-unauthenticated \
            --quiet