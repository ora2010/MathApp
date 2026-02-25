import 'package:flutter/material.dart';
import '../models/topic.dart';

// Основная тема теория чисел
final List<MainTopic> allTopics = [
  MainTopic(
    id: 'number_theory',
    title: 'Теория чисел',
    description: 'Основы теории целых чисел и делимости',
    icon: Icons.calculate,
    color: const Color(0xFF6366F1),
    subTopics: [
      SubTopic(
        id: 'integers',
        title: 'Целые числа',
        theory:
            'Целые числа - это числа вида ..., -2, -1, 0, 1, 2, ...\n\n'
            'Свойства:\n'
            '• Замкнуты относительно сложения и умножения\n'
            '• Для любых целых a и b существует их разность\n'
            '• Упорядочены: для любых a ≠ b верно либо a < b, либо a > b',
        examples: [
          Example(
            id: 'ex1',
            title: 'Операции с целыми числами',
            description: 'Вычислить: (-5) + 3 × 2',
            solution: '(-5) + 3 × 2 = -5 + 6 = 1',
          ),
        ],
        problems: [
          Problem(
            id: 'p1',
            title: 'Сумма целых чисел',
            description: 'Найдите сумму всех целых чисел от -10 до 10',
            answer: '0',
            difficulty: 'easy',
          ),
        ],
      ),
      SubTopic(
        id: 'divisibility',
        title: 'Делимость: общие свойства и признаки',
        theory:
            'Число a делится на число b (b ≠ 0), если существует целое число k такое, что a = bk\n\n'
            'Признаки делимости:\n'
            '• На 2: последняя цифра четная\n'
            '• На 3: сумма цифр делится на 3\n'
            '• На 5: последняя цифра 0 или 5\n'
            '• На 9: сумма цифр делится на 9\n'
            '• На 11: знакопеременная сумма цифр делится на 11\n\n'
            'Свойства делимости:\n'
            '• Если a|b и b|c, то a|c\n'
            '• Если a|b и a|c, то a|(b+c)\n'
            '• Если a|b, то a|kb для любого целого k',
        examples: [
          Example(
            id: 'ex1',
            title: 'Проверка делимости',
            description: 'Делится ли число 2358 на 3?',
            solution: '2 + 3 + 5 + 8 = 18, 18 делится на 3, значит 2358 делится на 3',
          ),
          Example(
            id: 'ex2',
            title: 'Проверка делимости на 11',
            description: 'Делится ли число 1234 на 11?',
            solution: '(1 + 3) - (2 + 4) = 4 - 6 = -2, не делится на 11',
          ),
        ],
        problems: [
          Problem(
            id: 'p1',
            title: 'Признак делимости на 7',
            description: 'Найдите наименьшее трехзначное число, делящееся на 7',
            answer: '105',
            difficulty: 'medium',
          ),
          Problem(
            id: 'p2',
            title: 'Комбинированная задача',
            description: 'Докажите, что если число делится и на 3, и на 5, то оно делится на 15',
            difficulty: 'hard',
          ),
        ],
      ),
      SubTopic(
        id: 'gcd_lcm',
        title: 'НОД и НОК',
        theory:
            'НОД (наибольший общий делитель) - наибольшее число, на которое делятся оба числа\n'
            'НОК (наименьшее общее кратное) - наименьшее число, которое делится на оба числа\n\n'
            'Алгоритм Евклида для НОД:\n'
            'gcd(a, b) = gcd(b, a mod b), пока b ≠ 0\n\n'
            'Связь: a × b = gcd(a, b) × lcm(a, b)',
        examples: [
          Example(
            id: 'ex1',
            title: 'Вычисление НОД',
            description: 'Найти НОД(48, 18)',
            solution: '48 = 18 × 2 + 12\n18 = 12 × 1 + 6\n12 = 6 × 2 + 0\nНОД = 6',
          ),
        ],
        problems: [
          Problem(
            id: 'p1',
            title: 'НОК двух чисел',
            description: 'Найти НОК(12, 18)',
            answer: '36',
            difficulty: 'easy',
          ),
        ],
      ),
      SubTopic(
        id: 'primes',
        title: 'Простые числа и Основная теорема арифметики',
        theory:
            'Простое число - натуральное число больше 1, делящееся только на 1 и на себя\n\n'
            'Основная теорема арифметики: любое натуральное число > 1 можно разложить на простые множители единственным способом\n\n'
            'Примеры простых чисел: 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, ...',
        examples: [
          Example(
            id: 'ex1',
            title: 'Разложение на простые множители',
            description: 'Разложить 60 на простые множители',
            solution: '60 = 2² × 3 × 5',
          ),
        ],
        problems: [
          Problem(
            id: 'p1',
            title: 'Разложение числа',
            description: 'Разложите число 84 на простые множители',
            answer: '2² × 3 × 7',
            difficulty: 'easy',
          ),
        ],
      ),
    ],
  ),
  MainTopic(
    id: 'algebra',
    title: 'Алгебра и Анализ',
    description: 'Алгебраические методы и математический анализ',
    icon: Icons.functions,
    color: const Color(0xFF8B5CF6),
    subTopics: [
      SubTopic(
        id: 'rational_numbers',
        title: 'Рациональные и иррациональные числа',
        theory:
            'Рациональное число - число, которое можно представить в виде p/q, где p и q целые числа, q ≠ 0\n\n'
            'Иррациональное число - число, которое нельзя представить в виде дроби\n'
            'Примеры: π, e, √2, √3\n\n'
            'Множество R = Q ∪ (R\\Q)',
        examples: [
          Example(
            id: 'ex1',
            title: 'Рациональность дроби',
            description: 'Является ли число 0.333... рациональным?',
            solution: '0.333... = 1/3, значит является рациональным',
          ),
        ],
        problems: [
          Problem(
            id: 'p1',
            title: 'Доказательство иррациональности',
            description: 'Доказать, что √2 - иррациональное число',
            difficulty: 'hard',
          ),
        ],
      ),
      SubTopic(
        id: 'quadratic_trinomial',
        title: 'Квадратный трёхчлен и многочлены',
        theory:
            'Квадратный трехчлен: ax² + bx + c, где a ≠ 0\n\n'
            'Дискриминант: D = b² - 4ac\n\n'
            'Корни: x = (-b ± √D) / 2a\n\n'
            'Вершина параболы: x₀ = -b/2a\n'
            'y₀ = -D/4a',
        examples: [
          Example(
            id: 'ex1',
            title: 'Решение квадратного уравнения',
            description: 'Решить: x² - 5x + 6 = 0',
            solution: 'D = 25 - 24 = 1\nx₁ = (5 + 1)/2 = 3\nx₂ = (5 - 1)/2 = 2',
          ),
        ],
        problems: [
          Problem(
            id: 'p1',
            title: 'Квадратное уравнение',
            description: 'Решить: 2x² + 3x - 5 = 0',
            answer: 'x₁ = 1, x₂ = -2.5',
            difficulty: 'medium',
          ),
        ],
      ),
      SubTopic(
        id: 'inequalities',
        title: 'Неравенства: квадратичные, Коши, между средними',
        theory:
            'Неравенство Коши для среднего арифметического и геометрического:\n'
            '(a₁ + a₂ + ... + aₙ)/n ≥ ⁿ√(a₁a₂...aₙ)\n\n'
            'Равенство достигается, когда a₁ = a₂ = ... = aₙ\n\n'
            'Квадратичные неравенства решаются через анализ параболы',
        examples: [
          Example(
            id: 'ex1',
            title: 'Применение неравенства Коши',
            description: 'Найти минимум выражения a + 1/a при a > 0',
            solution: 'По неравенству Коши: a + 1/a ≥ 2√(a · 1/a) = 2\nМинимум = 2, при a = 1',
          ),
        ],
        problems: [
          Problem(
            id: 'p1',
            title: 'Решение неравенства',
            description: 'Решить: x² - 3x + 2 > 0',
            answer: 'x < 1 или x > 2',
            difficulty: 'medium',
          ),
        ],
      ),
    ],
  ),
  MainTopic(
    id: 'geometry',
    title: 'Планиметрия',
    description: 'Геометрия на плоскости',
    icon: Icons.crop_square,
    color: const Color(0xFF06B6D4),
    subTopics: [
      SubTopic(
        id: 'triangles',
        title: 'Треугольники: равенство, углы и линии',
        theory:
            'Основные свойства треугольников:\n'
            '• Сумма углов = 180°\n'
            '• Неравенство треугольника: a + b > c\n\n'
            'Медиана - отрезок от вершины к середине противоположной стороны\n'
            'Высота - перпендикуляр из вершины к противоположной стороне\n'
            'Биссектриса - делит угол пополам',
        examples: [
          Example(
            id: 'ex1',
            title: 'Медиана треугольника',
            description: 'Найти точку пересечения медиан',
            solution: 'Медианы пересекаются в одной точке - центре масс треугольника',
          ),
        ],
        problems: [
          Problem(
            id: 'p1',
            title: 'Задача о треугольнике',
            description: 'В треугольнике ABC: AB = 3, BC = 4, AC = 5. Какой это треугольник?',
            answer: 'Прямоугольный треугольник (египетский)',
            difficulty: 'easy',
          ),
        ],
      ),
      SubTopic(
        id: 'circles',
        title: 'Вписанные и описанные окружности',
        theory:
            'Вписанная окружность - окружность внутри многоугольника, касающаяся всех его сторон\n'
            'Описанная окружность - окружность, проходящая через все вершины многоугольника\n\n'
            'Для треугольника:\n'
            'R = abc/(4S) - радиус описанной окружности\n'
            'r = S/p - радиус вписанной окружности, где p - полупериметр',
        examples: [
          Example(
            id: 'ex1',
            title: 'Окружность треугольника',
            description: 'Найти радиус описанной окружности для треугольника со сторонами 3, 4, 5',
            solution: 'R = 3·4·5/(4·6) = 60/24 = 2.5',
          ),
        ],
        problems: [
          Problem(
            id: 'p1',
            title: 'Вписанная окружность',
            description: 'Найти радиус вписанной окружности для треугольника со сторонами 3, 4, 5',
            answer: 'r = 1',
            difficulty: 'medium',
          ),
        ],
      ),
    ],
  ),
  MainTopic(
    id: 'combinatorics',
    title: 'Комбинаторика и Логика',
    description: 'Комбинаторные методы и логический анализ',
    icon: Icons.grid_on,
    color: const Color(0xFF10B981),
    subTopics: [
      SubTopic(
        id: 'combinations',
        title: 'Перестановки, размещения и сочетания',
        theory:
            'Перестановка - упорядоченное расположение элементов\n'
            'Pₙ = n!\n\n'
            'Размещение - упорядоченный выбор k элементов из n\n'
            'Aₙᵏ = n!/(n-k)!\n\n'
            'Сочетание - неупорядоченный выбор k элементов из n\n'
            'Cₙᵏ = n!/(k!(n-k)!)',
        examples: [
          Example(
            id: 'ex1',
            title: 'Вычисление сочетаний',
            description: 'Сколькими способами можно выбрать 3 человека из 5?',
            solution: 'C₅³ = 5!/(3!·2!) = 10',
          ),
        ],
        problems: [
          Problem(
            id: 'p1',
            title: 'Перестановки',
            description: 'Сколькими способами можно расставить 4 книги на полку?',
            answer: '24',
            difficulty: 'easy',
          ),
        ],
      ),
      SubTopic(
        id: 'pigeonhole',
        title: 'Принцип Дирихле',
        theory:
            'Принцип Дирихле: если m предметов разместить в n ящиков и m > n, то хотя бы один ящик содержит более одного предмета\n\n'
            'Обобщенный принцип: если m предметов в n ящиков и m > kn, то хотя бы один ящик содержит более k предметов',
        examples: [
          Example(
            id: 'ex1',
            title: 'Применение принципа Дирихле',
            description: 'В ящике 100 шаров 3 цветов. Доказать, что есть 34 шара одного цвета',
            solution: 'Если каждого цвета не более 33 шаров, то всего не более 99, противоречие',
          ),
        ],
        problems: [
          Problem(
            id: 'p1',
            title: 'Задача о голубях',
            description: 'В ящике 50 шаров 2 цветов. Докажите, что есть 26 шаров одного цвета',
            difficulty: 'easy',
          ),
        ],
      ),
    ],
  ),
  MainTopic(
    id: 'trigonometry',
    title: 'Тригонометрия и Логарифмы',
    description: 'Тригонометрические и логарифмические функции',
    icon: Icons.show_chart,
    color: const Color(0xFFF59E0B),
    subTopics: [
      SubTopic(
        id: 'trig_equations',
        title: 'Тригонометрические уравнения',
        theory:
            'sin(x) = a: x = arcsin(a) + 2πk или x = π - arcsin(a) + 2πk\n'
            'cos(x) = a: x = ±arccos(a) + 2πk\n'
            'tan(x) = a: x = arctan(a) + πk\n'
            'cot(x) = a: x = arccot(a) + πk',
        examples: [
          Example(
            id: 'ex1',
            title: 'Простое тригонометрическое уравнение',
            description: 'Решить: sin(x) = 1/2',
            solution: 'x = π/6 + 2πk или x = 5π/6 + 2πk, k ∈ ℤ',
          ),
        ],
        problems: [
          Problem(
            id: 'p1',
            title: 'Уравнение с косинусом',
            description: 'Решить: cos(x) = √3/2',
            answer: 'x = ±π/6 + 2πk',
            difficulty: 'easy',
          ),
        ],
      ),
      SubTopic(
        id: 'logarithms',
        title: 'Логарифмические и показательные уравнения',
        theory:
            'Логарифм: logₐ(x) = b ⟺ aᵇ = x\n\n'
            'Свойства:\n'
            '• logₐ(xy) = logₐ(x) + logₐ(y)\n'
            '• logₐ(x/y) = logₐ(x) - logₐ(y)\n'
            '• logₐ(xⁿ) = n·logₐ(x)\n'
            '• logₐ(x) = logₑ(x)/logₑ(a)',
        examples: [
          Example(
            id: 'ex1',
            title: 'Логарифмическое уравнение',
            description: 'Решить: log₂(x) = 3',
            solution: 'x = 2³ = 8',
          ),
        ],
        problems: [
          Problem(
            id: 'p1',
            title: 'Показательное уравнение',
            description: 'Решить: 2ˣ = 8',
            answer: 'x = 3',
            difficulty: 'easy',
          ),
        ],
      ),
    ],
  ),
];

