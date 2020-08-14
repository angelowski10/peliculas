/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Sessions;

import Entitys.Comentario;
import Entitys.Pelicula;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author aljad
 */
@Stateless
public class PeliculaFacade extends AbstractFacade<Pelicula> {

    @PersistenceContext(unitName = "MisPelisPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PeliculaFacade() {
        super(Pelicula.class);
    }
    
    public List<Pelicula> PeliculaNueva() {     
        Query nativeQuery = em.createNativeQuery("SELECT * FROM pelicula WHERE anio_lanzamiento = YEAR(CURRENT_DATE())", Pelicula.class);
        return nativeQuery.getResultList();     
    }
    
    public List<Pelicula> PeliculaDestacada() {     
        Query nativeQuery = em.createNativeQuery(""
                + "SELECT  DISTINCT * FROM pelicula "
                + "INNER JOIN comentario "
                + "ON  pelicula.Id_Pelicula = comentario.Id_Pelicula "
                + "WHERE comentario.calificacion  >= 10 ", Pelicula.class);
        return nativeQuery.getResultList();     
    }
    
    public List<Comentario> Recomendadas(){
        Query nativeQuery = em.createNativeQuery("SELECT  DISTINCT * FROM comentario "
                + "INNER JOIN pelicula "
                + "ON  comentario.Id_Pelicula = pelicula.Id_Pelicula "
                + "WHERE comentario.comentario LIKE '%recomendada%' "
                + "OR comentario.comentario LIKE '%recomiendo%' ",Comentario.class);
        return nativeQuery.getResultList();
    }
    
    public List<Comentario> PeliculasPopulares() {     
        Query nativeQuery = em.createNativeQuery(""
                + "SELECT  DISTINCT * FROM comentario "
                + "INNER JOIN pelicula "
                + "ON  comentario.Id_Pelicula = pelicula.Id_Pelicula "
                + "WHERE comentario.calificacion BETWEEN 8 AND 10 ", Comentario.class);
        return nativeQuery.getResultList();     
    }
    
    public  List<Pelicula> PeliculaLetra(String letra){
        Query nativeQuery = em.createNativeQuery("SELECT * FROM pelicula where titulo like ? ",Pelicula.class);
        nativeQuery.setParameter(1, letra + "%"); 
        return nativeQuery.getResultList();
    }
    
    public  List<Pelicula> PeliculaBuscar(String palabra){
        Query nativeQuery = em.createNativeQuery("SELECT * FROM pelicula where titulo like ? ",Pelicula.class);
        nativeQuery.setParameter(1, "%" + palabra + "%"); 
        return nativeQuery.getResultList();
    }
    
    public List<Pelicula> PeliculaGenero(int id){
        Query nativeQuery = em.createNativeQuery("SELECT * FROM pelicula_genero "
                + "inner join pelicula "
                + "on pelicula.Id_Pelicula = pelicula_genero.Id_Pelicula "
                + "where pelicula_genero.Id_Genero = ? ", Pelicula.class);
        nativeQuery.setParameter(1, id);
        return  nativeQuery.getResultList();
                
    }
    
}
