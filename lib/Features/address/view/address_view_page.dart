import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/address/controller/address_controller.dart';
import 'package:food_delivery_front_end/Features/address/viewModel/address_viewModel.dart';
import 'package:get/get.dart';

class AddressViewPage extends StatefulWidget {
  const AddressViewPage({super.key});

  @override
  State<AddressViewPage> createState() => _AddressViewPageState();
}

class _AddressViewPageState extends State<AddressViewPage> {
  AddressViewModel viewModel = AddressViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(viewModel.title)),

      body: GetBuilder<AddressControllerImpl>(
        builder: (controller) {
          return ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(
                endIndent: 10,
                indent: 10,
                color: Color(0xffEDEDED),
              );
            },
            itemCount: viewModel.address.length,
            itemBuilder: (context, index) {
              final address = viewModel.address[index];

              return RadioListTile(
                title: Row(
                  children: [
                    Text(address.title),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        viewModel.onEdit(address: address);
                      },
                      icon: Icon(
                        Icons.edit_location_alt_outlined,
                        color: Colors.green,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        viewModel.onDelete(address.id);
                      },
                      icon: Icon(Icons.delete_outline_sharp, color: Colors.red),
                    ),
                  ],
                ),
                subtitle: Text(address.address),
                value: address.active,
                groupValue: true,
                onChanged: (value) {
                  viewModel.onActive(address.id);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.onAdd();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
