import List "mo:base/List";
import Debug "mo:base/Debug";

actor DPaciente {

  public type Paciente = {
    name:Text;
    gender:Text;
    age:Text;
    weight:Text;
    size:Text;
  };

  stable var pacientes: List.List<Paciente> = List.nil<Paciente>();

  public func createPaciente(nameText: Text, genderText: Text, ageText: Text, weightText: Text, sizeText: Text) {
    let newPaciente: Paciente = {
      name = nameText;
      gender = genderText;
      age = ageText;
      weight = weightText;
      size = sizeText;
    };

    pacientes:= List.push(newPaciente, pacientes);


    Debug.print("Tu paciente fue añadido con éxito!");
  };

  public query func getpacientes(): async [Paciente] {
    return List.toArray(pacientes);
  };

  public func deletePaciente(id:Nat) {
    let listFront = List.take(pacientes, id);
    let listBack = List.drop(pacientes, id + 1);
    pacientes:= List.append(listFront, listBack);


    Debug.print("Tu paciente fue eliminado con éxito!");
  };

  public func deleteAllPacientes() {
    pacientes := List.nil<Paciente>();


    Debug.print("Se han removido con éxito todos los pacientes de su lista!");
  }
}