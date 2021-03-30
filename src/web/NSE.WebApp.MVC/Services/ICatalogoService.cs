﻿using NSE.WebApp.MVC.Models;
using Refit;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace NSE.WebApp.MVC.Services
{
    public interface ICatalogoService
    {
        Task<ProdutoViewModel> ObterPorId(Guid id);
        Task<IEnumerable<ProdutoViewModel>> ObterTodos();
    }

    public interface ICatalogoServiceRefit
    {
        [Get("/catalogo/produtos/{id}")]
        Task<ProdutoViewModel> ObterPorId(Guid id);

        [Get("/catalogo/produtos/")]
        Task<IEnumerable<ProdutoViewModel>> ObterTodos();
    }
}