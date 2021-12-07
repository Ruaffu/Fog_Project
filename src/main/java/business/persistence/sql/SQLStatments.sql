create view billofmaterial as
select bom.id_bom, bom.order_id, bom.quantity, bom.type, bom.description, m.*
FROM bom join material m on m.id_material = bom.material_id;

