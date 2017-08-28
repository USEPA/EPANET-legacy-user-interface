unit CDForm;
{
   Unit:    CDForm.pas
   Project: TChartDialog Component
   Author:  L. Rossman
   Version: 3.0
   Delphi:  7.0
   Date:    9/30/05
            6/22/06

   This is the form unit used for the TChartDialog 
   dialog box component (ChartDlg.pas).
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Spin, ExtCtrls, ComCtrls,
  Chart, TeEngine, Series;

const
  LineStyleText: array[0..4] of PChar =
    ('Solid','Dash','Dot','DashDot','DashDotDot');
  LegendPosText: array[0..3] of PChar =
    ('Left','Right','Top','Bottom');
  MarkStyleText: array[0..7] of PChar =
    ('Rectangle','Circle','Up Triangle','Down Triangle','Cross',
     'Diagonal Cross','Star','Diamond');
  FillStyleText: array[0..7] of PChar =
    ('Solid','Clear','Horizontal','Vertical','Foward Diagonal','Back Diagonal',
     'Cross','Diagonal Cross');
  StackStyleText: array[0..3] of PChar =
    ('None','Side','Stacked','Stacked 100%');
  LabelStyleText: array[0..8] of PChar =
    ('Value','Percent','Label','Label & %','Label & Value','Legend','% Total',
     'Label & % Total','X Value');

  DateFormats: array[0..4] of PChar =
    ('h:nn', 'h:nn m/d/yy', 'm/d yyyy', 'mmm yyyy', 'yyyy');


type
//Graph series types
  TSeriesType = (stLine, stFastLine, stPoint, stBar, stHorizBar, stArea, stPie);

//Graph series options
  TSeriesOptions = class(TObject)
    Constructor Create;
    public
      SeriesType      : TSeriesType;
      LineVisible     : Boolean;
      LineStyle       : Integer;
      LineColor       : TColor;
      LineWidth       : Integer;
      PointVisible    : Boolean;
      PointStyle      : Integer;
      PointColor      : TColor;
      PointSize       : Integer;
      AreaFillStyle   : Integer;
      AreaFillColor   : TColor;
      AreaStacking    : Integer;
      PieCircled      : Boolean;
      PieUsePatterns  : Boolean;
      PieRotation     : Integer;
      LabelsVisible   : Boolean;
      LabelsTransparent: Boolean;
      LabelsArrows    : Boolean;
      LabelsBackColor : TColor;
      LabelsStyle     : Integer;
    end;

  TChartOptionsForm = class(TForm)
    PageControl1: TPageControl;
    GeneralPage: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    PanelColorBox: TColorBox;
    BackColorBox: TColorBox;
    View3DBox: TCheckBox;
    Percent3DBox: TSpinEdit;
    GraphTitleBox: TEdit;
    GraphTitleFontBtn: TButton;
    XaxisPage: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    XIncrementLabel: TLabel;
    Label11: TLabel;
    Xmin: TEdit;
    Xmax: TEdit;
    Xinc: TEdit;
    Xauto: TCheckBox;
    Xtitle: TEdit;
    XFontBtn: TButton;
    XDataMinLabel: TLabel;
    XDataMaxLabel: TLabel;
    YaxisPage: TTabSheet;
    Label9: TLabel;
    Ymin: TEdit;
    Label12: TLabel;
    Ymax: TEdit;
    Label13: TLabel;
    Yinc: TEdit;
    Yauto: TCheckBox;
    Label15: TLabel;
    Ytitle: TEdit;
    YFontBtn: TButton;
    YDataMinLabel: TLabel;
    YDataMaxLabel: TLabel;
    LegendPage: TTabSheet;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    LegendFrameBox: TCheckBox;
    LegendVisibleBox: TCheckBox;
    LegendPosBox: TComboBox;
    LegendColorBox: TColorBox;
    LegendWidthBox: TSpinEdit;
    SeriesPage: TTabSheet;
    Label21: TLabel;
    Label22: TLabel;
    SeriesListBox: TComboBox;
    SeriesTitle: TEdit;
    LegendFontBtn: TButton;
    PageControl2: TPageControl;
    LineOptionsSheet: TTabSheet;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    LineStyleBox: TComboBox;
    LineColorBox: TColorBox;
    LineSizeBox: TSpinEdit;
    LineVisibleBox: TCheckBox;
    MarkOptionsSheet: TTabSheet;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    MarkVisibleBox: TCheckBox;
    MarkStyleBox: TComboBox;
    MarkColorBox: TColorBox;
    MarkSizeBox: TSpinEdit;
    AreaOptionsSheet: TTabSheet;
    Label29: TLabel;
    AreaFillStyleBox: TComboBox;
    Label30: TLabel;
    AreaColorBox: TColorBox;
    Label31: TLabel;
    StackStyleBox: TComboBox;
    PieOptionsSheet: TTabSheet;
    PieCircledBox: TCheckBox;
    PiePatternBox: TCheckBox;
    Label32: TLabel;
    PieRotationBox: TSpinEdit;
    LabelsOptionsSheet: TTabSheet;
    Label33: TLabel;
    LabelsStyleBox: TComboBox;
    Label34: TLabel;
    LabelsBackColorBox: TColorBox;
    LabelsTransparentBox: TCheckBox;
    LabelsArrowsBox: TCheckBox;
    LabelsVisibleBox: TCheckBox;
    DefaultBox: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ColorBox3: TColorBox;
    FontDialog1: TFontDialog;
    Xgrid: TCheckBox;
    Ygrid: TCheckBox;
    DateFmtCombo: TComboBox;
    XFormatLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure GraphTitleFontBtnClick(Sender: TObject);
    procedure XFontBtnClick(Sender: TObject);
    procedure YFontBtnClick(Sender: TObject);
    procedure LegendFontBtnClick(Sender: TObject);
    procedure SeriesListBoxClick(Sender: TObject);
    procedure LineStyleBoxChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    theIndex: Integer;
    theSeries: TStringlist;
    IsPieChart: Boolean;
    IsDateTime: Boolean;
    procedure LoadDateTimeOptions(aChart: TChart);
    procedure GetSeriesOptions(const Index: Integer);
    procedure SetSeriesOptions(const Index: Integer);
    procedure SetAxisScaling(Axis: TChartAxis; const Smin,Smax,Sinc: String);
  public
    { Public declarations }
    procedure LoadOptions(aChart: TChart);
    procedure UnloadOptions(aChart: TChart);
  end;

var
  ChartOptionsForm: TChartOptionsForm;

implementation

{$R *.dfm}

{Constructor for TSeriesOptions}
Constructor TSeriesOptions.Create;
begin
  Inherited Create;
end;

procedure TChartOptionsForm.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  Font.Size := 8;

{ Load options into comboboxes }
  for i := 0 to High(LineStyleText) do
    LineStyleBox.Items.Add(LineStyleText[i]);
  for i := 0 to High(LegendPosText) do
    LegendPosBox.Items.Add(LegendPosText[i]);
  for i := 0 to High(FillStyleText) do
    AreaFillStyleBox.Items.Add(FillStyleText[i]);
  for i := 0 to High(MarkStyleText) do
    MarkStyleBox.Items.Add(MarkStyleText[i]);
  for i := 0 to High(StackStyleText) do
    StackStyleBox.Items.Add(StackStyleText[i]);
  for i := 0 to High(LabelStyleText) do
    LabelsStyleBox.Items.Add(LabelStyleText[i]);

{ Create a stringlist to hold data series options }
  theSeries := TStringlist.Create;
  PageControl1.ActivePage := GeneralPage;
end;

procedure TChartOptionsForm.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  with theSeries do
  begin
    for i := 0 to Count - 1 do
      Objects[i].Free;
    Free;
  end;
end;

procedure TChartOptionsForm.GraphTitleFontBtnClick(Sender: TObject);
begin
  with FontDialog1 do
  begin
    Font.Assign(GraphTitleBox.Font);
    if Execute then GraphTitleBox.Font.Assign(Font);
  end;
end;

procedure TChartOptionsForm.XFontBtnClick(Sender: TObject);
begin
  with FontDialog1 do
  begin
    Font.Assign(Xtitle.Font);
    if Execute then
    begin
      Xtitle.Font.Assign(Font);
      Ytitle.Font.Assign(Font);
    end;
  end;
end;

procedure TChartOptionsForm.YFontBtnClick(Sender: TObject);
begin
  with FontDialog1 do
  begin
    Font.Assign(Ytitle.Font);
    if Execute then
    begin
      Ytitle.Font.Assign(Font);
      Xtitle.Font.Assign(Font);
    end;
  end;
end;

procedure TChartOptionsForm.LegendFontBtnClick(Sender: TObject);
begin
  with FontDialog1 do
  begin
    Font.Assign(SeriesTitle.Font);
    if Execute then SeriesTitle.Font.Assign(Font);
  end;
end;

procedure TChartOptionsForm.BitBtn3Click(Sender: TObject);
begin
  if HelpContext > 0 then
    Application.HelpCommand(HELP_CONTEXT, HelpContext);
end;

procedure TChartOptionsForm.LineStyleBoxChange(Sender: TObject);
begin
  if LineStyleBox.ItemIndex > 0 then
    LineSizeBox.Value := 1;
end;

procedure TChartOptionsForm.SeriesListBoxClick(Sender: TObject);
begin
  if (Sender is TComboBox) then
    with Sender as TComboBox do
    begin
      GetSeriesOptions(theIndex);  {Store options for current series}
      theIndex := ItemIndex;       {Update value of current series}
      SetSeriesOptions(theIndex);  {Load series options into form}
    end;
end;

procedure TChartOptionsForm.LoadOptions(aChart: TChart);
{------------------------------------------------------
  Transfers data from aChart to form.
-------------------------------------------------------}
var
  i: Integer;
  s: String;
  SeriesOptions: TSeriesOptions;
begin
  IsPieChart := False;
  with aChart do
  begin

  { General Page }
    View3DBox.Checked := View3D;
    Percent3DBox.Value := Chart3DPercent;
    PanelColorBox.Selected := Color;
    BackColorBox.Selected := BackColor;
    GraphTitleBox.Font.Assign(Title.Font);
    if (Title.Text.Count > 0) then
      GraphTitleBox.Text := Title.Text[0];

  { Series Page - do before Axis pages to get value for IsPieChart }
  { Save current line series options }
    IsDateTime := False;
    SeriesTitle.Font.Assign(Legend.Font);
    for i := 0 to SeriesCount-1 do
    begin
      if Series[i].Active then
      begin
        SeriesOptions := TSeriesOptions.Create;
        s := 'Series' + IntToStr(i+1);
        SeriesListBox.Items.Add(s);
        if Series[i].XValues.DateTime then IsDateTime := True;

        with Series[i], SeriesOptions do
        begin
          LabelsVisible := Marks.Visible;
          LabelsArrows := Marks.Arrow.Visible;
          LabelsTransparent := Marks.Transparent;
          LabelsBackColor := Marks.BackColor;
          LabelsStyle := Ord(Marks.Style);
        end;
        if Series[i] is TLineSeries then
          with Series[i] as TLineSeries, SeriesOptions do
          begin
            SeriesType := stLine;
            LineVisible := LinePen.Visible;
            LineStyle := Ord(LinePen.Style);
            LineColor := SeriesColor;
            LineWidth := LinePen.Width;
            AreaFillStyle := Ord(LineBrush);
            PointVisible := Pointer.Visible;
            PointStyle := Ord(Pointer.Style);
            PointColor := Pointer.Brush.Color;
            PointSize := Pointer.HorizSize;
          end
        else if Series[i] is TFastLineSeries then
          with Series[i] as TFastLineSeries, SeriesOptions do
          begin
            SeriesType := stFastLine;
            LineVisible := LinePen.Visible;
            LineStyle := Ord(LinePen.Style);
            LineColor := SeriesColor;
            LineWidth := LinePen.Width;
          end
        else if Series[i] is TPointSeries then
          with Series[i] as TPointSeries, SeriesOptions do
          begin
            SeriesType := stPoint;
            PointVisible := Pointer.Visible;
            PointStyle := Ord(Pointer.Style);
            PointColor := SeriesColor;
            PointSize := Pointer.HorizSize;
          end
        else if Series[i] is TBarSeries then
          with Series[i] as TBarSeries, SeriesOptions do
          begin
            SeriesType := stBar;
            AreaFillStyle := Ord(BarBrush.Style);
            if BarBrush.Style = bsSolid then
            begin
              AreaFillColor := SeriesColor;
              LineColor := BarBrush.Color;
            end
            else
            begin
              LineColor := SeriesColor;
              AreaFillColor := BarBrush.Color;
            end;
            AreaStacking := Ord(MultiBar);
          end
        else if Series[i] is THorizBarSeries then
          with Series[i] as THorizBarSeries, SeriesOptions do
          begin
            SeriesType := stHorizBar;
            AreaFillStyle := Ord(BarBrush.Style);
            if BarBrush.Style = bsSolid then
            begin
              AreaFillColor := SeriesColor;
              LineColor := BarBrush.Color;
            end
            else
            begin
              LineColor := SeriesColor;
              AreaFillColor := BarBrush.Color;
            end;
            AreaStacking := Ord(MultiBar);
          end
        else if Series[i] is TAreaSeries then
          with Series[i] as TAreaSeries, SeriesOptions do
          begin
            SeriesType := stArea;
            LineVisible := AreaLinesPen.Visible;
            LineStyle := Ord(AreaLinesPen.Style);
            LineColor := AreaLinesPen.Color;
            LineWidth := AreaLinesPen.Width;
            AreaFillColor := SeriesColor;
            AreaFillStyle := Ord(AreaBrush);
          end
        else if Series[i] is TPieSeries then
          with Series[i] as TPieSeries, SeriesOptions do
          begin
            SeriesType := stPie;
            IsPieChart := True;
            LineVisible := PiePen.Visible;
            LineStyle := Ord(PiePen.Style);
            LineColor := PiePen.Color;  //SeriesColor;
            LineWidth := PiePen.Width;
            PieCircled := Circled;
            PieUsePatterns := UsePatterns;
            PieRotation := RotationAngle;
          end;
        if Length(Series[i].Title) > 0 then s := Series[i].Title;
        theSeries.AddObject(s,SeriesOptions);
      end;
    end;

  { X Axis Page }
    if IsPieChart then XaxisPage.TabVisible := False
    else
    begin
      if IsDateTime then LoadDateTimeOptions(aChart) else
      begin
        XdataMinLabel.Caption := Format('(%f)',[MinXValue(BottomAxis)]);
        XdataMaxLabel.Caption := Format('(%f)',[MaxXValue(BottomAxis)]);
        XFormatLabel.Visible := False;
        DateFmtCombo.Visible := False;
        with BottomAxis do
        begin
          Xauto.Checked := Automatic;
          if not Automatic then
          begin
            Xmin.Text := Format('%f',[Minimum]);
            Xmax.Text := Format('%f',[Maximum]);
            Xinc.Text := Format('%f',[Increment]);
          end;
        end;
      end;
      with BottomAxis do
      begin
        Xgrid.Checked := Grid.Visible;
        Xtitle.Font.Assign(Title.Font);
        Xtitle.Text := Title.Caption;
      end;
    end;

  { Y Axis Page }
    if IsPieChart then YaxisPage.TabVisible := False
    else
    begin
      YdataMinLabel.Caption := Format('(%f)',[MinYValue(LeftAxis)]);
      YdataMaxLabel.Caption := Format('(%f)',[MaxYValue(LeftAxis)]);
      with LeftAxis do
      begin
        Yauto.Checked := Automatic;
        if not Automatic then
        begin
          Ymin.Text := Format('%f',[Minimum]);
          Ymax.Text := Format('%f',[Maximum]);
          Yinc.Text := Format('%f',[Increment]);
        end;
        Ygrid.Checked := Grid.Visible;
        Ytitle.Font.Assign(Title.Font);
        Ytitle.Text := Title.Caption;
      end;
    end;

  { Legend Page }
    LegendPosBox.ItemIndex := Ord(Legend.Alignment);
    LegendColorBox.Selected := Legend.Color;
    LegendWidthbox.Value := Legend.ColorWidth;
    LegendFrameBox.Checked := Legend.Frame.Visible;
    LegendVisibleBox.Checked := Legend.Visible;
  end;

//Set current series to first series & update dialog entries
  if aChart.SeriesCount > 0 then
  begin
    SetSeriesOptions(0);
    SeriesListBox.ItemIndex := 0;
    theIndex := 0;
    SeriesListBoxClick(SeriesListBox);
  end
  else SeriesPage.TabVisible := False;
end;

procedure TChartOptionsForm.LoadDateTimeOptions(aChart: TChart);
{--------------------------------------------------------------
   Sets up the X Axis page for using Date/Time formats.
---------------------------------------------------------------}
var
  i      : Integer;
  fType  : Integer;
  s      : String;
  minDate: TDateTime;
  maxDate: TDateTime;
begin
  XdataMinLabel.Visible := False;
  XdataMaxLabel.Visible := False;
  Xmin.Enabled := False;
  Xmax.Enabled := False;
  Xinc.Visible := False;
  XIncrementLabel.Visible := False;
  XFormatLabel.Top := XIncrementLabel.Top;
  XFormatLabel.Visible := True;
  DateFmtCombo.Left := Xinc.Left;
  DateFmtCombo.Visible := True;
  Xauto.Checked := True;
  Xauto.Enabled := False;
  minDate := aChart.MinXValue(aChart.BottomAxis);
  DateTimeToString(s, DateFormats[1], minDate);
  Xmin.Text := s;
  maxDate := aChart.MaxXValue(aChart.BottomAxis);
  DateTimeToString(s, DateFormats[1], maxDate);
  Xmax.Text := s;
  s := aChart.BottomAxis.DateTimeFormat;
  fType := 1;
  for i := 0 to High(DateFormats) do
    if SameText(s, DateFormats[i]) then fType := i;
  for i := 0 to High(DateFormats) do
  begin
    DateTimeToString(s, DateFormats[i], minDate);
    DateFmtCombo.Items.Add(s);
  end;
  DateFmtCombo.ItemIndex := fType;
end;

procedure TChartOptionsForm.UnloadOptions(aChart: TChart);
{--------------------------------------------------------
   Transfers data from form back to aChart.
---------------------------------------------------------}
var
  i,j: Integer;
  s  : String;
  SeriesOptions: TSeriesOptions;
begin
  with aChart do
  begin

  { General Page }
    View3D := View3DBox.Checked;
    Chart3DPercent := Percent3DBox.Value;
    BackColor := BackColorBox.Selected;
    Color := PanelColorBox.Selected;
    Title.Font.Assign(GraphTitleBox.Font);
    s := GraphTitleBox.Text;
    Title.Text.Clear;
    if (Length(s) > 0) then Title.Text.Add(s);

  { X Axis Page }
    if not IsPieChart then with BottomAxis do
    begin
      Automatic := Xauto.Checked;
      if IsDateTime then
        DateTimeFormat := DateFormats[DateFmtCombo.ItemIndex]
      else if not Automatic then
        SetAxisScaling(BottomAxis,Xmin.Text,Xmax.Text,Xinc.Text);
      Grid.Visible := Xgrid.Checked;
      Title.Caption := Xtitle.Text;
      Title.Font.Assign(Xtitle.Font);
      LabelsFont.Assign(Xtitle.Font);
    end;

  { Y Axis Page }
    if not IsPieChart then with LeftAxis do
    begin
      Automatic := Yauto.Checked;
      if not Automatic then
        SetAxisScaling(LeftAxis,Ymin.Text,Ymax.Text,Yinc.Text);
      Grid.Visible := Ygrid.Checked;
      Title.Caption := Ytitle.Text;
      Title.Font.Assign(Ytitle.Font);
      LabelsFont.Assign(Ytitle.Font);
    end;

  { Legend Page }
    Legend.Alignment := TLegendAlignment(LegendPosBox.ItemIndex);
    Legend.Color := LegendColorBox.Selected;
    Legend.ColorWidth := LegendWidthBox.Value;
    if LegendFrameBox.Checked then
      Legend.Frame.Visible := True
    else
      Legend.Frame.Visible := False;
    Legend.Visible := LegendVisibleBox.Checked;
    Legend.Font.Assign(SeriesTitle.Font);

  { Series Page }
    if SeriesCount > 0 then
    begin
      GetSeriesOptions(theIndex);
      j := 0;
      for i := 0 to SeriesCount-1 do
      begin
        if Series[i].Active then
        begin
          SeriesOptions := TSeriesOptions(theSeries.Objects[j]);
          Series[i].Title := theSeries.Strings[j];

          with Series[i], SeriesOptions do
          begin
            Marks.Visible := LabelsVisible;
            Marks.Arrow.Visible := LabelsArrows;
            Marks.Transparent := LabelsTransparent;
            Marks.BackColor := LabelsBackColor;
            Marks.Style := TSeriesMarksStyle(LabelsStyle);
          end;

          if Series[i] is TLineSeries then
          with Series[i] as TLineSeries, SeriesOptions do
          begin
            LinePen.Visible := LineVisible;
            if LinePen.Visible then
              LinePen.Style := TPenStyle(LineStyle)
            else
              LinePen.Style := psClear;
            SeriesColor := LineColor;
            LinePen.Width := LineWidth;
            Pointer.Visible := PointVisible;
            Pointer.Style := TSeriesPointerStyle(PointStyle);
            Pointer.Brush.Color := PointColor;
            Pointer.HorizSize := PointSize;
            Pointer.VertSize := Pointer.HorizSize;
            LineBrush := TBrushStyle(AreaFillStyle);
            if (not Pointer.Visible) and (not LinePen.Visible) then
              ShowinLegend := False
            else
              ShowinLegend := True;
          end;

          if Series[i] is TFastLineSeries then
          with Series[i] as TFastLineSeries, SeriesOptions do
          begin
            LinePen.Visible := LineVisible;
            if LinePen.Visible then
              LinePen.Style := TPenStyle(LineStyle)
            else
              LinePen.Style := psClear;
            SeriesColor := LineColor;
            LinePen.Width := LineWidth;
            if (not LinePen.Visible) then
              ShowinLegend := False
            else
              ShowinLegend := True;
          end;

          if Series[i] is TPointSeries then
          with Series[i] as TPointSeries, SeriesOptions do
          begin
            Pointer.Visible := PointVisible;
            Pointer.Style := TSeriesPointerStyle(PointStyle);
            SeriesColor := PointColor;
            //Pointer.Brush.Color := PointColor;
            Pointer.HorizSize := PointSize;
            Pointer.VertSize := Pointer.HorizSize;
          end

          else if Series[i] is TBarSeries then
          with Series[i] as TBarSeries, SeriesOptions do
          begin
            BarBrush.Style := TBrushStyle(AreaFillStyle);
            if BarBrush.Style = bsSolid then
            begin
              SeriesColor := AreaFillColor;
              BarBrush.Color := AreaFillColor
            end
            else
            begin
              SeriesColor := LineColor;
              BarBrush.Color := AreaFillColor;
            end;
            MultiBar := TMultiBar(AreaStacking);
          end

          else if Series[i] is THorizBarSeries then
          with Series[i] as THorizBarSeries, SeriesOptions do
          begin
            BarBrush.Style := TBrushStyle(AreaFillStyle);
            if BarBrush.Style = bsSolid then
            begin
              SeriesColor := AreaFillColor;
              BarBrush.Color := AreaFillColor
            end
            else
            begin
              SeriesColor := LineColor;
              BarBrush.Color := AreaFillColor;
            end;
            MultiBar := TMultiBar(AreaStacking);
          end

          else if Series[i] is TAreaSeries then
          with Series[i] as TAreaSeries, SeriesOptions do
          begin
            AreaBrush := TBrushStyle(AreaFillStyle);
            SeriesColor := AreaFillColor;
            if AreaBrush = bsSolid then
              AreaColor := AreaFillColor
            else
              AreaColor := LineColor;
            AreaLinesPen.Visible := LineVisible;
            AreaLinesPen.Style := TPenStyle(LineStyle);
            AreaLinesPen.Color := LineColor;
            AreaLinesPen.Width := LineWidth;
          end

          else if Series[i] is TPieSeries then
          with Series[i] as TPieSeries, SeriesOptions do
          begin
            PiePen.Visible := LineVisible;
            PiePen.Style := TPenStyle(LineStyle);
            PiePen.Color := LineColor;
            PiePen.Width := LineWidth;
            Circled := PieCircled;
            UsePatterns := PieUsePatterns;
            RotationAngle := PieRotation;
          end;

          Inc(j);
        end;
      end;
    end;
  end;
end;

procedure TChartOptionsForm.SetAxisScaling(Axis: TChartAxis;
            const Smin,Smax,Sinc: String);
{-------------------------------------------------
   Retrieves axis scaling options from form.
--------------------------------------------------}
var
  code: Integer;
  v   : Double;
begin
  with Axis do
  begin
    AutomaticMinimum := False;
    Val(Smin,v,code);
    if (code = 0) then
      Minimum := v
    else
      AutomaticMinimum := True;
    AutomaticMaximum := False;
    Val(Smax,v,code);
    if (code = 0) then
      Maximum := v
    else
      AutomaticMaximum := True;
    Val(Sinc,v,code);
    if (code = 0) then
      Increment := v
    else
      Increment := 0;
  end;
end;

procedure TChartOptionsForm.SetSeriesOptions(const Index: Integer);
{------------------------------------------------------
   Transfer options for data series Index to form.
------------------------------------------------------}
var
  SeriesOptions: TSeriesOptions;
begin
  SeriesTitle.Text := theSeries.Strings[Index];
  SeriesOptions := TSeriesOptions(theSeries.Objects[Index]);
  with SeriesOptions do
  begin
    LineStyleBox.ItemIndex := LineStyle;
    LineColorBox.Selected := LineColor;
    LineSizeBox.Value := LineWidth;
    LineVisibleBox.Checked := LineVisible;
    MarkStyleBox.ItemIndex := PointStyle;
    MarkColorBox.Selected := PointColor;
    MarkSizeBox.Value := PointSize;
    MarkVisibleBox.Checked := PointVisible;
    AreaFillStyleBox.ItemIndex := AreaFillStyle;
    AreaColorBox.Selected := AreaFillColor;
    StackStyleBox.ItemIndex := AreaStacking;
    PieCircledBox.Checked := PieCircled;
    PiePatternBox.Checked := PieUsePatterns;
    PieRotationBox.Value := PieRotation;
    LabelsVisibleBox.Checked := LabelsVisible;
    LabelsTransparentBox.Checked := LabelsTransparent;
    LabelsBackColorBox.Selected := LabelsBackColor;
    LabelsArrowsBox.Checked := LabelsArrows;
    LabelsStyleBox.ItemIndex := LabelsStyle;
  end;
  PieOptionsSheet.TabVisible := False;
  case SeriesOptions.SeriesType of
  stLine:
  begin
    LineOptionsSheet.TabVisible := True;
    MarkOptionsSheet.TabVisible := True;
    AreaOptionsSheet.TabVisible := True;
    LabelsOptionsSheet.TabVisible := True;
    PageControl2.ActivePage := LineOptionsSheet;
  end;
  stFastLine:
  begin
    LineOptionsSheet.TabVisible := True;
    MarkOptionsSheet.TabVisible := False;
    AreaOptionsSheet.TabVisible := False;
    LabelsOptionsSheet.TabVisible := False;
    PageControl2.ActivePage := LineOptionsSheet;
  end;
  stPoint:
  begin
    LineOptionsSheet.TabVisible := False;
    MarkOptionsSheet.TabVisible := True;
    AreaOptionsSheet.TabVisible := False;
    LabelsOptionsSheet.TabVisible := True;
    PageControl2.ActivePage := MarkOptionsSheet;
  end;
  stBar, stHorizBar:
  begin
    LineOptionsSheet.TabVisible := True;
    MarkOptionsSheet.TabVisible := False;
    AreaOptionsSheet.TabVisible := True;
    LabelsOptionsSheet.TabVisible := True;
    PageControl2.ActivePage := AreaOptionsSheet;
  end;
  stArea:
  begin
    LineOptionsSheet.TabVisible := True;
    MarkOptionsSheet.TabVisible := False;
    AreaOptionsSheet.TabVisible := True;
    LabelsOptionsSheet.TabVisible := True;
    PageControl2.ActivePage := AreaOptionsSheet;
  end;
  stPie:
  begin
    LineOptionsSheet.TabVisible := True;
    MarkOptionsSheet.TabVisible := False;
    AreaOptionsSheet.TabVisible := False;
    PieOptionsSheet.TabVisible := True;
    LabelsOptionsSheet.TabVisible := True;
    PageControl2.ActivePage := PieOptionsSheet;
  end;
  end;
end;

procedure TChartOptionsForm.GetSeriesOptions(const Index: Integer);
{------------------------------------------------------
   Transfer options from form to data series Index.
------------------------------------------------------}
var
  SeriesOptions: TSeriesOptions;
begin
  theSeries.Strings[Index] := SeriesTitle.Text;
  SeriesOptions := TSeriesOptions(theSeries.Objects[Index]);
  with SeriesOptions do
  begin
    if LineOptionsSheet.TabVisible then
    begin
      LineStyle := LineStyleBox.ItemIndex;
      LineColor := LineColorBox.Selected;
      LineWidth := LineSizeBox.Value;
      LineVisible := LineVisibleBox.Checked;
    end;
    if MarkOptionsSheet.TabVisible then
    begin
      PointStyle := MarkStyleBox.ItemIndex;
      PointColor := MarkColorBox.Selected;
      PointSize := MarkSizeBox.Value;
      PointVisible := MarkVisibleBox.Checked;
    end;
    if AreaOptionsSheet.TabVisible then
    begin
      AreaFillStyle := AreaFillStyleBox.ItemIndex;
      AreaFillColor := AreaColorBox.Selected;
      AreaStacking := StackStyleBox.ItemIndex;
    end;
    if PieOptionsSheet.TabVisible then
    begin
      PieCircled := PieCircledBox.Checked;
      PieUsePatterns := PiePatternBox.Checked;
      PieRotation := PieRotationBox.Value;
    end;
    if LabelsOptionsSheet.TabVisible then
    begin
      LabelsVisible := LabelsVisibleBox.Checked;
      LabelsArrows := LabelsArrowsBox.Checked;
      LabelsTransparent := LabelsTransparentBox.Checked;
      LabelsBackColor := LabelsBackColorBox.Selected;
      LabelsStyle := LabelsStyleBox.ItemIndex;
    end;
  end;
end;

end.
