using Flane.Web.Sts.Models;
namespace Flane.Web.Sts.Repositories
{
    public interface ITokenRepository
    {
        bool AddToken(TokenRepoModel token);
        bool ExpireToken(TokenRepoModel token);
        TokenRepoModel GetToken(string refresh_token, string client_id);
    }
}
