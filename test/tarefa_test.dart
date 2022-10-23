import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:organizei/components/botao.dart';
import 'package:organizei/components/dialogs/login/entrarDialog.dart';
import 'package:organizei/components/dialogs/tarefas/tarefaCadastroDialog.dart';

void main() {
  group('TAREFA', () {
    testWidgets('Todos os campos vazios', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Builder(
              builder: (BuildContext context) {
                return Botao(
                    key: Key("keyTesteButton"),
                    texto: 'Salvar',
                    cor: const Color(0xFF74C198),
                    clicar: () {
                      criarTarefa(context);
                    });
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byKey(ValueKey("keyTesteButton")));
      await tester.pump();
      await tester.ensureVisible(find.byKey(Key("keySalvarButton")));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(ValueKey("keySalvarButton")));
    });

    testWidgets('Nome vazio', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Material(
          child: Builder(
            builder: (BuildContext context) {
              return Botao(
                  key: Key("keyTesteButton"),
                  texto: 'clicar',
                  cor: const Color(0xFF74C198),
                  clicar: () {
                    criarTarefa(context);
                  });
            },
          ),
        ),
      ));

      await tester.tap(find.byKey(ValueKey("keyTesteButton")));
      await tester.pump();

      await tester.ensureVisible(find.byKey(Key("keySalvarButton")));
      await tester.pumpAndSettle();

      //await tester.enterText(find.byKey(ValueKey("keyTextSenha")), "senha");

      await tester.tap(find.byKey(ValueKey("keySalvarButton")));
    });

    testWidgets('Data e hora vazia', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Material(
          child: Builder(
            builder: (BuildContext context) {
              return Botao(
                  key: Key("keyTesteButton"),
                  texto: 'clicar',
                  cor: const Color(0xFF74C198),
                  clicar: () {
                    criarTarefa(context);
                  });
            },
          ),
        ),
      ));

      await tester.tap(find.byKey(ValueKey("keyTesteButton")));
      await tester.pump();

      await tester.ensureVisible(find.byKey(Key("keySalvarButton")));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(ValueKey("keySalvarButton")));
    });

    testWidgets('Observação vazia', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Material(
          child: Builder(
            builder: (BuildContext context) {
              return Botao(
                  key: Key("keyTesteButton"),
                  texto: 'clicar',
                  cor: const Color(0xFF74C198),
                  clicar: () {
                    criarTarefa(context);
                  });
            },
          ),
        ),
      ));

      await tester.tap(find.byKey(ValueKey("keyTesteButton")));
      await tester.pump();

      await tester.ensureVisible(find.byKey(Key("keySalvarButton")));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(ValueKey("keySalvarButton")));
    });

    testWidgets('Prioriade vazia', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Material(
          child: Builder(
            builder: (BuildContext context) {
              return Botao(
                  key: Key("keyTesteButton"),
                  texto: 'clicar',
                  cor: const Color(0xFF74C198),
                  clicar: () {
                    criarTarefa(context);
                  });
            },
          ),
        ),
      ));

      await tester.tap(find.byKey(ValueKey("keyTesteButton")));
      await tester.pump();

      await tester.ensureVisible(find.byKey(Key("keySalvarButton")));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(ValueKey("keySalvarButton")));
    });

    testWidgets('Cor vazia', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Material(
          child: Builder(
            builder: (BuildContext context) {
              return Botao(
                  key: Key("keyTesteButton"),
                  texto: 'clicar',
                  cor: const Color(0xFF74C198),
                  clicar: () {
                    criarTarefa(context);
                  });
            },
          ),
        ),
      ));

      await tester.tap(find.byKey(ValueKey("keyTesteButton")));
      await tester.pump();

      await tester.ensureVisible(find.byKey(Key("keySalvarButton")));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(ValueKey("keySalvarButton")));
    });
  });
}
