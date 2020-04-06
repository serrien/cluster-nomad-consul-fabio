{{ range ls "test" }}
{{ .Key }}:{{ .Value }}{{ end }}

{{ range ls "/" }}
{{ .Key }} !{{ end }}
