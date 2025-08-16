unit UntQuadradoCubo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtNum: TEdit;
    edtQuad: TEdit;
    edtCubo: TEdit;
    btnCalc: TButton;
    btnLimpar: TButton;
    btnFechar: TButton;
    Timer1: TTimer;
    StatusBar1: TStatusBar;
    Image1: TImage;
    procedure btnFecharClick(Sender: TObject);
    procedure btnCalcClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCalcClick(Sender: TObject);
var
  valor: Double;
begin
  if TryStrToFloat(edtNum.Text, valor) then
  begin
    edtQuad.Text := FloatToStr(valor * valor);
    edtCubo.Text := FloatToStr(valor * valor * valor);
  end
  else
  begin
    ShowMessage('Digite um valor numérico válido.');
    edtNum.SetFocus;
  end;
end;


procedure TForm1.btnFecharClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente sair?', 'Confirmação',
    MB_YESNO + MB_ICONQUESTION) = IDYES then
    Close;
end;


procedure TForm1.btnLimparClick(Sender: TObject);
begin
  edtNum.Clear;
  edtQuad.Clear;
  edtCubo.Clear;
  edtNum.SetFocus;
end;


procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key = VK_ESCAPE then
        btnFechar.Click;

        if key = VK_RETURN then
        btnCalc.Click;

end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
 StatusBar1.Panels[0].Text := DateToStr(Date);
 StatusBar1.Panels[1].Text :=  FormatDateTime('hh:mm',Time)
 //TimeToStr(Time);

end;

end.
