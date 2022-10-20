import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:organizei/components/botao.dart';
import 'package:organizei/components/dialogs/login/entrarDialog.dart';

void main() {
  group('LOGIN', () {
    testWidgets('E-mail e senha vazios', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Builder(
              builder: (BuildContext context) {
                return Botao(
                    key: Key("keyTesteButton"),
                    texto: 'Entrar',
                    cor: const Color(0xFF74C198),
                    clicar: () {
                      entrar(context);
                    });
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byKey(ValueKey("keyTesteButton")));
      await tester.pump();
      await tester.ensureVisible(find.byKey(Key("keyEntrarButton")));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(ValueKey("keyEntrarButton")));
    });

    testWidgets('E-mail vazio', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Material(
          child: Builder(
            builder: (BuildContext context) {
              return Botao(
                  key: Key("keyTesteButton"),
                  texto: 'clicar',
                  cor: const Color(0xFF74C198),
                  clicar: () {
                    entrar(context);
                  });
            },
          ),
        ),
      ));

      await tester.tap(find.byKey(ValueKey("keyTesteButton")));
      await tester.pump();

      await tester.ensureVisible(find.byKey(Key("keyEntrarButton")));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(ValueKey("keyTextSenha")), "senha");

      await tester.tap(find.byKey(ValueKey("keyEntrarButton")));
    });

    testWidgets('Senha vazia', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Material(
          child: Builder(
            builder: (BuildContext context) {
              return Botao(
                  key: Key("keyTesteButton"),
                  texto: 'clicar',
                  cor: const Color(0xFF74C198),
                  clicar: () {
                    entrar(context);
                  });
            },
          ),
        ),
      ));

      await tester.tap(find.byKey(ValueKey("keyTesteButton")));
      await tester.pump();

      await tester.ensureVisible(find.byKey(Key("keyEntrarButton")));
      await tester.pumpAndSettle();

      await tester.enterText(
          find.byKey(ValueKey("keyTextEmail")), "email@organizei.com");

      await tester.tap(find.byKey(ValueKey("keyEntrarButton")));
    });
  });
}
