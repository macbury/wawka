[![Gem Version](https://badge.fury.io/rb/wawka.svg)](https://badge.fury.io/rb/wawka)

# Wawka

Tool for generating documents for people in Warsaw.

https://youtu.be/j1epEtB0lVo?t=1m59s

## Instalation

```
gem install wawka
```

## Configuration

Prepare configuration:

```
wawka config
```

Your configuration now resides at `~/.wawka.yaml`. Generate and fetch personal access token from: `https://id.getharvest.com/developers`

### Customizing messages for report:

In `~/.wawka.yaml` file, there is a `enterprise` where you can map Task Category to messages.

```YAML
enterprise:
  Development:
    - Rozwój wewnętrznych narzędzi oraz oprogramowania dla ...
  Code review:
    - Audyt i sprawdzanie poprawności tworzonego kodu
  Meeting:
    - Planowanie architektury systemu
  Support:
    - Wsparcie techniczne
  Admin:
    - Administracja serwerami oraz infrastrukturą
  Design:
    - Projektowanie wyglądu oprogramowania
  Project Managment:
    - Zarządzanie projektem
  Research:
    - Analiza narzędzi oraz rozwój oprogramowania
```

## Generating harvest report:

For current date
```
wawka harvest ./evidence.xls
```

For specified date

```
wawka harvest ./evidence.xls 2018-07-20
```

## TODO

- Support for creating invoices using https://www.infakt.pl/developers
- Whole pipeline for generating invoice and evidence xls
- Sending xls evidence and invoice using email
- Cron!
