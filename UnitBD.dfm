object DataModule1: TDataModule1
  OnCreate = DataModuleCreate
  Height = 340
  Width = 757
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Projetos\TesteDelphi\Win64\Debug\libmysql.dll'
    Left = 152
    Top = 8
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=TesteDelphi'
      'User_Name=root'
      'Password=Lenovo,2001'
      'DriverID=MySQL')
    Left = 248
    Top = 8
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 336
    Top = 8
  end
  object QrProdutos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM Produto;')
    Left = 24
    Top = 96
  end
  object DsProdutos: TDataSource
    DataSet = QrProdutos
    Left = 88
    Top = 96
  end
  object QrClientes: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM clientes;')
    Left = 176
    Top = 96
  end
  object DsClientes: TDataSource
    DataSet = QrClientes
    Left = 248
    Top = 96
  end
  object QrPedidos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM pedidos;')
    Left = 360
    Top = 96
  end
  object DsPedidos: TDataSource
    DataSet = QrPedidos
    Left = 440
    Top = 96
  end
  object QrItensPedido: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM itens_pedido;')
    Left = 568
    Top = 96
  end
  object DsItensPedido: TDataSource
    DataSet = QrItensPedido
    Left = 648
    Top = 96
  end
end
