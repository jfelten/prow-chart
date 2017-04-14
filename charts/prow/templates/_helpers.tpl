{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 24 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 24 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 24 | trimSuffix "-" -}}
{{- end -}}

{{- define "tot" -}}

{{- printf "%sprowtot" .Release.Name | trunc 24 | trimSuffix "-" -}}
{{- end -}}

{{- define "splice" -}}
{{- printf "%s-prowsplice" .Release.Name | trunc 24 | trimSuffix "-" -}}
{{- end -}}

{{- define "sinker" -}}
{{- printf "%s-prowsinker" .Release.Name | trunc 24 | trimSuffix "-" -}}
{{- end -}}

{{- define "marque" -}}
{{- printf "%s-prowmarque" .Release.Name | trunc 24 | trimSuffix "-" -}}
{{- end -}}

{{- define "horologium" -}}
{{- printf "%s-prowhorologium" .Release.Name | trunc 24 | trimSuffix "-" -}}
{{- end -}}

{{- define "hook" -}}
{{- printf "%sprowhook" .Release.Name | trunc 24 | trimSuffix "-" -}}
{{- end -}}

{{- define "deck" -}}
{{- printf "%sprowdeck" .Release.Name | trunc 24 | trimSuffix "-" -}}
{{- end -}}

{{- define "crier" -}}
{{- printf "%s-prowcrier" .Release.Name | trunc 24 | trimSuffix "-" -}}
{{- end -}}
