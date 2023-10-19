{{/*
Expand the name of the chart.
*/}}
{{- define "prowlarr.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "prowlarr.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "prowlarr.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "prowlarr.labels" -}}
helm.sh/chart: {{ include "prowlarr.chart" . }}
app.kubernetes.io/app: {{ printf "%s" .Chart.Annotations.app | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{ include "prowlarr.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: servarr
{{- end }}

{{/*
Selector labels
*/}}
{{- define "prowlarr.selectorLabels" -}}
app.kubernetes.io/name: {{ include "prowlarr.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "prowlarr.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "prowlarr.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "prowlarr.volumeName" -}}
{{- .Values.persistence.volumeName | default ( printf "%s-%s-pv" ( .Release.Namespace ) ( include "prowlarr.fullname" . ))  }}
{{- end }}

{{- define "prowlarr.volumePath" -}}
{{- .Values.persistence.volumePath | default "/var/snap/microk8s/common/default-storage/" }}
{{- end }}

{{- define "prowlarr.pvName" -}}
{{ printf "%s-%s-pv" .Release.Namespace ( include "prowlarr.fullname" . ) }}
{{- end }}

{{- define "prowlarr.pvcName" -}}
{{ default (printf "%s-pvc" ( include "prowlarr.fullname" . )) .Values.persistence.existingClaim }}
{{- end }}