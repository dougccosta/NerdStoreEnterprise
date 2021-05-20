using System.Collections.Generic;

namespace NSE.WebApp.MVC.Models
{
    public class ErrorViewModel
    {
        public int ErroCode { get; set; }
        public string Titulo { get; set; }
        public string Mensagem { get; set; }
    }

    public class ResponseResult
    {
        public ResponseResult()
        {
            Errors = new ResponseErrorMenssages();
        }

        public string Title { get; set; }
        public int Status { get; set; }
        public ResponseErrorMenssages Errors { get; set; }
    }

    public class ResponseErrorMenssages
    {
        public ResponseErrorMenssages()
        {
            Mensagens = new List<string>();
        }

        public List<string> Mensagens { get; set; }
    }
}
