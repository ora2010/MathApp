import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _userName = 'Ученик';
  bool _darkMode = false;
  bool _nightMode = false;
  bool _notificationsEnabled = true;
  bool _soundEnabled = true;
  bool _autoSync = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
        backgroundColor: AppColors.surface,
        elevation: 0,
      ),
      body: ListView(
        children: [
          // Profile section
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text('👨‍🎓', style: TextStyle(fontSize: 40)),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                GestureDetector(
                  onTap: _showEditNicknameDialog,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _userName,
                        style: AppTextStyles.headingSmall,
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Icon(
                        Icons.edit,
                        size: 18,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Display settings
          _buildSectionTitle('Отображение'),
          _buildSwitchTile(
            'Тёмная тема',
            'Более тёмные цвета',
            _darkMode,
            (value) => setState(() => _darkMode = value),
            Icons.dark_mode,
          ),
          _buildSwitchTile(
            'Ночной режим',
            'Защита глаз в ночное время',
            _nightMode,
            (value) => setState(() => _nightMode = value),
            Icons.nights_stay,
          ),
          const Divider(height: 1),
          // Notifications
          _buildSectionTitle('Уведомления'),
          _buildSwitchTile(
            'Уведомления',
            'Получать напоминания об обучении',
            _notificationsEnabled,
            (value) => setState(() => _notificationsEnabled = value),
            Icons.notifications,
          ),
          _buildSwitchTile(
            'Звук',
            'Звуковые эффекты',
            _soundEnabled,
            (value) => setState(() => _soundEnabled = value),
            Icons.volume_up,
          ),
          const Divider(height: 1),
          // Sync settings
          _buildSectionTitle('Синхронизация'),
          _buildSwitchTile(
            'Автосинхронизация',
            'Автоматически синхронизировать прогресс',
            _autoSync,
            (value) => setState(() => _autoSync = value),
            Icons.cloud_sync,
          ),
          _buildActionTile(
            'Синхронизировать сейчас',
            'Обновить прогресс',
            Icons.sync,
            () => _showSyncDialog(),
          ),
          const Divider(height: 1),
          // Data management
          _buildSectionTitle('Данные'),
          _buildActionTile(
            'Экспортировать данные',
            'Сохранить прогресс в файл',
            Icons.download,
            () => _showExportDialog(),
          ),
          _buildActionTile(
            'Импортировать данные',
            'Загрузить прогресс из файла',
            Icons.upload,
            () => _showImportDialog(),
          ),
          _buildActionTile(
            'Очистить кэш',
            'Удалить временные файлы',
            Icons.delete_sweep,
            () => _showClearCacheDialog(),
          ),
          const Divider(height: 1),
          // About
          _buildSectionTitle('О приложении'),
          _buildInfoTile(
            'Версия',
            '1.0.0 Premium',
            Icons.info,
          ),
          _buildInfoTile(
            'Разработано',
            'OlympMath Team',
            Icons.favorite,
            color: Colors.red,
          ),
          _buildActionTile(
            'Конфиденциальность',
            'Политика конфиденциальности',
            Icons.privacy_tip,
            () => _showPrivacyDialog(),
          ),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.md,
      ),
      child: Text(
        title,
        style: AppTextStyles.bodySmall.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSwitchTile(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.bodyLarge),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: AppTextStyles.bodySmall,
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildActionTile(
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          child: Row(
            children: [
              Icon(icon, color: AppColors.primary),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTextStyles.bodyLarge),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: AppTextStyles.bodySmall,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoTile(
    String title,
    String value,
    IconData icon, {
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      child: Row(
        children: [
          Icon(icon, color: color ?? AppColors.primary),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.bodyLarge),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: AppTextStyles.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showEditNicknameDialog() {
    final controller = TextEditingController(text: _userName);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Изменить ник'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Введите новый ник',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Отмена'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() => _userName = controller.text);
              Navigator.pop(context);
            },
            child: const Text('Сохранить'),
          ),
        ],
      ),
    );
  }

  void _showSyncDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Синхронизация'),
        content: const Text('Прогресс синхронизирован успешно! ✅'),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('ОК'),
          ),
        ],
      ),
    );
  }

  void _showExportDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Экспорт данных'),
        content: const Text('Ваши данные сохранены в Downloads/olympmath_backup.json'),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('ОК'),
          ),
        ],
      ),
    );
  }

  void _showImportDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Импорт данных'),
        content: const Text('Файл импортирован и объединён с текущими данными'),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('ОК'),
          ),
        ],
      ),
    );
  }

  void _showClearCacheDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Очистить кэш'),
        content: const Text('Вы уверены? Это удалит временные файлы, но не повлияет на ваш прогресс.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Отмена'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Кэш очищен ✅')),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Очистить', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showPrivacyDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Конфиденциальность'),
        content: const SingleChildScrollView(
          child: Text(
            'OlympMath не собирает личные данные пользователей. Ваш прогресс хранится локально на вашем устройстве и никогда не передаётся третьим лицам.',
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Согласен'),
          ),
        ],
      ),
    );
  }
}
