FROM docker.elastic.co/elasticsearch/elasticsearch:7.10.1

# 定义环境变量
ARG PLUGINS="amazon-ec2,analysis-icu"

# 安装所需插件
RUN if [[ -n "${PLUGINS}" ]]; then \
        IFS=','; \
        for plugin in ${PLUGINS}; do \
            echo "Installing plugin: $plugin"; \
            elasticsearch-plugin install --batch $plugin; \
        done; \
    fi