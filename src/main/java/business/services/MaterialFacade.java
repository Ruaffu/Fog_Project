package business.services;

import business.entities.Material;
import business.exceptions.UserException;
import business.persistence.Database;
import business.persistence.MaterialMapper;

import java.util.ArrayList;

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

    public Material getMaterialByID(int id) throws UserException
    {
       return materialMapper.getMaterialByID(id);
    }

    public Material getMaterial(String name) throws UserException
    {
        return materialMapper.getMaterial(name);
    }

    public ArrayList<Material> getMaterialByName(String name) throws UserException
    {
        return materialMapper.getMaterialByName(name);
    }

}
