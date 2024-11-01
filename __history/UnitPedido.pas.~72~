  unit UnitPedido;

  interface

  uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
    FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
    FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
    Data.DB, FireDAC.Comp.Client, Vcl.ExtCtrls, FireDAC.Phys.MySQL,
    FireDAC.Phys.MySQLDef, FireDAC.Comp.UI, UnitBD, Vcl.Grids, Vcl.StdCtrls,
    Vcl.DBGrids, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, System.Generics.Collections;

  type
  TCliente = class
  public
    Codigo: Integer;
    Nome: string;
    Cidade: string;
    UF: string;
  end;

  TProduto = class
  public
    Codigo: Integer;
    Descricao: string;
    PrecoVenda: Double;
  end;

  TItemPedido = class
  public
    Produto: TProduto;
    Quantidade: Integer;
    PrecoVenda: Double;
    function ValorTotal: Double;
  end;

  TPedido = class
  public
    Itens: TList<TItemPedido>;
    function ValorTotalPedido: Double;
    constructor Create;
    destructor Destroy; override;
  end;

  type
    TForm1 = class(TForm)
      Panel1: TPanel;
      gridProdutos: TDBGrid;
    BtnAdicionarProduto: TButton;
    BtnGravarPedido: TButton;
    EditClienteCodigo: TEdit;
      Label1: TLabel;
      lblValorTotal: TLabel;
    EditProdutoCodigo: TEdit;
    EditQuantidade: TEdit;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
    EditPrecoUnitario: TEdit;
      Label5: TLabel;
    MemTable: TFDMemTable;
    BtnCancelarPedido: TButton;
    btnBuscarCliente: TButton;
    DataSource1: TDataSource;
    MemTableCodigoProduto: TIntegerField;
    MemTableDescricao: TStringField;
    MemTableQuantidade: TIntegerField;
    MemTablePrecoUnitario: TFloatField;
    MemTableValorTotal: TFloatField;
      procedure FormCreate(Sender: TObject);

    procedure btnBuscarClienteClick(Sender: TObject);
    procedure BtnAdicionarProdutoClick(Sender: TObject);
    procedure gridProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnCarregarPedidoClick(Sender: TObject);
    procedure BtnGravarPedidoClick(Sender: TObject);
    procedure BtnCancelarPedidoClick(Sender: TObject);
    private
      { Private declarations }
      ClienteEncontrado: Boolean;
      procedure AtualizarValorTotal;
      procedure CarregarProdutos;
      procedure CarregarClientes;
      procedure CarregarPedido(PedidoNumero: Integer);
    public
      { Public declarations }
    end;

  var
    Form1: TForm1;
    MemTable: TFDMemTable;
    valorTotalPedido: Currency;

  implementation

  {$R *.dfm}

{ TItemPedido }
  function TItemPedido.ValorTotal: Double;
  begin
    Result := Produto.PrecoVenda * Quantidade;
  end;

{ TPedido }
  constructor TPedido.Create;
  begin
    Itens := TList<TItemPedido>.Create;
  end;

  destructor TPedido.Destroy;
  begin
    Itens.Free;
    inherited;
  end;

function TPedido.ValorTotalPedido: Double;
var
  Item: TItemPedido;
  begin
    Result := 0;
    for Item in Itens do
    Result := Result + Item.ValorTotal;
  end;

procedure TForm1.CarregarPedido(PedidoNumero: Integer);
begin
  // Verifique se o pedido existe
  DataModule1.QrPedidos.Close;
  DataModule1.QrPedidos.SQL.Text :=
    'SELECT CodigoCliente, Nome, Cidade, UF ' +
    'FROM PedidoDadosGerais ' +
    'JOIN Cliente ON PedidoDadosGerais.CodigoCliente = Cliente.Codigo ' +
    'WHERE NumeroPedido = :NumeroPedido';
  DataModule1.QrPedidos.ParamByName('NumeroPedido').AsInteger := PedidoNumero; // Use o parâmetro corretamente
  DataModule1.QrPedidos.Open;

  // Preencha os campos de cliente com os dados do pedido encontrado
  if not DataModule1.QrPedidos.IsEmpty then
  begin
    EditClienteCodigo.Text := DataModule1.QrPedidos.FieldByName('CodigoCliente').AsString;

    // Carregar itens do pedido
    DataModule1.QrItensPedido.Close;
    DataModule1.QrItensPedido.SQL.Text :=
      'SELECT CodigoProduto, Descricao, Quantidade, PrecoVendaUnitario, ' +
      'Quantidade * PrecoVendaUnitario AS ValorTotal ' +
      'FROM ProdutosdoPedido ' +
      'WHERE NumeroPedido = :NumeroPedido';
    DataModule1.QrItensPedido.ParamByName('NumeroPedido').AsInteger := PedidoNumero; // Use o parâmetro corretamente
    DataModule1.QrItensPedido.Open;
  end
  else
  begin
    ShowMessage('Pedido não encontrado.');
  end;
end;


  procedure TForm1.AtualizarValorTotal;
  var
    ValorTotal: Double;
    i: Integer;
  begin
    ValorTotal := 0;
    for i := 0 to MemTable.RecordCount - 1 do
    begin
      MemTable.RecNo := i + 1; // 1-based index
      ValorTotal := ValorTotal + MemTable.FieldByName('ValorTotal').AsFloat;
    end;
    lblValorTotal.Caption := 'Valor Total: ' + FloatToStr(ValorTotal);
    valorTotalPedido := ValorTotal;
  end;


  procedure TForm1.FormCreate(Sender: TObject);
  begin
    //DataModule1.FDConnection1.Connected := True; // Conectar ao banco de dados
    CarregarProdutos;
    MemTable.Open;
  end;

  procedure TForm1.CarregarProdutos;
  begin
    DataModule1.QrProdutos.Open; // Executa a consulta e abre o conjunto de dados
  end;

  procedure TForm1.CarregarClientes;
  begin
    DataModule1.QrClientes.Open; // Executa a consulta e abre o conjunto de dados
  end;

  procedure TForm1.gridProdutosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  begin
    if Key = VK_DELETE then
    begin
      if MessageDlg('Deseja realmente excluir este item?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        MemTable.Delete;
        AtualizarValorTotal; // Atualiza o valor total após a exclusão
      end;
    end;
  end;

procedure TForm1.BtnAdicionarProdutoClick(Sender: TObject);
var
  Produto: TProduto;
  Item: TItemPedido;
  CodigoProduto: Integer;
  Quantidade: Integer;
  PrecoUnitario: Double;
begin
  // Verifica se os campos estão preenchidos
  if not ClienteEncontrado then
  begin
    ShowMessage('Por favor, insira um cliente para o pedido.');
    Exit;
  end;

  if Trim(EditProdutoCodigo.Text) = '' then
  begin
    ShowMessage('Por favor, preencha o campo Código do Produto.');
    Exit;
  end;

  if Trim(EditQuantidade.Text) = '' then
  begin
    ShowMessage('Por favor, preencha o campo Quantidade.');
    Exit;
  end;

  if Trim(EditPrecoUnitario.Text) = '' then
  begin
    ShowMessage('Por favor, preencha o Valor do Produto.');
    Exit;
  end;

  // Tente converter os valores
  if not TryStrToInt(EditProdutoCodigo.Text, CodigoProduto) then
  begin
    ShowMessage('Código do produto inválido.');
    Exit;
  end;

  if not TryStrToInt(EditQuantidade.Text, Quantidade) then
  begin
    ShowMessage('Quantidade inválida.');
    Exit;
  end;

  if not TryStrToFloat(EditPrecoUnitario.Text, PrecoUnitario) then
  begin
    ShowMessage('Preço unitário inválido.');
    Exit;
  end;

  // Aqui você deve implementar a lógica para buscar o produto no banco de dados
  DataModule1.QrProdutos.SQL.Text :=
    'SELECT * FROM produto WHERE codigo = :Codigo';
  DataModule1.QrProdutos.ParamByName('Codigo').AsInteger := CodigoProduto;

  try
    DataModule1.QrProdutos.Open; // Executa a consulta

    if not DataModule1.QrProdutos.IsEmpty then
    begin
      // O produto foi encontrado
      Produto := TProduto.Create;
      try
        Produto.Codigo := DataModule1.QrProdutos.FieldByName('codigo').AsInteger;
        Produto.Descricao := DataModule1.QrProdutos.FieldByName('descricao').AsString;
        Produto.PrecoVenda := DataModule1.QrProdutos.FieldByName('precovenda').AsFloat;

        Item := TItemPedido.Create;
        try
          Item.Produto := Produto;
          Item.Quantidade := Quantidade; // Usar a variável convertida
          Item.PrecoVenda := PrecoUnitario; // Usar a variável convertida

          // Adicionar o item ao MemTable
          MemTable.Append;
          MemTable.FieldByName('CodigoProduto').AsInteger := Produto.Codigo;
          MemTable.FieldByName('Descricao').AsString := Produto.Descricao;
          MemTable.FieldByName('Quantidade').AsInteger := Item.Quantidade;
          MemTable.FieldByName('PrecoUnitario').AsFloat := Produto.PrecoVenda; // Use o preço do produto
          MemTable.FieldByName('ValorTotal').AsFloat := Item.Quantidade * Produto.PrecoVenda; // Cálculo do valor total
          MemTable.Post;

          // Atualizar o valor total do pedido
          AtualizarValorTotal;
        finally
          Item.Free; // Liberar Item após o uso
        end;
      finally
        Produto.Free; // Liberar Produto após o uso
      end;
    end
    else
      ShowMessage('Produto não encontrado.');
  finally
    DataModule1.QrProdutos.Close; // Fecha o conjunto de resultados
  end;
end;



procedure TForm1.btnBuscarClienteClick(Sender: TObject);
var
  Cliente: TCliente;
begin
  Cliente := nil; // Inicializar Cliente como nil
  ClienteEncontrado := False;

  // Aqui você deve implementar a lógica para buscar o cliente no banco de dados
  DataModule1.QrClientes.SQL.Text :=
    'SELECT codigo, nome, cidade, uf FROM cliente WHERE codigo = :Codigo';
  DataModule1.QrClientes.ParamByName('Codigo').AsInteger := StrToInt(EditClienteCodigo.Text);

  try
    DataModule1.QrClientes.Open; // Executa a consulta

    if not DataModule1.QrClientes.IsEmpty then
    begin
      // O cliente foi encontrado
      Cliente := TCliente.Create;
      ClienteEncontrado := True;
      Cliente.Codigo := DataModule1.QrClientes.FieldByName('codigo').AsInteger;
      Cliente.Nome := DataModule1.QrClientes.FieldByName('nome').AsString;
      Cliente.Cidade := DataModule1.QrClientes.FieldByName('cidade').AsString;
      Cliente.UF := DataModule1.QrClientes.FieldByName('uf').AsString;

      // Exibe o nome do cliente
      Label1.Caption := 'Nome: ' + Cliente.Nome;
    end
    else
      ShowMessage('Cliente não encontrado.');
  finally
    // Se o cliente foi encontrado, liberamos a memória
    if Assigned(Cliente) then
      Cliente.Free;

    DataModule1.QrClientes.Close; // Fecha o conjunto de resultados
  end;
end;


procedure TForm1.BtnCancelarPedidoClick(Sender: TObject);
begin
  // Verifica se há itens no MemTable
  if MemTable.RecordCount > 0 then
  begin
    // Exibe uma mensagem de confirmação para o usuário
    if MessageDlg('Você tem certeza que deseja cancelar o pedido?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      // Limpa o MemTable
      MemTable.DisableControls; // Desabilitar os controles para melhorar a performance
      try
        MemTable.EmptyDataSet; // Limpa todos os registros do MemTable
        lblValorTotal.Caption := 'Valor Total: R$ 0,00'; // Reseta o valor total exibido
        EditClienteCodigo.Text := ''; // Limpa o campo do cliente
        // Aqui você pode adicionar outras ações que deseja realizar ao cancelar o pedido
        ShowMessage('Pedido cancelado com sucesso.');
      finally
        MemTable.EnableControls; // Habilitar os controles novamente
      end;
    end;
  end
  else
  begin
    ShowMessage('Não há pedidos para cancelar.');
  end;
end;

procedure TForm1.BtnCarregarPedidoClick(Sender: TObject);
var
  PedidoNumeroStr: string; // Renomeie a variável interna
begin
  if InputQuery('Carregar Pedido', 'Digite o número do pedido:', PedidoNumeroStr) then
  begin
    // Verifique se um número de pedido foi inserido
    if PedidoNumeroStr <> '' then
    begin
      try
        // Chame a função para carregar os dados do pedido, cliente e produtos
        CarregarPedido(StrToInt(PedidoNumeroStr));
      except
        on E: Exception do
          ShowMessage('Erro ao carregar o pedido: ' + E.Message);
      end;
    end
    else
      ShowMessage('Número do pedido não pode estar em branco.');
  end;
end;

procedure TForm1.BtnGravarPedidoClick(Sender: TObject);
var
  NumeroPedido: Integer;
begin

  // Verificar se não há produtos no grid
  if MemTable.RecordCount = 0 then
  begin
    ShowMessage('Nenhum produto inserido. Por favor, adicione produtos ao pedido antes de gravar.');
    Exit; // Sair do procedimento
  end;

  // Começando a transação
  DataModule1.FDConnection1.Connected := True; // Conectar ao banco de dados
  DataModule1.FDConnection1.StartTransaction;
  try
    // Insira o cabeçalho do pedido na tabela "pedidos dados gerais"
    DataModule1.QrProdutos.SQL.Text :=
      'INSERT INTO pedidodadosgerais (dataemissao, codigocliente, valortotal) VALUES (:DataEmissao, :CodigoCliente, :ValorTotal)';

    DataModule1.QrProdutos.ParamByName('DataEmissao').AsDate := Now;

    if EditClienteCodigo.Text <> '' then
      DataModule1.QrProdutos.ParamByName('CodigoCliente').AsInteger := StrToInt(EditClienteCodigo.Text);

    AtualizarValorTotal;
    DataModule1.QrProdutos.ParamByName('ValorTotal').AsFloat := valorTotalPedido;

    // Executa a inserção
    DataModule1.QrProdutos.ExecSQL;

    // Buscar o último número do pedido gerado
    DataModule1.QrProdutos.SQL.Text := 'SELECT LAST_INSERT_ID() AS NumeroPedido'; // Para MySQL
    DataModule1.QrProdutos.Open;
    if not DataModule1.QrProdutos.IsEmpty then
      NumeroPedido := DataModule1.QrProdutos.FieldByName('NumeroPedido').AsInteger
    else
      raise Exception.Create('Erro ao obter o número do pedido.');

    // Insira os itens do pedido na tabela "pedidos_produtos"
    for var i := 0 to MemTable.RecordCount - 1 do
    begin
      MemTable.RecNo := i + 1; // 1-based index
      DataModule1.QrClientes.SQL.Text :=
        'INSERT INTO produtosdopedido (numeropedido, codigoproduto, quantidade, precovendaunitario) VALUES (:NumeroPedido, :CodigoProduto, :Quantidade, :PrecoUnitario)';

      DataModule1.QrClientes.ParamByName('NumeroPedido').AsInteger := NumeroPedido;
      DataModule1.QrClientes.ParamByName('CodigoProduto').AsInteger := MemTable.FieldByName('CodigoProduto').AsInteger;
      DataModule1.QrClientes.ParamByName('Quantidade').AsInteger := MemTable.FieldByName('Quantidade').AsInteger;
      DataModule1.QrClientes.ParamByName('PrecoUnitario').AsFloat := MemTable.FieldByName('PrecoUnitario').AsFloat;
      //DataModule1.QrClientes.ParamByName('ValorTotal').AsFloat := MemTable.FieldByName('ValorTotal').AsFloat;

      DataModule1.QrClientes.ExecSQL;
    end;

    // Confirmar a transação
    DataModule1.FDConnection1.Commit;
    ShowMessage('Pedido gravado com sucesso!');

    // Limpar os campos e o grid após o sucesso da gravação
    EditClienteCodigo.Clear;
    EditProdutoCodigo.Clear;
    EditQuantidade.Clear;
    lblValorTotal.Caption := '0.00'; // Resetando o valor total

    MemTable.EmptyDataSet; // Limpar o grid de itens do pedido

  except
    on E: Exception do
    begin
      // Reverter a transação em caso de erro
      DataModule1.FDConnection1.Rollback;
      ShowMessage('Erro ao gravar o pedido: ' + E.Message);
    end;
  end;
end;

end.
