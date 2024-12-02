install:
	pip install --upgrade pip

format:
	black *.py

train:
	python train.py

eval:
	echo "## Model Metrics" > report.md
	cat ./results/metrics.txt >> report.md

	echo '\n## Confusion Matrix Plot' >> report.md
	echo '![Confusion Matrix](./results/model_results.png)' >> report.md

	cml comment create report.md

update-branch:
	git config --global user.name $(USER_NAME)
	git config --global user.email $(USER_EMAIL)
	git commit -am "Update with new results"
	git push --force origin HEAD:update

hf-login:
	pip install -U "huggingface_hub[cli]"
	git pull origin update
	git switch update
	huggingface-cli login --token $(HF) --add-to-git-credential

push-hub:
	huggingface-cli upload ZaheedaT/cicd-pipelines ./app --repo-type=space --commit-message="Sync App files"
	huggingface-cli upload ZaheedaT/cicd-pipelines ./model --repo-type=space --commit-message="Sync Model"
	huggingface-cli upload ZaheedaT/cicd-pipelines ./results/metrics --repo-type=space --commit-message="Sync Metrics"

deploy: hf-login push-hub

all: install format train eval update-branch deploy