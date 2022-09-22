import 'package:flutter/material.dart';
import 'package:organizei/Controller/TarefaController.dart';
import 'package:organizei/components/input.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart' as intl;

class SelectData extends StatefulWidget {
  final TarefaController tarefaController;
  const SelectData({Key? key, required this.tarefaController})
      : super(key: key);

  @override
  State<SelectData> createState() => _SelectDataState();
}

class _SelectDataState extends State<SelectData> {
  List<int> cores = [
    0xFF6385C3,
    0xFFEF7E69,
    0xFF6BC8E4,
    0xFFF7BC36,
    0xFF74C198
  ];

  late int corSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: input(
          onSaved: widget.tarefaController.tarefaDataehora,
          textController: widget.tarefaController.controllerDataehora,
          label: 'data e hora',
          placeholder: 'Selecione a data e hora',
          readOnly: true,
          customFunction: () async {
            DateTime date = new DateTime.now();

            DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: date,
              firstDate: DateTime(2020),
              lastDate: DateTime(2100),
              builder: (BuildContext context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.light(
                      primary: Color(0xFF6385C3),
                    ),
                    dialogTheme: DialogTheme(
                      backgroundColor: const Color(0xFFE9E9E9),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 3, color: Colors.black),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                  child: child!,
                );
              },
            );

            if (newDate == null) return;

            final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay(hour: date.hour, minute: date.minute),
                builder: (BuildContext context, child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                      timePickerTheme: TimePickerThemeData(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 3, color: Colors.black),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        backgroundColor: const Color(0xFFE9E9E9),
                        hourMinuteColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.selected)
                                ? const Color(0xFFE9E9E9)
                                : const Color(0xFFE9E9E9)),
                        dialHandColor: Color(0xFFE9E9E9),
                        dialTextColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.selected)
                                ? Colors.black
                                : Colors.black),
                        hourMinuteTextColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.selected)
                                ? const Color(0xFF6385C3)
                                : Colors.black),
                        dialBackgroundColor: const Color(0xFF6385C3),
                      ),
                      textButtonTheme: TextButtonThemeData(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateColor.resolveWith(
                              (states) => const Color(0xFF6385C3)),
                          overlayColor: MaterialStateColor.resolveWith(
                            (states) => const Color(0xFF6385C3),
                          ),
                        ),
                      ),
                    ),
                    child: child!,
                  );
                });

            if (time == null) return;

            final newDateTime = DateTime(
              newDate.year,
              newDate.month,
              newDate.day,
              time.hour,
              time.minute,
            );

            setState(() {
              date = newDate;
            });

            widget.tarefaController.tarefaDataehora(newDateTime.toString());

            intl.Intl.defaultLocale = 'pt_BR';
            initializeDateFormatting('pt_BR');

            intl.DateFormat('dd/MM/yyyy HH:mm').format(newDateTime);

            widget.tarefaController.controllerDataehora.text =
                intl.DateFormat('dd/MM/yyyy HH:mm').format(newDateTime);
          }),
    );
  }
}

Future<DateTime?> showDatePicker({
  required BuildContext context,
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
  DateTime? currentDate,
  DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
  SelectableDayPredicate? selectableDayPredicate,
  String? helpText,
  String? cancelText,
  String? confirmText,
  Locale? locale,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  TextDirection? textDirection,
  TransitionBuilder? builder,
  DatePickerMode initialDatePickerMode = DatePickerMode.day,
  String? errorFormatText,
  String? errorInvalidText,
  String? fieldHintText,
  String? fieldLabelText,
  TextInputType? keyboardType,
  Offset? anchorPoint,
}) async {
  assert(context != null);
  assert(initialDate != null);
  assert(firstDate != null);
  assert(lastDate != null);
  initialDate = DateUtils.dateOnly(initialDate);
  firstDate = DateUtils.dateOnly(firstDate);
  lastDate = DateUtils.dateOnly(lastDate);
  assert(
    !lastDate.isBefore(firstDate),
    'lastDate $lastDate must be on or after firstDate $firstDate.',
  );
  assert(
    !initialDate.isBefore(firstDate),
    'initialDate $initialDate must be on or after firstDate $firstDate.',
  );
  assert(
    !initialDate.isAfter(lastDate),
    'initialDate $initialDate must be on or before lastDate $lastDate.',
  );
  assert(
    selectableDayPredicate == null || selectableDayPredicate(initialDate),
    'Provided initialDate $initialDate must satisfy provided selectableDayPredicate.',
  );
  assert(initialEntryMode != null);
  assert(useRootNavigator != null);
  assert(initialDatePickerMode != null);
  assert(debugCheckHasMaterialLocalizations(context));

  Widget dialog = DatePickerDialog(
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
    currentDate: currentDate,
    initialEntryMode: initialEntryMode,
    selectableDayPredicate: selectableDayPredicate,
    helpText: helpText,
    cancelText: cancelText,
    confirmText: confirmText,
    initialCalendarMode: initialDatePickerMode,
    errorFormatText: errorFormatText,
    errorInvalidText: errorInvalidText,
    fieldHintText: fieldHintText,
    fieldLabelText: fieldLabelText,
    keyboardType: keyboardType,
  );

  if (textDirection != null) {
    dialog = Directionality(
      textDirection: textDirection,
      child: dialog,
    );
  }

  if (locale != null) {
    dialog = Localizations.override(
      context: context,
      locale: locale,
      child: dialog,
    );
  }

  return showDialog<DateTime>(
    barrierDismissible: false,
    barrierColor: Colors.white.withOpacity(0),
    context: context,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
    builder: (BuildContext context) {
      return builder == null ? dialog : builder(context, dialog);
    },
    anchorPoint: anchorPoint,
  );
}

Future<TimeOfDay?> showTimePicker({
  required BuildContext context,
  required TimeOfDay initialTime,
  TransitionBuilder? builder,
  bool useRootNavigator = true,
  TimePickerEntryMode initialEntryMode = TimePickerEntryMode.dial,
  String? cancelText,
  String? confirmText,
  String? helpText,
  String? errorInvalidText,
  String? hourLabelText,
  String? minuteLabelText,
  RouteSettings? routeSettings,
  EntryModeChangeCallback? onEntryModeChanged,
  Offset? anchorPoint,
}) async {
  assert(context != null);
  assert(initialTime != null);
  assert(useRootNavigator != null);
  assert(initialEntryMode != null);
  assert(debugCheckHasMaterialLocalizations(context));

  final Widget dialog = TimePickerDialog(
    initialTime: initialTime,
    initialEntryMode: initialEntryMode,
    cancelText: cancelText,
    confirmText: confirmText,
    helpText: helpText,
    errorInvalidText: errorInvalidText,
    hourLabelText: hourLabelText,
    minuteLabelText: minuteLabelText,
    onEntryModeChanged: onEntryModeChanged,
  );
  return showDialog<TimeOfDay>(
    barrierDismissible: false,
    barrierColor: Colors.white.withOpacity(0),
    context: context,
    useRootNavigator: useRootNavigator,
    builder: (BuildContext context) {
      return builder == null ? dialog : builder(context, dialog);
    },
    routeSettings: routeSettings,
    anchorPoint: anchorPoint,
  );
}
