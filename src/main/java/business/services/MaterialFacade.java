package business.services;

import business.entities.Material;
import business.exceptions.UserException;
import business.persistence.BOMMapper;
import business.persistence.Database;
import business.persistence.MaterialMapper;

import java.util.ArrayList;

public class MaterialFacade {
    MaterialMapper materialMapper;
    BOMMapper bomMapper;

    public MaterialFacade(Database database) {
        materialMapper = new MaterialMapper(database);
        bomMapper = new BOMMapper(database);
    }

    public void saveMaterialList(ArrayList<Material> materials) {
        materialMapper.saveMaterialList(materials);
    }

    public void saveMaterial(Material material) {
        materialMapper.saveMaterial(material);
    }

    public Material getMaterialByID(int id) throws UserException {
        return materialMapper.getMaterialByID(id);
    }

    public Material getMaterial(String name) throws UserException {
        return materialMapper.getMaterial(name);
    }

    public ArrayList<Material> getMaterialByName(String name) throws UserException {
        return materialMapper.getMaterialByName(name);
    }

    public Material getBOMMaterialByType(String type) throws UserException {
        return bomMapper.getBOMMaterialByType(type);
    }

    public ArrayList<Material> getAllMaterials() throws UserException {
        return materialMapper.getAllMaterials();
    }

}
