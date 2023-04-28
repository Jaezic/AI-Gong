import 'package:ai_gong/restAPI/models/Classroom.dart';
import 'package:flutter/material.dart';

class ClassRoomComponent extends StatelessWidget {
  final ClassRoom model;
  const ClassRoomComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 13),
            width: 11,
            height: 11,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model.roomid ?? '???'}호',
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.department ?? '???전공',
                      style: const TextStyle(fontSize: 12, color: Colors.black87),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      '${model.floor ?? '???'}층, 수용 인원 ${model.capacity ?? '???'}명',
                      style: const TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        Text(
                          '${model.scale ?? '???'} 강의실 | ',
                          style: const TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                        Text((model.usable ?? true) ? '사용 가능' : '사용 불가', style: const TextStyle(fontSize: 12, color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Text(
              '다음 수업이 없습니다.',
              style: TextStyle(fontSize: 12, color: Colors.black87),
            ),
          )
        ],
      ),
    );
  }
}