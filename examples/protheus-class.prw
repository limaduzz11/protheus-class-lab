#include "Protheus.ch"

/*--------------------------------------------------------------------*
| Func:  ClassBase()
| Autor: Eduardo Paranhos (clone educacional)
| Data:  10/08/2026
| Desc:  Exemplo de classe ADVPL — encapsulamento, construtor, metodos
| Obs.:  Exemplo generico — dados ficticios
*---------------------------------------------------------------------*/

#include "Protheus.ch"

/*--------------------------------------------------------------------*
| Classe: Produto — Encapsula operacoes de produto
*---------------------------------------------------------------------*/
CLASS Produto

    DATA cCodigo   AS CHARACTER
    DATA cDesc     AS CHARACTER
    DATA nPreco    AS NUMERIC
    DATA nEstoque  AS NUMERIC
    DATA lAtivo    AS LOGIC

    METHOD New() CONSTRUCTOR
    METHOD GetValorEstoque()
    METHOD AtualizarPreco(nNovoPreco)
    METHOD TemEstoque(nQtd)
    METHOD Ativar()
    METHOD Desativar()

ENDCLASS

METHOD New(cCodigo, cDesc, nPreco, nEstoque) CLASS Produto

    ::cCodigo  := Iif(cCodigo != Nil, cCodigo, "")
    ::cDesc    := Iif(cDesc != Nil, cDesc, "")
    ::nPreco   := Iif(nPreco != Nil, nPreco, 0)
    ::nEstoque := Iif(nEstoque != Nil, nEstoque, 0)
    ::lAtivo   := .T.

    ConOut("[Produto:New] Produto criado: " + ::cCodigo + " - " + ::cDesc)

Return Self

METHOD GetValorEstoque() CLASS Produto
Return ::nPreco * ::nEstoque

METHOD AtualizarPreco(nNovoPreco) CLASS Produto

    Local nPrecoAntigo := ::nPreco

    If nNovoPreco > 0
        ::nPreco := nNovoPreco
        ConOut("[Produto] Preco atualizado: R$ " + cValToChar(nPrecoAntigo) + " -> R$ " + cValToChar(::nPreco))
    EndIf

Return

METHOD TemEstoque(nQtd) CLASS Produto
Return (::nEstoque >= nQtd .And. ::lAtivo)

METHOD Ativar() CLASS Produto
    ::lAtivo := .T.
Return

METHOD Desativar() CLASS Produto
    ::lAtivo := .F.
Return

/*--------------------------------------------------------------------*
| Exemplo de uso da classe
*---------------------------------------------------------------------*/
User Function ClassExample()

    Local oProd := Produto():New("PROD001", "Produto Exemplo", 150.00, 25)

    ConOut("Valor em estoque: R$ " + cValToChar(oProd:GetValorEstoque()))
    ConOut("Tem 10 unidades? " + Iif(oProd:TemEstoque(10), "Sim", "Nao"))

    oProd:AtualizarPreco(180.00)
    ConOut("Novo valor estoque: R$ " + cValToChar(oProd:GetValorEstoque()))

Return
