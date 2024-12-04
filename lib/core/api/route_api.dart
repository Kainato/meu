/// RouteApi é um enum que contém as rotas base das requisições HTTP da api.
enum RouteApi {
  login,
  profissionalListaFiliais,
  portariaListaPacientes,
  portariaListaPacientesMarcados,
  portariaListaPacientesDesmarcados,
  portariaMarcarPaciente,
  portariaDesmarcarPaciente,
  portariaMarcarPacienteAvulso,

  /// Lista os pacientes de uma clínica.
  listaPacientes,

  /// Módulo das ATs
  listaAtendimentos,
}

extension CoreApiExtension on RouteApi {
  String route({int? idClinica, String? dataBD, int? idPaciente}) {
    switch (this) {
      case RouteApi.login:
        return 'login';
      case RouteApi.profissionalListaFiliais:
        return 'profissional/lista/filiais';
      case RouteApi.portariaListaPacientes:
        return 'portaria/lista/pacientes/${idClinica.toString()}/${dataBD.toString()}';
      case RouteApi.portariaListaPacientesMarcados:
        return 'portaria/lista/pacientes/${idClinica.toString()}/${dataBD.toString()}/marcado';
      case RouteApi.portariaListaPacientesDesmarcados:
        return 'portaria/lista/pacientes/${idClinica.toString()}/${dataBD.toString()}/desmarcado';
      case RouteApi.portariaMarcarPaciente:
        return 'portaria/movimenta/paciente/${idClinica.toString()}/${idPaciente.toString()}/${dataBD.toString()}/marcado';
      case RouteApi.portariaDesmarcarPaciente:
        return 'portaria/movimenta/paciente/${idClinica.toString()}/${idPaciente.toString()}/${dataBD.toString()}/desmarcado';
      case RouteApi.portariaMarcarPacienteAvulso:
        return 'portaria/movimenta/avulso/';
      case RouteApi.listaPacientes:
        return 'filial/lista/pacientes/$idClinica';
      case RouteApi.listaAtendimentos:
        return 'profissional/atendimento/lista/$dataBD';
      default:
        return '';
    }
  }
}
