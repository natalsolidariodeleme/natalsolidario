# Natal Solidário

Página responsiva em Flutter para divulgar a arrecadação de uma campanha de Natal e receber doações via Pix.

## Configuração da campanha

Edite as constantes no início de `lib/main.dart` antes de publicar:

- `totalArrecadado`: valor arrecadado até o momento.
- `metaDeArrecadacao`: meta da campanha.
- `nomeDaCampanha`: título usado no site.
- `chavePix`: chave Pix para exibição.
- `codigoPixCopiaECola`: payload Pix completo gerado pelo banco ou provedor de pagamentos. O QR Code e o botão de copiar são ativados quando este valor é preenchido.
- `linkGrupoWhatsApp`: convite HTTPS para o grupo de voluntariado. O botão só fica ativo quando o link é informado.
- `emailCampanha`: endereço de contato exibido nas orientações de segurança.

Não use uma chave Pix como `codigoPixCopiaECola`: configure o código Pix completo para que o QR Code possa ser lido como pagamento.

As datas e os itens das cestas exibidos na página também podem ser ajustados diretamente nos componentes correspondentes em `lib/main.dart`.

## Executar

```sh
flutter pub get
flutter run -d chrome
```
