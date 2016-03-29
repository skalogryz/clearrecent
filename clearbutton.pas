unit clearbutton;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, IDEOptionsIntf, MenuIntf, Dialogs;

procedure Register;

implementation

const
  ENOUGH_IS_ENOUGH=100; // the actual number must be read from EnvironmentOptions

procedure ClearRecentFiles(Sender: TObject);
var
  i: integer;
begin
  // todo: a confirmation dialog?
  for i:=0 to ENOUGH_IS_ENOUGH do IDEEnvironmentOptions.AddToRecentOpenFiles(IntToStr(i));
  for i:=0 to ENOUGH_IS_ENOUGH do IDEEnvironmentOptions.RemoveFromRecentOpenFiles(IntToStr(i));
  itmFileRecentOpen.Clear;
  itmFileRecentOpen.Enabled:=false; // why not...?
end;

procedure ClearRecentProjects(Sender: TObject);
var
  i: integer;
begin
  // todo: a confirmation dialog?
  for i:=0 to ENOUGH_IS_ENOUGH do IDEEnvironmentOptions.AddToRecentProjectFiles(IntToStr(i));
  for i:=0 to ENOUGH_IS_ENOUGH do IDEEnvironmentOptions.RemoveFromRecentProjectFiles(IntToStr(i));
  itmProjectRecentOpen.Clear;
  itmProjectRecentOpen.Enabled:=false; // why not...?
end;


procedure Register;
var
  cmd : TIDEMenuCommand;
begin
  //RegisterIDEOptionsEditor(GroupEnvironment, TFrame1, EnvOptionsFiles+1, EnvOptionsFiles);
  cmd:=RegisterIDEMenuCommand(mnuFile, 'ClearRecent', 'Clear Recent', nil, @ClearRecentFiles);
  cmd.MenuItem.MenuIndex:=itmFileRecentOpen.MenuItem.MenuIndex+1;

  cmd:=RegisterIDEMenuCommand(mnuProject, 'ClearRecentPrj', 'Clear Recent', nil, @ClearRecentProjects);
  cmd.MenuItem.MenuIndex:=itmProjectRecentOpen.MenuItem.MenuIndex+1;
end;

end.

