{{/*
Expand the name of the chart. If `nameOverride` is provided, use it.
*/}}
{{- define "travel_guide.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name, it will be used as a full name.
*/}}
{{- define "travel_guide.fullname" -}}
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
{{- define "travel_guide.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels for resources.
This uses the chart and app information, version, and release service.
*/}}
{{- define "travel_guide.labels" -}}
helm.sh/chart: {{ include "travel_guide.chart" . }}
{{ include "travel_guide.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels used by selectors like Deployment or StatefulSet.
*/}}
{{- define "travel_guide.selectorLabels" -}}
app.kubernetes.io/name: {{ include "travel_guide.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use.
If serviceAccount.create is true, use `fullname` or the provided name; otherwise, fallback to "default".
*/}}
{{- define "travel_guide.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
  {{- default (include "travel_guide.fullname" $) .Values.serviceAccount.name }}
{{- else }}
  {{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}