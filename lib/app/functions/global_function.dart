import 'dart:developer';
import 'dart:typed_data';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:kazakhi_auto_web/api/api.dart';
import 'package:path_provider/path_provider.dart';

enum DeviceType { mobile, tablet, desktop }

class GlobalFunction {
  // Enum should be defined outside the method

  DeviceType getDeviceType(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // Defining breakpoints based on width
    if (width <= 600) {
      return DeviceType.mobile; // Mobile
    } else if (width > 600 && width <= 1024) {
      return DeviceType.tablet; // Tablet
    } else {
      return DeviceType.desktop; // Desktop
    }
  }

  Future<void> downloadPdfForWeb(String endpoint, vin) async {
    final result = await ApiClient.getBinary(endpoint);

    if (result['success'] == true) {
      try {
        final pdfBytes = result['data'] as Uint8List;

        // Create a Blob from binary PDF data
        final blob = html.Blob([pdfBytes], 'application/pdf');
        final url = html.Url.createObjectUrlFromBlob(blob);

        final anchor = html.AnchorElement(href: url)
          ..target = 'blank' // Open in a new tab (optional)
          ..download = 'report_' + vin + '.pdf'; // File name
        anchor.click();

        html.Url.revokeObjectUrl(url);

        print('PDF download initiated');
      } catch (e) {
        print('Error processing PDF download: $e');
      }
    } else {
      print('Failed to download PDF. Status: ${result['status']}');
    }
  }
}
