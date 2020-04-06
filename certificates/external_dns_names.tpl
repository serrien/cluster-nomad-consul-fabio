{{range services}}{{range .Tags}}{{ if. | regexMatch "dns@(.+)(.*)" }}
{{ . | replaceAll "dns@" "" }}{{ end }}{{end}}{{end}}
