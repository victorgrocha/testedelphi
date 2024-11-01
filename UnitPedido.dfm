object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 549
  ClientWidth = 811
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 811
    Height = 549
    Align = alClient
    Color = clCrimson
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 137
      Height = 21
      Caption = 'Codigo do Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValorTotal: TLabel
      Left = 8
      Top = 352
      Width = 82
      Height = 21
      Caption = 'Valor Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 304
      Top = 402
      Width = 122
      Height = 21
      Caption = 'Insira o Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 7
      Top = 461
      Width = 145
      Height = 21
      Caption = 'C'#243'digo do Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 224
      Top = 461
      Width = 90
      Height = 21
      Caption = 'Quantidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 410
      Top = 461
      Width = 107
      Height = 21
      Caption = 'Valor Unit'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object gridProdutos: TDBGrid
      Left = 8
      Top = 72
      Width = 793
      Height = 273
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnKeyDown = gridProdutosKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'CodigoProduto'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Descricao'
          Title.Caption = 'Descri'#231#227'o'
          Width = 314
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Quantidade'
          Width = 118
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PrecoUnitario'
          Title.Caption = 'Valor Unit'#225'rio'
          Width = 136
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorTotal'
          Title.Caption = 'Total'
          Width = 114
          Visible = True
        end>
    end
    object BtnAdicionarProduto: TButton
      Left = 624
      Top = 435
      Width = 121
      Height = 25
      Caption = 'Adicionar Produto'
      TabOrder = 1
      OnClick = BtnAdicionarProdutoClick
    end
    object BtnGravarPedido: TButton
      Left = 696
      Top = 486
      Width = 105
      Height = 25
      Caption = 'Gravar Pedido'
      TabOrder = 2
      OnClick = BtnGravarPedidoClick
    end
    object EditClienteCodigo: TEdit
      Left = 8
      Top = 43
      Width = 289
      Height = 23
      TabOrder = 3
    end
    object EditProdutoCodigo: TEdit
      Left = 7
      Top = 488
      Width = 121
      Height = 23
      TabOrder = 4
    end
    object EditQuantidade: TEdit
      Left = 224
      Top = 488
      Width = 121
      Height = 23
      TabOrder = 5
    end
    object EditPrecoUnitario: TEdit
      Left = 410
      Top = 488
      Width = 121
      Height = 23
      TabOrder = 6
    end
    object BtnCancelarPedido: TButton
      Left = 552
      Top = 486
      Width = 121
      Height = 25
      Caption = 'Cancelar Pedido'
      TabOrder = 7
      OnClick = BtnCancelarPedidoClick
    end
    object btnBuscarCliente: TButton
      Left = 322
      Top = 42
      Width = 95
      Height = 25
      Caption = 'Buscar Cliente'
      TabOrder = 8
      OnClick = btnBuscarClienteClick
    end
  end
  object MemTable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 552
    Top = 8
    object MemTableCodigoProduto: TIntegerField
      FieldName = 'CodigoProduto'
    end
    object MemTableDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object MemTableQuantidade: TIntegerField
      FieldName = 'Quantidade'
    end
    object MemTablePrecoUnitario: TFloatField
      FieldName = 'PrecoUnitario'
    end
    object MemTableValorTotal: TFloatField
      FieldName = 'ValorTotal'
    end
  end
  object DataSource1: TDataSource
    DataSet = MemTable
    Left = 616
    Top = 8
  end
end
