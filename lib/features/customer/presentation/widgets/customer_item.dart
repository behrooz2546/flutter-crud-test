import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';

class CustomerItem extends StatelessWidget {
  final CustomerModel model;
  final Function(CustomerModel) onItemTapped;
  const CustomerItem({
    Key? key,
    required this.model,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onItemTapped(model),
      child: SizedBox(
        height: 60.h,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFullName(),
                const Spacer(),
                _buildEmail(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFullName() {
    return Text(model.fullName);
  }

  Widget _buildEmail() {
    return Text(model.email ?? "");
  }
}
