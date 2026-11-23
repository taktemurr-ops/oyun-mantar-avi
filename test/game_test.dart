import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_mantar_avi/oyun_mantar_avi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(mantarAviConfig.title.length, 33);
    expect(mantarAviConfig.tagline.length, 33);
    for (final s in mantarAviConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(mantarAviConfig.gameId, mantarAviId);
    expect(mantarAviRules.gameId, mantarAviId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(mantarAviRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: mantarAviId, optionalMechanics: mantarAviRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(mantarAviRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
