import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:organizei/components/botao.dart';
import 'package:organizei/components/dialogs/login/entrarDialog.dart';

void main() {
  group('LOGIN', () {
    testWidgets('Email e CPF/CNPJ vazio', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Builder(
              builder: (BuildContext context) {
                return Botao(
                    key: Key("keyEntrarButton"),
                    texto: 'Entrar',
                    cor: const Color(0xFF74C198),
                    clicar: () {
                      print('aaaa');
                      entrar(context);
                    });
              },
            ),
          ),
        ),
      );
      //Entra no widget

      //Pressiona o botão de "Entrar"
      await tester.tap(find.byKey(ValueKey("keyEntrarButton")));

      //Atualiza o estado da tela
      await tester.pump();

      expect(find.text('e-mail'), findsOneWidget);
      expect(find.text('senha'), findsOneWidget);

      //Verifica se ambas validações aparecem em tela
      // expect(find.text('Informe o CPF/CNPJ'), findsOneWidget);
      // expect(find.text('Informe o Email'), findsOneWidget);
    });
    testWidgets('Senha vazia', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Material(
          child: Builder(
            builder: (BuildContext context) {
              return Botao(
                  key: Key("keyEntrarButton"),
                  texto: 'clicar',
                  cor: const Color(0xFF74C198),
                  clicar: () {
                    print('aaaa');
                    entrar(context);
                  });
            },
          ),
        ),
      ));

      await tester.tap(find.byKey(ValueKey("keyEntrarButton")));
      await tester.pump();

      await tester.enterText(find.text('nome'), "email@empresa.com");

      // await tester.tap(find.byKey(ValueKey("BB")));

      //await tester.enterText(find.byKey(ValueKey("BB")), "email@empresa.com");
      // await tester.tap(find.text('Entrar'));
      //await tester.tap(find.byKey(ValueKey("BB")));
      //await tester.tap(find.text('Entrar'));

      // await tester.enterText(
      //     find.byKey(ValueKey("keyTextFieldEmail")), "email@empresa.com");

      //await tester.enterText(find.text('e-mail'), "email@empresa.com");

      // await tester.enterText(
      //     find.byKey(ValueKey("keyTextFieldEmail")), "email@empresa.com");
      // await tester.tap(find.byKey(ValueKey("keyEntrarButton")));
      // await tester.pump();
      // expect(find.text('Informe o CPF/CNPJ'), findsOneWidget);
      // expect(find.text('Informe o Email'), findsNothing);
    });

    //Verifica se ambas validações aparecem em tela
    // expect(find.text('Informe o CPF/CNPJ'), findsOneWidget);
    // expect(find.text('Informe o Email'), findsOneWidget);
  });
}
