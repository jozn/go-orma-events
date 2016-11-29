{{- $short := (shortname .Name "err" "res" "sqlstr" "db" "XOLog") -}}
{{- $table := (schema .Schema .Table.TableName) -}}
{{- $typ := .Name}}

// Manualy copy this to project
func  On{{ .Name }}_Add (o {{ .Name }}) {
	Cacher.Set("{{ .Name }}:++++"+o.Id, o)
}

func  On{{ .Name }}_Delete () {

}

