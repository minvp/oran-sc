################################################################################
#   Copyright (c) 2021 HCL Technologies Limited.                               #
#                                                                              #
#   Licensed under the Apache License, Version 2.0 (the "License");            #
#   you may not use this file except in compliance with the License.           #
#   You may obtain a copy of the License at                                    #
#                                                                              #
#       http://www.apache.org/licenses/LICENSE-2.0                             #
#                                                                              #
#   Unless required by applicable law or agreed to in writing, software        #
#   distributed under the License is distributed on an "AS IS" BASIS,          #
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.   #
#   See the License for the specific language governing permissions and        #
#   limitations under the License.                                             #
################################################################################

{{- define "common.name.influxdb" -}}
  {{- printf "influxdb" -}}
{{- end -}}

{{- define "common.fullname.influxdb" -}}
  {{- $name := ( include "common.name.influxdb" . ) -}}
  {{- $namespace := ( include "common.namespace.platform" . ) -}}
  {{- printf "%s-%s" $namespace $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "common.influxdb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "common.influxdb.labels" -}}
helm.sh/chart: {{ include "common.influxdb.chart" . }}
{{ include "common.influxdb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "common.influxdb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "common.name.influxdb" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "common.influxdb.serviceAccountName" -}}
  {{- $name := ( include "common.fullname.influxdb" . ) -}}
  {{- printf "service-%s-http" $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "common.serviceport.influxdb.http" -}}8086{{- end -}}
{{- define "common.serviceport.influxdb.meta.bind_address" -}}8091{{- end -}}
{{- define "common.serviceport.influxdb.http.bind_address" -}}8086{{- end -}}
{{- define "common.serviceport.influxdb.rpc.bind_address" -}}8088{{- end -}}
{{- define "common.serviceport.influxdb.graphite.bind_address" -}}2003{{- end -}}
{{- define "common.serviceport.influxdb.udp.bind_address" -}}8089{{- end -}}
{{- define "common.serviceport.influxdb.opentsdb.bind_address" -}}4242{{- end -}}
{{- define "common.serviceport.influxdb.collectd.bind_address" -}}25826{{- end -}}
