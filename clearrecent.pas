{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit clearrecent;

{$warn 5023 off : no warning about unused units}
interface

uses
  clearbutton, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('clearbutton', @clearbutton.Register);
end;

initialization
  RegisterPackage('clearrecent', @Register);
end.
