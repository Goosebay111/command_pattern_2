void main() {
  var action = CustomerService();
  //command is tailored to call the action (addCustomer) in by the execute method.
  var command = AddCustomerCommand(action);
  //button only has a click event that calls the execute.
  var button = Button(command);
  button.click();
}

// build complex objects
// at time of implementation, do not know what code should be executed when button is clicked.
// decouples a sender from a receiver.
// sender is the button, receiver is the object that is being created.
class Button {
  Button(this._command);
  String _label = '';
  Command _command;

  void click() => _command.execute();

  String getLabel() => _label;

  void setLabel(String label) => _label = label;
}

abstract class Command {
  void execute();
}

class CustomerService {
  void addCustomer() {
    print('Adding customer');
  }
}

class AddCustomerCommand implements Command {
  final CustomerService _customerService;

  AddCustomerCommand(this._customerService);

  @override
  void execute() {
    _customerService.addCustomer();
  }
}
