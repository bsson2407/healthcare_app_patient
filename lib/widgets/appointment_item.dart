import 'package:flutter/material.dart';
// import 'avatar_image.dart';
import 'package:intl/intl.dart';
import 'package:healthcare_mobile/modules/dialog/fancy_dialog.dart';

class AppointmentItem extends StatelessWidget {
  const AppointmentItem(this.data, {Key? key, this.onTap}) : super(key: key);
  final data;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    DateTime? date = data?.dateMeeting;
    var inputFormat = DateFormat('dd/MM/yyyy').format(date!);
    String timeMeeting = data?.timeMeeting;
    String? time = '$inputFormat + $timeMeeting';
    String appointmentStatus = '';
    Color? colorStatus = Colors.white;

    switch (data?.statusAppointment) {
      case 'CREATED':
        appointmentStatus = 'Đang chờ';
        colorStatus = Colors.yellow[600];
        break;
      case 'APPROVED':
        appointmentStatus = 'Chấp nhận';
        colorStatus = Colors.green[600];
        break;
      case 'REFUSED':
        appointmentStatus = 'Từ chối';
        colorStatus = Colors.red[600];
        break;
      case 'CANCELED':
        appointmentStatus = 'Đã hủy';
        colorStatus = Colors.grey[600];
        break;
      case 'COMPLETED':
        appointmentStatus = 'Đã hoàn thành';
        colorStatus = Colors.blue[400];
        break;
      default:
        break;
    }

    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) => FancyDialog(
                  id: data?.id,
                  fullName: data?.fullName,
                  title: "Thông tin cuộc hẹn",
                  notes: data?.notes,
                  phone: data?.phone,
                  dateOfBirth: data?.dateOfBirth,
                  dateMeeting: data?.dateMeeting,
                  timeMeeting: data?.timeMeeting,
                  statusAppointment: data?.statusAppointment,
                  doctorName: data?.doctor?.fullName,
                ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            const SizedBox(height: 2),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                        height: 60,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: <Widget>[
                                Expanded(
                                    child: Container(
                                        child: Text(data?.fullName,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700)))),
                                const SizedBox(width: 5),
                                Container(
                                  height: 20,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 13,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: colorStatus,
                                  ),
                                  child: Text(
                                    appointmentStatus,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 11, color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                    child: Text(time,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 13, color: Colors.grey))),
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                    child: Text(data?.notes,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 13))),
                              ],
                            ),
                          ],
                        ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
