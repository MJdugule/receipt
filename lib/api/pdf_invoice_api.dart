import 'dart:io';
import 'package:generate_pdf_invoice_example/api/pdf_api.dart';
import 'package:generate_pdf_invoice_example/model/customer.dart';
import 'package:generate_pdf_invoice_example/model/invoice.dart';
import 'package:generate_pdf_invoice_example/model/supplier.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class PdfInvoiceApi {
  static Future<File> generate(Invoice invoice) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
      build: (context) => [
        buildHeader(invoice),
        SizedBox(height: 3 * PdfPageFormat.cm),
        buildTitle(invoice),
         Divider(),
        buildInvoice(invoice),
        Divider(),
builddesc(invoice), 
Divider(),
buildref(invoice),        

       // buildTotal(invoice),
      ],
      footer: (context) => buildFooter(invoice),
    ));

    return PdfApi.saveDocument(name: 'my_receipts.pdf', pdf: pdf);
  }

  static Widget buildHeader(Invoice invoice) => 

  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1 * PdfPageFormat.cm),
          pw.Container(
            padding: pw.EdgeInsets.all(20),
            decoration: pw.BoxDecoration(
            color: PdfColors.grey100,
            borderRadius: pw.BorderRadius.circular(10)
          ),
          child:   Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildSupplierAddress(),
              
             pw.Text('Transaction Details', style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold))
            ],
          ),
          ),
        
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCustomerAddress(invoice.customer),
              pw.SizedBox(width: 20),
              pw.Text('Mon, 8 August 2022 09:12AM'),
              //buildInvoiceInfo(invoice.info),
            ],
          ),
        ],
      );

  static Widget buildCustomerAddress(Customer customer) => 
          pw.Container(
            decoration: pw.BoxDecoration(
            color: PdfColors.green100,
            borderRadius: pw.BorderRadius.circular(15)
          ),
          child: pw.Padding(padding: pw.EdgeInsets.all(8), child: Text(customer.name, style: TextStyle(fontWeight: FontWeight.bold, color: PdfColors.green800)), )
          
         
      );


final image = pw.MemoryImage(
  File('logo.png').readAsBytesSync(),
);
  static Widget buildSupplierAddress() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
  //         pw.Image(pw.MemoryImage(
  // File('images/logo.png').readAsBytesSync(),))
        
        ],
      );

  static Widget buildTitle(Invoice invoice) => 
  pw.Padding(padding:  pw.EdgeInsets.symmetric(vertical: 20), child: Row(
    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pw.Text('Amount',  ),
          Text(
            'N13,000',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          // SizedBox(height: 0.8 * PdfPageFormat.cm),
          // Text(invoice.info.description),
          // SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pw.Text('Fees', ),
          Text(
            'N0,000',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
          // SizedBox(height: 0.8 * PdfPageFormat.cm),
          // Text(invoice.info.description),
          // SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      )
  ]));
  


  static Widget buildInvoice(Invoice invoice) {
    return 
    pw.Padding(padding: pw.EdgeInsets.symmetric(vertical: 20), child: pw.Column(children: [
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Container(
            width: 30,
            child: pw.Text('From'), ),
        
        pw.SizedBox(width: 20),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          mainAxisAlignment: pw.MainAxisAlignment.start,
          children: [
          pw.Text('Kome Akpan', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
          pw.Text('Bird, 0429986177'),
        ])
      ]),
      pw.SizedBox(height: 20),
       pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
        pw.Container(
            width: 30,
            child: pw.Text('To'), ),
        pw.SizedBox(width: 20),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          mainAxisAlignment: pw.MainAxisAlignment.start,
          children: [
          pw.Text('Biodun Akmen', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
          pw.Text('Citi Bank, 0126627505'),
        ])
      ]),
    ]) );
   
  }
static Widget builddesc(Invoice invoice) {
    return 
    pw.Padding(padding: pw.EdgeInsets.symmetric(vertical: 20), child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          mainAxisAlignment: pw.MainAxisAlignment.start,
          children: [
          
          pw.Text('Description'),
          pw.Text('Money float refunded', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
        ])

  
     );
   
  }static Widget buildref(Invoice invoice) {
    return 
    pw.Padding(padding: pw.EdgeInsets.symmetric(vertical: 20), child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          mainAxisAlignment: pw.MainAxisAlignment.start,
          children: [
          
          pw.Text('Session ID/Transcation Reference'),
          pw.Text('0000587835686367487563', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
        ])

  
     );
   
  }



  static Widget buildFooter(Invoice invoice) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
       
          SizedBox(height: 2 * PdfPageFormat.mm),
          pw.Text('@ 2022 BirdNet Technologies. All right reserved')
         // buildSimpleText(title: 'Address', value: invoice.supplier.address),
          //SizedBox(height: 1 * PdfPageFormat.mm),
          //buildSimpleText(title: 'Paypal', value: invoice.supplier.paymentInfo),
        ],
      );

}
