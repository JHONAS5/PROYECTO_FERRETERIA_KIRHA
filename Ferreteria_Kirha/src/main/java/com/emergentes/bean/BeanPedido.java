
package com.emergentes.bean;

import com.emergentes.entidades.Pedido;
import com.emergentes.jpa.PedidoJpaController;
import com.emergentes.jpa.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class BeanPedido {
    private EntityManagerFactory emf;
    private PedidoJpaController jpaPedido;
    
    public BeanPedido() {
        emf = Persistence.createEntityManagerFactory("ferreteriaPU");
        jpaPedido = new PedidoJpaController(emf);
    }
    
    public List<Pedido> listarTodos() {
        return jpaPedido.findPedidoEntities();
    }
    
    public void insertar(Pedido ped){
        jpaPedido.create(ped);
    }
    
    public void editar(Pedido ped){
        try {
            jpaPedido.edit(ped);
        }catch (Exception ex) {
            Logger.getLogger(BeanPedido.class.getName()).log(Level.SEVERE,null, ex);
        }
    }
    
    public void eliminar(Integer id){
        try {
            jpaPedido.destroy(id);
        }catch (NonexistentEntityException ex) {
            Logger.getLogger(BeanPedido.class.getName()).log(Level.SEVERE,null, ex);
        }
    }
    
    public Pedido buscar(Integer id){
        return jpaPedido.findPedido(id);
    }
}
