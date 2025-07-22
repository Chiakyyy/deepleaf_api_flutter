import 'types.dart';

bool isSuccessResponse(DeepLeafResponse response) {
  return response is SuccessResponse && response.success == true;
}

bool isErrorResponse(DeepLeafResponse response) {
  return response is ErrorResponse && response.success == false;
}

bool isErrorWithCode(DeepLeafResponse response, String code) {
  return response is ErrorResponse && response.error.code == code;
}