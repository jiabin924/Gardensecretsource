unit Unit2;


interface
uses
SysUtils,Math;
type
TConversion = class
public
    //10 进制 to 2,8,16 进制
    function inttoBitStr(intstr: string): string;
    function IntToHexStr(intStr: string): String;//10 = 2
    function IntToOStr(intstr : string): string;

    //2进制 to 10,8,16 进制
    function BittoInt(BitStr:   String):   LongInt;// 2 = 10
    function BitStrToHextStr(const   BitStr   :   String)   :   String;//2 = 16
    function BitStrToOStr(const   BitStr   :   String)   :   String;//2 = 8

    //16 > 10 2   8 进制
    function HextoIntStr(HexStr: String): string;
    function HexToBitStr(HexStr:   string): string;
    function HexToOStr(HexStr:   string): string;

    //八进制转换成二进制字符串
    function OtoBitStr(O : string):string;
    function OtoIntStr(O : string):string;
    function OtoHexStr(O : string):string;
end;
var
TC :TConversion;


implementation

{ TConversion }
//2 进制 to 10 进制

function TConversion.BittoInt(BitStr: String): LongInt;
var
      i,Size:   Integer;
begin
      Result:=0;
      Size:=Length(BitStr);
      for   i:=Size   downto   1   do
      begin
        //例如 1010
          if Copy(BitStr,i,1)='1'   then
            Result:=Result+(1   shl   (Size-i));
      end;
//第二种方法
//二进制转换为十进制 start
{
VAR
str : String;
Int : Integer;
i : integer;

Str := UpperCase(Edit1.Text);
Int := 0;
FOR i := 1 TO Length(str) DO
    Int := Int * 2 + ORD(str[i]) - 48;
Edit2.Text:=IntToStr(int);
}
//二进制转换为十进制 end；
//第三中方法
{
function hextoint(s: string): Double;
begin
while Length(s) <>0 do
begin              //2^(长度-1)次方
    if s[1]='1' then Result:=Result+power(2,Length(s)-1);
    s:=Copy(s,2,Length(s));
end
end;
}
end;

function TConversion.BitStrToHextStr(const BitStr: String): String;
var
vD : Byte;
I : Integer;
vHextStr : String;
vP : PChar;
vLen : Integer;
begin
vLen := Length(BitStr);
if vLen mod 4 > 0 then
begin
    SetLength(vHextStr,   vLen   div   4   +   1);
    vLen := vlen div 4 + 1;
end
else
begin
    SetLength(vHextStr,   vLen   div   4);
    vLen := vlen div 4 ;
end;

//初始化
vD := 0;
vP := PChar(BitStr)+length(BitStr)-1;
I := 0;   //开始计数

while vP^ <> #0 do
begin
    if vp^ = '1' then
    begin
      case i of
      0:      vD :=vd+1;
      1:      vD :=vd+2;
      2:      vD :=vd+4;
      3:      vD :=vd+8;
      end;
    end;

    Dec(vP);
    Inc(I);
    if I = 4 then
    begin
      case vD of
        0..9 : vHextStr[vLen] := Chr(vD + $30);
        10..15 : vHextStr[vLen] := Chr(vD - 10 + $41);
      end;
      Dec(vLen);
      I   :=   0;
      vD   :=   0;
    end;
end;

if I > 0then
begin
    case   vD   of
      0..9 : vHextStr[vLen] := Chr(vD + $30);
      10..15 : vHextStr[vLen] := Chr(vD + $41);
    end;
end;

Result := vHextStr;
end;

function TConversion.BitStrToOStr(const BitStr: String): String;
var
vD : Byte;
I : Integer;
vHextStr : String;
vP : PChar;
vLen : Integer;
begin
vLen := Length(BitStr);
if vLen mod 3 > 0 then
begin
    SetLength(vHextStr,   vLen   div   3   +   1);
    vLen := vlen div 3 + 1;
end
else
begin
    SetLength(vHextStr,   vLen   div   3);
    vLen := vlen div 3 ;
end;

//初始化
vD := 0;
vP := PChar(BitStr)+length(BitStr)-1;
I := 0;   //开始计数

while vP^ <> #0 do
begin
    if vp^ = '1' then
    begin
      case i of
      0:      vD :=vd+1;
      1:      vD :=vd+2;
      2:      vD :=vd+4;
      end;
    end;

    Dec(vP);
    Inc(I);
    if I = 3 then
    begin
      case vD of
        0..9 : vHextStr[vLen] := Chr(vD + $30);
      end;
      Dec(vLen);
      I   :=   0;
      vD   :=   0;
    end;
end;

if I > 0then
begin
    case   vD   of
      0..9 : vHextStr[vLen] := Chr(vD + $30);
    end;
end;

Result := vHextStr;
end;

function TConversion.HexToBitStr(HexStr: string): string;
const
      cBitStrings:   array[0..15]   of   string   =
(
'0000',   '0001',   '0010',   '0011',
'0100',   '0101',   '0110',   '0111',
'1000',   '1001',   '1010',   '1011',
'1100',   '1101',   '1110',   '1111'
);
var
I:   Integer;
begin
Result   :=   '';
for   I   :=   1   to   Length(HexStr)   do
      Result   :=   Result   +   cBitStrings[StrToIntDef('$'   +   HexStr[I],   0)];
while   Pos('0',   Result)   =   1   do   Delete(Result,   1,   1);
end;   {   HexToBit   }

function TConversion.HextoIntStr(HexStr: String): string;
begin
result:= IntToStr(StrToInt('$' + (HexStr)));
end;

function TConversion.HexToOStr(HexStr: string): string;
begin
Result := BitStrToOStr(HexToBitStr(HexStr));
end;

function TConversion.inttoBitStr(intstr: string): string;
var
i :Integer;
begin
i := StrToInt(intstr);
while i <>0 do
begin              //i mod 2取模,再使用format格式化
   result:=Format('%d'+result,[i mod 2]);
   i:=i div 2
end
end;
//10进制装换 2进制 第二种方法
{function TConversion.IntToBitStr(Value, Size: Integer): String;
var
i: Integer;
begin
Result:='';
for i:=Size-1 downto 0 do begin
    if Value and (1 shl i)<>0 then begin
       Result:=Result+'1';
end else begin
       Result:=Result+'0';
end;
end;
end;}


function TConversion.IntToHexStr(intStr: string): String;
begin
    Result:=inttoBitStr(intstr);
end;

function TConversion.IntToOStr(intstr: string): string;
begin
Result := BitStrToHextStr(inttoBitStr(intstr));
end;

function TConversion.OtoBitStr(O: string): string;
const
      cBitStrings:   array[0..7]   of   string   =
(
'000',   '001',   '010',   '011',
'100',   '101',   '110',   '111'
);
var
i,j:   Integer;
begin
Result   :=   '';
for   I   :=   1   to   Length(o)   do
begin
    j:=strtoint(o[i]);
    Result   :=   Result   +   cBitStrings[j];
end;
while   Pos('0',   Result)   =   1   do   Delete(Result,   1,   1);
end;
function TConversion.OtoHexStr(O: string): string;
begin
Result :=BitStrToHextStr(OtoBitStr(o));
end;

function TConversion.OtoIntStr(O: string): string;
begin
Result := OToIntStr(OtoBitStr(o));
end;

end.
