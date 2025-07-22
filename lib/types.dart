import 'dart:ffi';

class DeepLeafConfig {
  final String apiKey;
  final String? language;
  final String? endpoint;

  DeepLeafConfig ({
    required this.apiKey,
    this.language = 'en',  // Default to 'en' if not provided
    this.endpoint,
  });
}


enum Distance { good, bad, very_bad, no_plant }
enum Focus { good, bad }

class ImageFeedback {
  final Distance distance;
  final Focus focus;

  ImageFeedback ({
    required this.distance,
    required this.focus,
  });
}

class Diagnosis {
  final String commonName;
  final String diagnosisLikelihood;
  final List<String> hosts;
  final String pathogenClass;
  final List<String> preventiveMeasures;
  final String scientificName;
  final String symptoms;
  final List<String> symptomsShort;
  final String treatmentChemical;
  final String treatmentOrganic;
  final String trigger;
  final int deepleafId;

  Diagnosis({
    required this.commonName,
    required this.diagnosisLikelihood,
    required this.hosts,
    required this.pathogenClass,
    required this.preventiveMeasures,
    required this.scientificName,
    required this.symptoms,
    required this.symptomsShort,
    required this.treatmentChemical,
    required this.treatmentOrganic,
    required this.trigger,
    required this.deepleafId,
  });
}

class SuccessData {
  final List<String> crops;
  final bool diagnosesDetected;
  final ImageFeedback imageFeedback;
  final List<Diagnosis> predictedDiagnoses;

  SuccessData ({
    required this.crops,
    required this.diagnosesDetected,
    required this.imageFeedback,
    required this.predictedDiagnoses,
  });
}

class BillingStatus {
  Map<String, dynamic> statusFields;

  BillingStatus({required this.statusFields});
}

class SuccessResponse extends DeepLeafResponse{
  final bool success = true;
  final int status;
  final SuccessData data;
  final BillingStatus billingStatus;

  SuccessResponse ({
    required this.status,
    required this.data,
    required this.billingStatus,
  });
}

class ErrorDetail {
  final String code;
  final String message;

  ErrorDetail ({
    required this.code,
    required this.message,
  });
}

class ErrorResponse extends DeepLeafResponse{
  final bool success = false;
  final dynamic status;
  final ErrorDetail error;

  ErrorResponse ({
    required this.status,
    required this.error,
  });
}

abstract class DeepLeafResponse {}

class UploadImageError {
  final String error;

  UploadImageError ({
    required this.error,
  });
}

class PositionData {
  final Float latitude;
  final Float longitude;

  PositionData ({
    required this.latitude,
    required this.longitude,
  });
}

enum DistanceState {
  GOOD_DISTANCE,
  APPROACH,
  BAD_DISTANCE,
  VERY_BAD_DISTANCE,
  NO_PLANT,
  SKIP
}

class DistanceLabels {
  final String GOOD_DISTANCE;
  final String APPROACH;
  final String BAD_DISTANCE;
  final String VERY_BAD_DISTANCE;
  final String NO_PLANT;
  final String SKIP;

  DistanceLabels ({
    required this.GOOD_DISTANCE,
    required this.APPROACH,
    required this.BAD_DISTANCE,
    required this.VERY_BAD_DISTANCE,
    required this.NO_PLANT,
    required this.SKIP,
  });
}

final DistanceLabels DEFAULT_DISTANCE_LABELS = DistanceLabels(
  GOOD_DISTANCE: '👍 Good distance',
  APPROACH: '🤏 Approach a bit',
  BAD_DISTANCE: '❌ Bad distance',
  VERY_BAD_DISTANCE: '❌ Very bad distance',
  NO_PLANT: '🚫🌿 There is no plant in the frame',
  SKIP: 'skip',
);