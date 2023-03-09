import 'package:flutter_test/flutter_test.dart';
import 'package:list/src/home/widgets/task_card.dart';
import 'package:list/src/shared/services/realm/models/task_model.dart';
import 'package:list/src/shared/themes/themes.dart';
import 'package:realm/realm.dart';

void main() {
  final board = TaskBoard(Uuid.v4(), 'New list of tasks 1');

  group('test getProgress()', () {
    test('should return 0.5, when half of the array of tasks are complete', () {
      final tasks = [
        Task(Uuid.v4(), '', complete: true),
        Task(Uuid.v4(), '', complete: true),
        Task(Uuid.v4(), ''),
        Task(Uuid.v4(), ''),
      ];

      final progress = TaskCard(board: board).getProgress(tasks);

      expect(progress, 0.5);
    });

    test('should return 0, when array of tasks is empty', () {
      final tasks = <Task>[];

      final progress = TaskCard(board: board).getProgress(tasks);

      expect(progress, 0);
    });
  });

  group('test getProgressText()', () {
    test('should return 2/4, when half of the array of tasks are complete', () {
      final tasks = [
        Task(Uuid.v4(), '', complete: true),
        Task(Uuid.v4(), '', complete: true),
        Task(Uuid.v4(), ''),
        Task(Uuid.v4(), ''),
      ];

      final progress = TaskCard(board: board).getProgressText(tasks);

      expect(progress, '2/4');
    });

    test('should return an empty string, when array of tasks is empty', () {
      final tasks = <Task>[];

      final progress = TaskCard(board: board).getProgressText(tasks);

      expect(progress, '');
    });
  });

  group('test getStatus()', () {
    test(
        '''should return TaskCardStatus.pending, when progress is smaller than 1.0''',
        () {
      const progress = 0.7;

      final status = TaskCard(board: board).getStatus(board, progress);

      expect(status, TaskCardStatus.pending);
    });

    test('should return TaskCardStatus.completed, when progress is 1.0', () {
      const progress = 1.0;

      final status = TaskCard(board: board).getStatus(board, progress);

      expect(status, TaskCardStatus.completed);
    });

    test('should return TaskCardStatus.disable, when enabled is false', () {
      final _board = TaskBoard(Uuid.v4(), 'New list of tasks 1', enable: false);
      const progress = 1.0;

      final status = TaskCard(board: _board).getStatus(_board, progress);

      expect(status, TaskCardStatus.disable);
    });
  });

  group('test getBackgroundColor()', () {
    test(
        '''should return theme.colorScheme.primaryContainer, when TaskCardStatus is pending''',
        () {
      const status = TaskCardStatus.pending;

      final theme = TaskCard(board: board).getBackgroundColor(
        status,
        lightTheme,
      );

      expect(theme, lightTheme.colorScheme.primaryContainer);
    });

    test(
        '''should return theme.colorScheme.tertiaryContainer, when TaskCardStatus is completed''',
        () {
      const status = TaskCardStatus.completed;

      final theme = TaskCard(board: board).getBackgroundColor(
        status,
        lightTheme,
      );

      expect(theme, lightTheme.colorScheme.tertiaryContainer);
    });

    test(
        '''should return theme.colorScheme.errorContainer, when TaskCardStatus is disable''',
        () {
      const status = TaskCardStatus.disable;

      final theme = TaskCard(board: board).getBackgroundColor(
        status,
        lightTheme,
      );

      expect(theme, lightTheme.colorScheme.errorContainer);
    });
  });

  group('test getColor()', () {
    test(
        '''should return theme.colorScheme.primary, when TaskCardStatus is pending''',
        () {
      const status = TaskCardStatus.pending;

      final theme = TaskCard(board: board).getColor(
        status,
        lightTheme,
      );

      expect(theme, lightTheme.colorScheme.primary);
    });

    test(
        '''should return theme.colorScheme.tertiary, when TaskCardStatus is completed''',
        () {
      const status = TaskCardStatus.completed;

      final theme = TaskCard(board: board).getColor(
        status,
        lightTheme,
      );

      expect(theme, lightTheme.colorScheme.tertiary);
    });

    test(
        '''should return theme.colorScheme.error, when TaskCardStatus is disable''',
        () {
      const status = TaskCardStatus.disable;

      final theme = TaskCard(board: board).getColor(
        status,
        lightTheme,
      );

      expect(theme, lightTheme.colorScheme.error);
    });
  });
}
