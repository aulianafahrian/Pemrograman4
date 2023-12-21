import 'package:dio_initial/user.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final UserCreate ursCreate;

  const UserCard({super.key, required this.ursCreate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: 400,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 70,
              child: Text(
                'ID',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: Text(
                ': ${ursCreate.id}',
              ),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 70,
              child: Text(
                'Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: Text(
                ': ${ursCreate.name}',
              ),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 70,
              child: Text(
                'JOB',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: Text(
                ': ${ursCreate.job}',
              ),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 70,
              child: Text(
                'Tanggal',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: Text(
                ': ${ursCreate.createdAt}',
              ),
            )
          ],
        )
      ]),
    );
  }
}

class UserPutCard extends StatelessWidget {
  final UserPut userPut;

  const UserPutCard({Key? key, required this.userPut}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: const EdgeInsets.all(15),
      width: 400,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 80,
                child: Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 220,
                child: Text(
                  ': ${userPut.name}',
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 80,
                child: Text(
                  'Job',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 220,
                child: Text(
                  ': ${userPut.job}',
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 80,
                child: Text(
                  'UpdatedAt',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 220,
                child: Text(
                  // Use updateAt instead of userPut.updatedAt
                  ': ${userPut.updatedAt}',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
