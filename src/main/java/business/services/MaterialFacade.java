package business.services;

import business.entities.Material;
import business.persistence.Database;
import business.persistence.MaterialMapper;

public class MaterialFacade
{
    MaterialMapper materialMapper;

    public MaterialFacade(Database database)
    {
        materialMapper = new MaterialMapper(database);
    }

    public void saveMaterial(Material material)
    {
        materialMapper.saveMaterial(material);
    }

}
