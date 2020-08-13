/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Sessions;

import Entitys.Usuario;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author aljad
 */
@Stateless
public class UsuarioFacade extends AbstractFacade<Usuario> {

    @PersistenceContext(unitName = "MisPelisPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsuarioFacade() {
        super(Usuario.class);
    }
    
    public Usuario BuscarUsuario(String usuario, String password)
    {
        Query query = getEntityManager().createNativeQuery("SELECT * FROM usuario "
                + "WHERE nom_usuario = ? AND password = ? ", Usuario.class);
        query.setParameter(1, usuario);
        query.setParameter(2, password);
        return (Usuario)query.getSingleResult();
    }
}
