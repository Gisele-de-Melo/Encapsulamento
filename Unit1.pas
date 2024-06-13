//------------------------------------------------------------------------------------------------------------
//********* Sobre ************
//Autor: Gisele de Melo
//Esse código foi desenvolvido com o intuito de aprendizado para o blog codedelphi.com, portanto não me
//responsabilizo pelo uso do mesmo.
//
//********* About ************
//Author: Gisele de Melo
//This code was developed for learning purposes for the codedelphi.com blog, therefore I am not responsible for
//its use.
//------------------------------------------------------------------------------------------------------------

unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type

  TContaBancaria = class
  private
    FNumeroConta: String;
    FSaldo: Double;
    procedure SetNumeroConta(const Value: String);
    procedure SetSaldo(const Value: Double);
  public
    constructor Create(NumeroConta: String; SaldoInicial: Double);
    procedure Depositar(Valor: Double);
    procedure Sacar(Valor: Double);
    function GetSaldo: Double;
    function GetNumeroConta: String;
  end;

  TForm1 = class(TForm)
    btnExibirDados: TButton;
    procedure btnExibirDadosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TContaBancaria }

constructor TContaBancaria.Create(NumeroConta: String; SaldoInicial: Double);
begin
  FNumeroConta := NumeroConta;
  FSaldo := SaldoInicial;
end;

procedure TContaBancaria.Depositar(Valor: Double);
begin
  if Valor > 0 then
    FSaldo := FSaldo + Valor;
end;

function TContaBancaria.GetNumeroConta: String;
begin
  Result := FNumeroConta;
end;

function TContaBancaria.GetSaldo: Double;
begin
  Result := FSaldo;
end;

procedure TContaBancaria.Sacar(Valor: Double);
begin
  if (Valor > 0) and (Valor <= FSaldo) then
    FSaldo := FSaldo - Valor;
end;

procedure TContaBancaria.SetNumeroConta(const Value: String);
begin
  FNumeroConta := Value;
end;

procedure TContaBancaria.SetSaldo(const Value: Double);
begin
  if Value >= 0 then
    FSaldo := Value;
end;

{ TForm1 }

procedure TForm1.btnExibirDadosClick(Sender: TObject);
var
  Conta: TContaBancaria;
begin
  Conta := TContaBancaria.Create('123456', 1000.00);
  ShowMessage('Número da Conta: ' + Conta.GetNumeroConta);
  ShowMessage('Saldo Inicial: ' + FloatToStr(Conta.GetSaldo));

  Conta.Depositar(500.00);
  ShowMessage('Saldo após depósito: ' + FloatToStr(Conta.GetSaldo));

  Conta.Sacar(200.00);
  ShowMessage('Saldo após saque: ' + FloatToStr(Conta.GetSaldo));

end;

end.
