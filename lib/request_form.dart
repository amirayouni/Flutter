import 'package:flutter/material.dart';

class RequestForm extends StatefulWidget {
  final Function(String, String) onSubmit;

  RequestForm({required this.onSubmit});

  @override
  _RequestFormState createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  final _titleController = TextEditingController();
  final _detailsController = TextEditingController();

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredDetails = _detailsController.text;

    if (enteredTitle.isEmpty || enteredDetails.isEmpty) {
      return;
    }

    widget.onSubmit(enteredTitle, enteredDetails);

    _titleController.clear();
    _detailsController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Form'),
      ),
      body: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Details'),
                controller: _detailsController,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
              ),
              ElevatedButton(
                child: Text('Submit Request'),
                onPressed: _submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
