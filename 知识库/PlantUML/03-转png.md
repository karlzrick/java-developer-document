# 转png

### 1、下载 PlantUML jar

```shell
# PlantUML 1.2024.8 兼容 jdk8
curl -L --fail --silent --show-error \
  -o work/plantuml-java8.jar \
  https://github.com/plantuml/plantuml/releases/download/v1.2024.8/plantuml-1.2024.8.jar
```

### 2、生成 SVG 和 高清 PNG

> tips: PlantUML 的 -o ./outputs 通常是相对输入 puml 文件所在目录，不一定是你当前终端目录。可以使用绝对路径输出到固定目录~

```shell
java -DPLANTUML_LIMIT_SIZE=16384 \
  -jar work/plantuml-java8.jar \
  -charset UTF-8 \
  -tsvg \
  -o ./outputs \
  /Users/zhengqingya/zhengqingya/code/workspace-me/java-developer-document/知识库/PlantUML/图表/02-类图-ER图.puml


java -DPLANTUML_LIMIT_SIZE=16384 \
  -jar work/plantuml-java8.jar \
  -charset UTF-8 \
  -tpng \
  -Sdpi=300 \
  -o ./outputs \
  /Users/zhengqingya/zhengqingya/code/workspace-me/java-developer-document/知识库/PlantUML/图表/02-类图-ER图.puml
```