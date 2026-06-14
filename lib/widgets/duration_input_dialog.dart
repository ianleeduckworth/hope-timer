import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/duration_format.dart';

Future<int?> showDurationInputDialog({
  required BuildContext context,
  required String title,
}) {
  return showDialog<int>(
    context: context,
    builder: (context) => _DurationInputDialog(title: title),
  );
}

class _DurationInputDialog extends StatefulWidget {
  const _DurationInputDialog({required this.title});

  final String title;

  @override
  State<_DurationInputDialog> createState() => _DurationInputDialogState();
}

class _DurationInputDialogState extends State<_DurationInputDialog> {
  final _hoursController = TextEditingController(text: '0');
  final _minutesController = TextEditingController(text: '0');
  final _secondsController = TextEditingController(text: '0');

  @override
  void dispose() {
    _hoursController.dispose();
    _minutesController.dispose();
    _secondsController.dispose();
    super.dispose();
  }

  void _submit() {
    final hours = int.tryParse(_hoursController.text) ?? 0;
    final minutes = int.tryParse(_minutesController.text) ?? 0;
    final seconds = int.tryParse(_secondsController.text) ?? 0;

    if (hours < 0 || minutes < 0 || seconds < 0) {
      return;
    }

    Navigator.of(context).pop(
      durationToMs(hours: hours, minutes: minutes, seconds: seconds),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _DurationField(label: 'Hours', controller: _hoursController),
          const SizedBox(height: 12),
          _DurationField(label: 'Minutes', controller: _minutesController),
          const SizedBox(height: 12),
          _DurationField(label: 'Seconds', controller: _secondsController),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: _submit,
          child: const Text('Set'),
        ),
      ],
    );
  }
}

class _DurationField extends StatelessWidget {
  const _DurationField({required this.label, required this.controller});

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
