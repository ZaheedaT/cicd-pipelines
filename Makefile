install:
    pip install --upgrade pip &&\
    pip install -r requirements.txt
>>>>>>> 5e1a92bfc2191538c3241eaba6df5b9078ea082c

format:
    black *.py

train:
    python train.py

eval:
    echo "## Model Metrics" > report.md
    cat ./Results/metrics.txt >> report.md

    echo '\n## Confusion Matrix Plot' >> report.md
    echo '![Confusion Matrix](./Results/model_results.png)' >> report.md

    cml comment create report.md

update-branch:
	git config --global user.name $(USER_NAME)
	git config --global user.email $(USER_EMAIL)
	git commit -am "Update with new results"
	git push --force origin HEAD:update
