unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Unit2,weiztihuan;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    mima: TEdit;
    Label1: TLabel;
    diyigez: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    dierge: TEdit;
    Label4: TLabel;
    disange: TEdit;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  mima1,mima2:int32;
implementation

{$R *.dfm}
procedure yifener(mama:string);
var
i:Integer;
begin
        for I := 1 to Length(mama)  do
          begin
             if (i mod 2) <>0 then
                mima2:=mima2+ord(mama[i])
                else
                mima1:=mima1+ord(mama[i])
                ;

          end;
end;
procedure TForm1.Button1Click(Sender: TObject);
begin
      memo1.Text:=StringReplace(memo1.Text, diyigez.Text,'0', [rfReplaceAll]);
      memo1.Text:=StringReplace(memo1.Text, dierge.Text,'1', [rfReplaceAll]);
      memo1.Text:=StringReplace(memo1.Text, disange.Text, #13#10, [rfReplaceAll]);
      if mima.Text<>'' then
        begin
           mima1:=0;
           mima2:=0;
            yifener(mima.Text);
        end;
    Memo1.Text:=jiemi(Memo1.Lines,mima1,mima2);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
            if mima.Text<>'' then
        begin
            mima1:=0;
           mima2:=0;
            yifener(mima.Text);
        end;
      Memo1.Text:=jiami(memo1.Text,diyigez.Text,dierge.Text,disange.Text,mima1,mima2);

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
     Button3.Caption:=inttostr(Length(memo1.Text));

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
        mima1:=10;
        mima2:=5;
end;

end.
