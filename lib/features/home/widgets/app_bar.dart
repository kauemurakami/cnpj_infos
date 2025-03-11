import 'package:cnpj_infos/core/utils/functions/hide_keyboard.dart';
import 'package:cnpj_infos/core/utils/masks/cnpj_mask.dart';
import 'package:cnpj_infos/data/models/app_error.dart';
import 'package:cnpj_infos/data/models/cnpj.dart';
import 'package:cnpj_infos/features/home/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarWidget extends StatelessWidget implements PreferredSize {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeProvider provider = Provider.of<HomeProvider>(context, listen: false);
    return AppBar(
      actions: [
        Expanded(
          child: Row(
            children: [
              Expanded(child: SizedBox.shrink()),
              Expanded(
                flex: 5,
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    onChanged: (value) => provider.onChangedCnpj(value),
                    onSaved: (newValue) => provider.onsavedCnpj(newValue ?? ''),
                    validator: (value) => provider.validateCnpj(value ?? ''),
                    inputFormatters: [AppMasks.cnpjFormatter],
                    keyboardType: TextInputType.number,
                    maxLength: 18,
                    decoration: InputDecoration(label: Text('CNPJ')),
                  ),
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: provider.load,
                  builder: (context, load, child) => load
                      ? SizedBox(
                          height: 20.0,
                          width: 10.0,
                          child: const CircularProgressIndicator.adaptive(
                            constraints: BoxConstraints(minWidth: 20.0, maxWidth: 20.0),
                          ))
                      : IconButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final result = await provider.fetchCnpjInfos();
                              result.fold((AppError error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(error.message ?? 'Erro'),
                                  ),
                                );
                              }, (Cnpj cnpj) {
                                hideKeyboard();
                              });
                            }
                          },
                          icon: Icon(
                            Icons.search,
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 60);
}
