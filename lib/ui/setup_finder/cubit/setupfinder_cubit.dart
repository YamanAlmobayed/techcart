import 'package:bloc/bloc.dart';
import 'package:techcart/repository/models/setupfinder_output_model.dart';
import 'package:techcart/repository/models/setupfinder_question_model.dart';
import 'package:techcart/repository/techcart_repository.dart';
import 'package:techcart/shared/utils.dart';

part 'setupfinder_state.dart';

class SetupfinderCubit extends Cubit<SetupfinderState> {
  SetupfinderCubit(this._techcartRepository) : super(SetupfinderInitial());

  final TechcartRepository _techcartRepository;

  late SetupfinderQuestionModel question;

  void getSetupfinderInit() async {
    emit(GetQuestionLoading());
    try {
      question = await _techcartRepository.getSetupfinderInit();

      emit(GetQuestionSuccess());
    } catch (e) {
      showToast(text: e.toString(), state: ToastStates.error);
    }
  }

  String currentAnswer = '0';

  void addQuizAnsewr({required String answer}) async {
    currentAnswer = '0';
    emit(GetQuestionLoading());
    try {
      final response = await _techcartRepository.addQuizAnsewr(answer: answer);

      if (response.isOutput) {
        emit(GetOutputSuccess(response));
      } else {
        question = response;
        emit(GetQuestionSuccess());
      }
    } catch (e) {
      showToast(text: e.toString(), state: ToastStates.error);
    }
  }

  void changeAnswer(String answer) {
    currentAnswer = answer;
    emit(ChangeAnswerState());
  }
}
