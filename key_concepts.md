---
layout: default
title: Key Concepts
---

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

{% for card in site.cards %}
# {{card.title}}

{{card.content}}

[See in assignment]({{site.baseurl}}{{card.link-assignment}})
{% endfor %}
