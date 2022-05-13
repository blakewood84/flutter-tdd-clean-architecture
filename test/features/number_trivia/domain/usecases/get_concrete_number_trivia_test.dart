import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_concrete_number_trivia_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_clean_architecture/features/number_trivia/domain/entities/number_trivia.dart';

import 'package:tdd_clean_architecture/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:tdd_clean_architecture/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository {}

@GenerateMocks([MockNumberTriviaRepository])
void main() {
  GetConcreteNumberTrivia? usecase;
  MockNumberTriviaRepository? mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockMockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository!);
  });

  const tNumber = 1;
  const tNumberTrivia = NumberTrivia(text: 'test', number: 1);

  test('Should get trivia for the number from the repository', () async {
    // arrange
    when(mockNumberTriviaRepository!.getConcreteNumberTrivia(any)).thenAnswer((_) async => const Right(tNumberTrivia));
    // act
    final result = await usecase!.execute(number: tNumber);
    // assert
    expect(result, const Right(tNumberTrivia));
    verify(mockNumberTriviaRepository!.getConcreteNumberTrivia(tNumber));
  });
}
