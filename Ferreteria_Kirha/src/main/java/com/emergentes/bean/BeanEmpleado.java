
package com.emergentes.bean;

import com.emergentes.entidades.Empleado;
import com.emergentes.jpa.EmpleadoJpaController;
import com.emergentes.jpa.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class BeanEmpleado {
    private EntityManagerFactory emf;
    private EmpleadoJpaController jpaEmpleado;
    
    public BeanEmpleado() {
        emf = Persistence.createEntityManagerFactory("ferreteriaPU");
        jpaEmpleado = new EmpleadoJpaController(emf);
    }
    
    public List<Empleado> listarTodos() {
        return jpaEmpleado.findEmpleadoEntities();
    }
    
    public void insertar(Empleado em){
        jpaEmpleado.create(em);
    }
    
    public void editar(Empleado em){
        try {
            jpaEmpleado.edit(em);
        }catch (Exception ex) {
            Logger.getLogger(BeanCategoria.class.getName()).log(Level.SEVERE,null, ex);
        }
    }
    
    public void eliminar(Integer id){
        try {
            jpaEmpleado.destroy(id);
        }catch (NonexistentEntityException ex) {
            Logger.getLogger(BeanEmpleado.class.getName()).log(Level.SEVERE,null, ex);
        }
    }
    
    public Empleado buscar(Integer id){
        return jpaEmpleado.findEmpleado(id);
    }
}
