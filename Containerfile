FROM ghcr.io/prefix-dev/pixi:0.76.1-noble

# Add curl, cleaning up package indexes afterwards
RUN apt-get update \
 && apt-get install -y --no-install-recommends curl git vim \
 && rm -rf /var/lib/apt/lists/*

# Add ~/.local/bin to path
ENV PATH=/root/.local/bin:$PATH

# Install claude
RUN curl -fsSL https://claude.ai/install.sh | bash

WORKDIR /workspace
ENTRYPOINT ["/bin/bash"]
