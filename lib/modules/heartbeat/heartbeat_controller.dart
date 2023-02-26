import 'package:get/get.dart';
import 'package:healthcare_mobile/models/health-record/health_record_response.dart';
import 'package:healthcare_mobile/repository/health_record.repository.dart';


class HeartbeatController extends GetxController {
  final healthRecordRepository = Get.find<HealthRecordRepository>();
  RxList<DataResponse> listHeartbeat = RxList<DataResponse>([]);

  @override
  void onInit() {
    super.onInit();
    initListHeartbeat();
  }

  void initListHeartbeat() async {
    final response = await healthRecordRepository.getHeartbeat();
    if (response.statusCode == 200) {
      // listBmi = response.data;
      listHeartbeat.addAll(response.data);
    } else {
      // Xử lý khi API trả về lỗi
    }
  }
}