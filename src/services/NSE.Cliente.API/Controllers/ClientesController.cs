using Microsoft.AspNetCore.Mvc;
using NSE.Clientes.API.Application.Commands;
using NSE.Core.Mediator;
using NSE.WebAPI.Core.Controllers;
using System;
using System.Threading.Tasks;

namespace NSE.Clientes.API.Controllers
{
    public class ClientesController : MainController
    {
        private readonly IMediatorHandler mediatorHandler;

        public ClientesController(IMediatorHandler mediatorHandler)
        {
            this.mediatorHandler = mediatorHandler;
        }

        [HttpGet("clientes")]
        public async Task<IActionResult> Index()
        {
            var resultado = await mediatorHandler.EnviarComando(new RegistrarClienteCommand(Guid.NewGuid()
                                                                                            , "Douglas"
                                                                                            , "doug@email.com.br"
                                                                                            , "39304453879"));

            return CustomResponse(resultado);
        }
    }
}
