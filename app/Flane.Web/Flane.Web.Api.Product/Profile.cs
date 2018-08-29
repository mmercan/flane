using AutoMapper;
using Flane.Web.Api.Product.Models.V1;
using Flane.Web.Model.Product;

public class UserProfile : Profile
{
    public UserProfile()
    {

        //  CreateMap<ProductInfo, ProductInfoV1>()
        //  .ForMember(dest=>dest.)

        CreateMap<ProductInfoDtoV1, ProductInfo>();
        // .ForMember(dest=>dest.useTabs, opt=>opt )

        //.ForMember(dest => dest., opt => opt.MapFrom(src => $"{src.FirstName} {src.LastName}"));

        //CreateMap<ProductInfo, ProductInfoV1>().ForMember(dest => dest., opt => opt.MapFrom(src => $"{src.FirstName} {src.LastName}"));
    }
}