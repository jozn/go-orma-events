{{- $short := (shortname .Name "err" "res" "sqlstr" "db" "XOLog") -}}
{{- $table := (schema .Schema .Table.TableName) -}}
{{- $typ := .Name }}
{{- $_ := "__" }}

{{/* - * (Manually copy this to other location) */}}
//{{ .Name }} Events 
func  On{{ .Name }}_AfterInsert{{$_}} (row *{{ .Name }}) {
	RowCache.Set("{{ .Name }}:"+strconv.Itoa(row.{{.PrimaryKey.Name}}), row,time.Hour* 0)
}

func  On{{ .Name }}_AfterUpdate{{$_}} (row *{{ .Name }}) {
	RowCache.Set("{{ .Name }}:"+strconv.Itoa(row.{{.PrimaryKey.Name}}), row,time.Hour* 0)
}

func  On{{ .Name }}_AfterDelete{{$_}} (row *{{ .Name }}) {
	RowCache.Delete("{{ .Name }}:"+strconv.Itoa(row.{{.PrimaryKey.Name}}))
}

func  On{{ .Name }}_LoadOne{{$_}} (row *{{ .Name }}) {
	RowCache.Set("{{ .Name }}:"+strconv.Itoa(row.{{.PrimaryKey.Name}}), row,time.Hour* 0)
}

func  On{{ .Name }}_LoadMany{{$_}} (rows []*{{ .Name }}) {
	for _, row:= range rows {
		RowCache.Set("{{ .Name }}:"+strconv.Itoa(row.{{.PrimaryKey.Name}}), row,time.Hour* 0)
	}
}



