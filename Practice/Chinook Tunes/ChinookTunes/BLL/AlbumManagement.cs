﻿using ChinookTunes.DAL;
using ChinookTunes.ViewModels;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChinookTunes.BLL
{
    [DataObject]
    public class AlbumManagement
    {
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<AlbumInfo> ListAlbums()
        {
            using (var context = new ChinookContext())
            {
                var result = from record in context.Albums
                             select new AlbumInfo
                             {
                                 ID = record.AlbumId,
                                 Title = record.Title,
                                 ArtistID = record.ArtistId,
                                 ArtistName = record.Artist.Name
                                 //                 \ NAV /
                             };
                return result.ToList();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void AddAlbum(AlbumInfo info)
        { }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void UpdateAlbum(AlbumInfo info)
        { }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void DeleteAlbum(AlbumInfo info)
        { }
    }
}
