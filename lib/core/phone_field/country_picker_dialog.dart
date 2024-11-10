import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';

import 'countries.dart';

class PickerDialogStyle {
  final Color? backgroundColor;

  final TextStyle? countryCodeStyle;

  final TextStyle? countryNameStyle;

  final Widget? listTileDivider;

  final EdgeInsets? listTilePadding;

  final EdgeInsets? padding;

  final Color? searchFieldCursorColor;

  final InputDecoration? searchFieldInputDecoration;

  final EdgeInsets? searchFieldPadding;

  final double? width;

  PickerDialogStyle({
    this.backgroundColor,
    this.countryCodeStyle,
    this.countryNameStyle,
    this.listTileDivider,
    this.listTilePadding,
    this.padding,
    this.searchFieldCursorColor,
    this.searchFieldInputDecoration,
    this.searchFieldPadding,
    this.width,
  });
}

class CountryPickerDialog extends StatefulWidget {
  final List<Country> countryList;
  final Country selectedCountry;
  final ValueChanged<Country> onCountryChanged;
  final String searchText;
  final List<Country> filteredCountries;
  final PickerDialogStyle? style;
  final String languageCode;

  CountryPickerDialog({
    Key? key,
    required this.searchText,
    required this.languageCode,
    required this.countryList,
    required this.onCountryChanged,
    required this.selectedCountry,
    required this.filteredCountries,
    this.style,
  }) : super(key: key);

  @override
  _CountryPickerDialogState createState() => _CountryPickerDialogState();
}

class _CountryPickerDialogState extends State<CountryPickerDialog> {
  late List<Country> _filteredCountries;
  late Country _selectedCountry;

  @override
  void initState() {
    _selectedCountry = widget.selectedCountry;
    _filteredCountries = widget.filteredCountries.toList()
      ..sort(
        (a, b) => a
            .localizedName(widget.languageCode)
            .compareTo(b.localizedName(widget.languageCode)),
      );

    super.initState();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: appTheme.bgColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.h), topRight: Radius.circular(32.h))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Padding(
          //   padding:getPadding(top: 0),
          //   child: TextField(
          //     cursorColor: widget.style?.searchFieldCursorColor,
          //     decoration: widget.style?.searchFieldInputDecoration ??
          //         InputDecoration(
          //           suffixIcon: Icon(Icons.search),
          //           labelText: widget.searchText,
          //         ),
          //     onChanged: (value) {
          //       _filteredCountries = widget.countryList.stringSearch(value)
          //         ..sort(
          //               (a, b) => a
          //               .localizedName(widget.languageCode)
          //               .compareTo(b.localizedName(widget.languageCode)),
          //         );
          //       if (this.mounted) setState(() {});
          //     },
          //   ),
          // ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.h),
                      topRight: Radius.circular(24.h)),
                  color: appTheme.bgColor),
              child: Padding(
                padding: EdgeInsets.only(top: 22.v, bottom: 22.v),
                child: Center(
                    child: Text("Select country",
                        style: theme.textTheme.headlineMedium!.copyWith(
                          color: appTheme.black900,
                        ))),
              )),
          SizedBox(height: 12.v),
          Container(
            color: appTheme.bgColor,
            height: 696.v,
            child: ListView.builder(
                padding: EdgeInsets.only(left: 16.h, right: 16.h),
                shrinkWrap: true,
                itemCount: _filteredCountries.length,
                itemBuilder: (ctx, index) => GestureDetector(
                      onTap: () {
                        _selectedCountry = _filteredCountries[index];
                        widget.onCountryChanged(_selectedCountry);
                        setState(() {
                          currentIndex = index;
                        });
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 4.v, bottom: 4.v),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: appTheme.gray300))),
                          child: Padding(
                            padding: EdgeInsets.all(16.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      _filteredCountries[index]
                                          .localizedName(widget.languageCode),
                                      style:
                                          TextStyle(color: appTheme.black900),
                                      // style: AppStyle.txtHeadlineblack800,
                                    ),
                                    Text(
                                      ' (+${_filteredCountries[index].dialCode})',
                                      style:
                                          TextStyle(color: appTheme.black900),
                                      // style: AppStyle.txtRobotoRegular18
                                    ),
                                  ],
                                ),
                                _selectedCountry == _filteredCountries[index]
                                    ? CustomImageView(
                                        imagePath: ImageConstant.imgTickIcon,
                                      )
                                    : SizedBox()
                              ],
                            ),
                          ),
                        ),
                      ),
                    )

                //     Column(
                //   children: <Widget>[
                //     ListTile(
                //       // leading:
                //       // kIsWeb
                //       //     ? Image.asset(
                //       //   'assets/flags/${_filteredCountries[index].code.toLowerCase()}.png',
                //       //   package: 'intl_phone_field',
                //       //   width: 32,
                //       // )
                //       //     : Text(
                //       //   _filteredCountries[index].flag,
                //       //   style: TextStyle(fontSize: 18),
                //       // ),
                //       // contentPadding: widget.style?.listTilePadding,
                //       title: Text(
                //         _filteredCountries[index]
                //             .localizedName(widget.languageCode),
                //         style: widget.style?.countryNameStyle ??
                //             TextStyle(fontWeight: FontWeight.w700),
                //       ),
                //       trailing: Text(
                //         '+${_filteredCountries[index].dialCode}',
                //         style: widget.style?.countryCodeStyle ??
                //             TextStyle(fontWeight: FontWeight.w700),
                //       ),
                //       onTap: () {
                //         _selectedCountry = _filteredCountries[index];
                //         widget.onCountryChanged(_selectedCountry);
                //         Navigator.of(context).pop();
                //       },
                //     ),
                //     widget.style?.listTileDivider ?? Divider(thickness: 1),
                //   ],
                // ),
                ),
          ),
        ],
      ),
    );
  }
}
