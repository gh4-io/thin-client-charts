<!--- app-name: Radarr -->

# Radarr

Radarr description here...

[Rdararr Wiki](https://wiki.servarr.com/radarr)


## TL;DR

```console
helm repo add thin-client https://github.com/gh4-io/thin-client-charts
helm repo update
helm install radarr thin-client/radarr --version 0.1.9
```

## Introduction

Quick chart to deploy [Radarr](https://radarr.video/) on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Radarr will automaticly generate a sqlite3 database and `config.xml` in `/config` directory. Modifying th `config.xml` can be simply done.

## Prerequisites

- Kubernetes 1.23+
- Helm 3.8.0+
- PV provisioner support in the underlying infrastructure

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release https://github.com/gh4-io/thin-client-charts/releases/download/radarr-0.1.9/radarr-0.1.9.tgz
```

These commands deploy Tomcat on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

## Parameters

## Chart Readme Creation

Credit can be given to `bitnami` team.  

Using the bitnami [@bitnami/readme-generator-for-helm](https://github.com/bitnami-labs/readme-generator-for-helm#configuration-file) action and [generate-chart-readme.yml](https://github.com/bitnami/charts/blob/main/.github/workflows/generate-chart-readme.yml) workflow.
