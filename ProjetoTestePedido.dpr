program ProjetoTestePedido;

uses
  Vcl.Forms,
  UnitPedido in 'UnitPedido.pas' {Form1},
  UnitBD in 'UnitBD.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
