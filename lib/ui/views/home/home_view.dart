import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:store_credit/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  static final formKey = GlobalKey<FormState>();

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Enter Details'),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    'Customer details',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.question_mark_rounded,
                    size: 16,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(10)),
                child: DropdownButton(
                  padding: const EdgeInsets.all(8),
                  isExpanded: true,
                  value: viewModel.selectedName,
                  onChanged: (value) => viewModel.onChangeItem(value),
                  items: viewModel.names.map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    },
                  ).toList(),
                ),
                // DropdownButtonFormField<String>(
                //   value: viewModel.selectedName,
                //   hint: const Text(
                //     'Customer Details',
                //   ),
                //   onChanged: (value) => viewModel.onChangeItem(value),
                //   validator: (value) => value == null ? 'field required' : null,
                //   items: viewModel.names.map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                // ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Credit note'),
                    validator: (value) {
                      return value!.isNotEmpty ? null : "Enter credit note";
                    },
                  )),
                  horizontalSpaceSmall,
                  Expanded(
                    child: InkWell(
                      onTap: () => viewModel.selectFromDate(context),
                      child: Container(
                        decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(4)),
                        height: 64,
                        child: Row(
                          children: [
                            Text(DateFormat.yMMMEd().format(viewModel.fromDate!)),
                            // Text('Date' ?? viewModel.fromDate.toString()),
                            const Spacer(),
                            const Icon(Icons.date_range),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              verticalSpaceSmall,
              const Row(
                children: [
                  Text(
                    'Sales in-charge',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.question_mark_rounded,
                    size: 16,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton(
                  padding: const EdgeInsets.all(8),
                  isExpanded: true,
                  value: viewModel.selectedName1,
                  onChanged: (value) => viewModel.onChangeIncharge(value),
                  items: viewModel.names1.map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    },
                  ).toList(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              verticalSpaceSmall,
              const Row(
                children: [
                  Text(
                    'Reson',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.question_mark_rounded,
                    size: 16,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton(
                  disabledHint: const Text('Select'),
                  padding: const EdgeInsets.all(8),
                  isExpanded: true,
                  value: viewModel.selectedName2,
                  onChanged: (value) => viewModel.onChangeResonForCredit(value),
                  items: viewModel.names2.map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    },
                  ).toList(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 60,
                  width: 250,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.deny(RegExp(r'^-'))],
                    decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Credit note'),
                    validator: (value) {
                      return value!.isNotEmpty ? null : "Enter credit note";
                    },
                  )),
              verticalSpaceMedium,
              // DropdownButtonFormField<String>(
              //   value: viewModel.selectedName,
              //   hint: const Text(
              //     'Customer Details',
              //   ),
              //   onChanged: (value) => viewModel.onChangeItem(value),
              //   validator: (value) => value == null ? 'field required' : null,
              //   items: viewModel.names.map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value),
              //     );
              //   }).toList(),
              // ),
              verticalSpaceLarge,
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        formKey.currentState?.save();
                        formKey.currentState?.reset();
                      }
                    },
                    child: const Text('Submit')),
              )
            ],
          ),
        ),
      )),
      drawer: const Drawer(),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
