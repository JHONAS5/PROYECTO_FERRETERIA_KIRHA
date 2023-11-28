/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.emergentes.jpa;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import com.emergentes.entidades.Cliente;
import com.emergentes.entidades.Empleado;
import com.emergentes.entidades.Pedido;
import com.emergentes.entidades.Venta;
import com.emergentes.jpa.exceptions.NonexistentEntityException;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author JHONASSENPAI
 */
public class PedidoJpaController implements Serializable {

    public PedidoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Pedido pedido) {
        if (pedido.getVentaList() == null) {
            pedido.setVentaList(new ArrayList<Venta>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Cliente clienteId = pedido.getClienteId();
            if (clienteId != null) {
                clienteId = em.getReference(clienteId.getClass(), clienteId.getIdCliente());
                pedido.setClienteId(clienteId);
            }
            Empleado empleadoId = pedido.getEmpleadoId();
            if (empleadoId != null) {
                empleadoId = em.getReference(empleadoId.getClass(), empleadoId.getIdEmpleado());
                pedido.setEmpleadoId(empleadoId);
            }
            List<Venta> attachedVentaList = new ArrayList<Venta>();
            for (Venta ventaListVentaToAttach : pedido.getVentaList()) {
                ventaListVentaToAttach = em.getReference(ventaListVentaToAttach.getClass(), ventaListVentaToAttach.getIdVentas());
                attachedVentaList.add(ventaListVentaToAttach);
            }
            pedido.setVentaList(attachedVentaList);
            em.persist(pedido);
            if (clienteId != null) {
                clienteId.getPedidoList().add(pedido);
                clienteId = em.merge(clienteId);
            }
            if (empleadoId != null) {
                empleadoId.getPedidoList().add(pedido);
                empleadoId = em.merge(empleadoId);
            }
            for (Venta ventaListVenta : pedido.getVentaList()) {
                Pedido oldPedidoIdOfVentaListVenta = ventaListVenta.getPedidoId();
                ventaListVenta.setPedidoId(pedido);
                ventaListVenta = em.merge(ventaListVenta);
                if (oldPedidoIdOfVentaListVenta != null) {
                    oldPedidoIdOfVentaListVenta.getVentaList().remove(ventaListVenta);
                    oldPedidoIdOfVentaListVenta = em.merge(oldPedidoIdOfVentaListVenta);
                }
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Pedido pedido) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Pedido persistentPedido = em.find(Pedido.class, pedido.getIdPedido());
            Cliente clienteIdOld = persistentPedido.getClienteId();
            Cliente clienteIdNew = pedido.getClienteId();
            Empleado empleadoIdOld = persistentPedido.getEmpleadoId();
            Empleado empleadoIdNew = pedido.getEmpleadoId();
            List<Venta> ventaListOld = persistentPedido.getVentaList();
            List<Venta> ventaListNew = pedido.getVentaList();
            if (clienteIdNew != null) {
                clienteIdNew = em.getReference(clienteIdNew.getClass(), clienteIdNew.getIdCliente());
                pedido.setClienteId(clienteIdNew);
            }
            if (empleadoIdNew != null) {
                empleadoIdNew = em.getReference(empleadoIdNew.getClass(), empleadoIdNew.getIdEmpleado());
                pedido.setEmpleadoId(empleadoIdNew);
            }
            List<Venta> attachedVentaListNew = new ArrayList<Venta>();
            for (Venta ventaListNewVentaToAttach : ventaListNew) {
                ventaListNewVentaToAttach = em.getReference(ventaListNewVentaToAttach.getClass(), ventaListNewVentaToAttach.getIdVentas());
                attachedVentaListNew.add(ventaListNewVentaToAttach);
            }
            ventaListNew = attachedVentaListNew;
            pedido.setVentaList(ventaListNew);
            pedido = em.merge(pedido);
            if (clienteIdOld != null && !clienteIdOld.equals(clienteIdNew)) {
                clienteIdOld.getPedidoList().remove(pedido);
                clienteIdOld = em.merge(clienteIdOld);
            }
            if (clienteIdNew != null && !clienteIdNew.equals(clienteIdOld)) {
                clienteIdNew.getPedidoList().add(pedido);
                clienteIdNew = em.merge(clienteIdNew);
            }
            if (empleadoIdOld != null && !empleadoIdOld.equals(empleadoIdNew)) {
                empleadoIdOld.getPedidoList().remove(pedido);
                empleadoIdOld = em.merge(empleadoIdOld);
            }
            if (empleadoIdNew != null && !empleadoIdNew.equals(empleadoIdOld)) {
                empleadoIdNew.getPedidoList().add(pedido);
                empleadoIdNew = em.merge(empleadoIdNew);
            }
            for (Venta ventaListOldVenta : ventaListOld) {
                if (!ventaListNew.contains(ventaListOldVenta)) {
                    ventaListOldVenta.setPedidoId(null);
                    ventaListOldVenta = em.merge(ventaListOldVenta);
                }
            }
            for (Venta ventaListNewVenta : ventaListNew) {
                if (!ventaListOld.contains(ventaListNewVenta)) {
                    Pedido oldPedidoIdOfVentaListNewVenta = ventaListNewVenta.getPedidoId();
                    ventaListNewVenta.setPedidoId(pedido);
                    ventaListNewVenta = em.merge(ventaListNewVenta);
                    if (oldPedidoIdOfVentaListNewVenta != null && !oldPedidoIdOfVentaListNewVenta.equals(pedido)) {
                        oldPedidoIdOfVentaListNewVenta.getVentaList().remove(ventaListNewVenta);
                        oldPedidoIdOfVentaListNewVenta = em.merge(oldPedidoIdOfVentaListNewVenta);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = pedido.getIdPedido();
                if (findPedido(id) == null) {
                    throw new NonexistentEntityException("The pedido with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Pedido pedido;
            try {
                pedido = em.getReference(Pedido.class, id);
                pedido.getIdPedido();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The pedido with id " + id + " no longer exists.", enfe);
            }
            Cliente clienteId = pedido.getClienteId();
            if (clienteId != null) {
                clienteId.getPedidoList().remove(pedido);
                clienteId = em.merge(clienteId);
            }
            Empleado empleadoId = pedido.getEmpleadoId();
            if (empleadoId != null) {
                empleadoId.getPedidoList().remove(pedido);
                empleadoId = em.merge(empleadoId);
            }
            List<Venta> ventaList = pedido.getVentaList();
            for (Venta ventaListVenta : ventaList) {
                ventaListVenta.setPedidoId(null);
                ventaListVenta = em.merge(ventaListVenta);
            }
            em.remove(pedido);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Pedido> findPedidoEntities() {
        return findPedidoEntities(true, -1, -1);
    }

    public List<Pedido> findPedidoEntities(int maxResults, int firstResult) {
        return findPedidoEntities(false, maxResults, firstResult);
    }

    private List<Pedido> findPedidoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Pedido.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Pedido findPedido(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Pedido.class, id);
        } finally {
            em.close();
        }
    }

    public int getPedidoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Pedido> rt = cq.from(Pedido.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
