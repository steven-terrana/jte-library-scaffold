FROM squidfunk/mkdocs-material
RUN pip install \
    mkdocs-gen-files \
    mike \
    pymdown-extensions && \
    git config --global credential.helper 'store --file=/root/.git-credentials'