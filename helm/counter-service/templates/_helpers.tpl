{{/*
Define the application name.
If nameOverride is set, use that. Otherwise, use the chart name.
*/}}
{{- define "counter-service.name" -}}
{{- if .Values.nameOverride }}
{{- .Values.nameOverride }}
{{- else }}
{{- .Chart.Name }}
{{- end }}
{{- end }}

{{/*
Define the fully qualified app name.
If fullnameOverride is set, use that. Otherwise, use the release name + chart name.
*/}}
{{- define "counter-service.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride }}
{{- else }}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
