
package com.emergentes.bean;

import com.emergentes.entidades.Cliente;
import com.emergentes.jpa.ClienteJpaController;
import com.emergentes.jpa.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class BeanCliente {
    private EntityManagerFactory emf;
    private ClienteJpaController jpaCliente;
    
    public BeanCliente() {
        emf = Persistence.createEntityManagerFactory("ferreteriaPU");
        jpaCliente = new ClienteJpaController(emf);
    }
    
    public List<Cliente> listarTodos() {
        return jpaCliente.findClienteEntities();
    }
    
    public void insertar(Cliente cl){
        jpaCliente.create(cl);
    }
    
    public void editar(Cliente cl){
        try {
            jpaCliente.edit(cl);
        }catch (Exception ex) {
            Logger.getLogger(BeanCliente.class.getName()).log(Level.SEVERE,null, ex);
        }
    }
    
    public void eliminar(Integer id){
        try {
            jpaCliente.destroy(id);
        }catch (NonexistentEntityException ex) {
            Logger.getLogger(BeanCliente.class.getName()).log(Level.SEVERE,null, ex);
        }
    }
    
    public Cliente buscar(Integer id){
        return jpaCliente.findCliente(id);
    }
}
