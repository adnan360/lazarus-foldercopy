{
-----------------------------------------------------------------------
Simple directory copy example written by Adnan Shameem

Visit https://lazplanet.blogspot.com for more projects like this!
-----------------------------------------------------------------------
}

unit frm1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, EditBtn,
  StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnCopy: TButton;
    chkPreserveTime: TCheckBox;
    chkOverwriteFile: TCheckBox;
    chkCreateDestDirectory: TCheckBox;
    edtSource: TDirectoryEdit;
    edtTarget: TDirectoryEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnCopyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnCopyClick(Sender: TObject);
var
    flags: TCopyFileFlags;
    ret: boolean;
begin

    // Set flags from checkboxes
    if chkOverwriteFile.Checked then
        flags := flags + [cffOverwriteFile];
    // This one is always on from LCL function.
    // Ctrl+click over the "CopyDirTree" below, then press Ctrl+Shift+Down Arrow
    // to go to the function. You will see a comment about this.
    if chkCreateDestDirectory.Checked then
        flags := flags + [cffCreateDestDirectory];
    if chkPreserveTime.Checked then
        flags := flags + [cffPreserveTime];

    // Run the copy function
    ret := CopyDirTree(edtSource.Directory, edtTarget.Directory, flags);

    // Show message when finished, either success or failure
    if ret = true then begin
        ShowMessage('Successful!');
    end else begin
        ShowMessage('Failed!');
    end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    // Just some default values so that it is not empty
    edtSource.Directory:=Application.Location + 'test1';
    edtTarget.Directory:=Application.Location + 'test2';
end;

end.

