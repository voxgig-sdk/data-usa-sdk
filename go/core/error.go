package core

type DataUsaError struct {
	IsDataUsaError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewDataUsaError(code string, msg string, ctx *Context) *DataUsaError {
	return &DataUsaError{
		IsDataUsaError: true,
		Sdk:              "DataUsa",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *DataUsaError) Error() string {
	return e.Msg
}
