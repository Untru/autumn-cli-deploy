# autumn-cli-deploy

Реализация приложения на autumn-cli для целей компании (сборка разборка конфигурация)
При реализации были немного переделаны известные либы, по этому их выложии в текущий проект.

```mermaid
---
title: Приложение для Деплоя
---
classDiagram
    note "From Duck till Zebra"
    Commit <|-- Main
   class Main{
        +Commit()
        +NewBranche()
        +Init()
    }
    class Commit{
        +Фиксация изменеий()
    }

```
