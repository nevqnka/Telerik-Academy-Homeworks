//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace _1._3.World
{
    using System;
    using System.Collections.Generic;
    
    public partial class City
    {
        public int CityID { get; set; }
        public string CityName { get; set; }
        public string CountryId { get; set; }
        public Nullable<int> CityPopulation { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
    
        public virtual Country Country { get; set; }
    }
}
