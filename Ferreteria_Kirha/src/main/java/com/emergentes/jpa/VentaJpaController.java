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
import com.emergentes.entidades.Producto;
import com.emergentes.entidades.Pedido;
import com.emergentes.entidades.Venta;
import com.emergentes.jpa.exceptions.NonexistentEntityException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author JHONASSENPAI
 */
public class VentaJpaController implements Serializable {

    public VentaJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Venta venta) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Producto productoId = venta.getProductoId();
            if (productoId != null) {
                productoId = em.getReference(productoId.getClass(), productoId.getIdProducto());
                venta.setProductoId(productoId);
            }
            Pedido pedidoId = venta.getPedidoId();
            if (pedidoId != null) {
                pedidoId = em.getReference(pedidoId.getClass(), pedidoId.getIdPedido());
                venta.setPedidoId(pedidoId);
            }
            em.persist(venta);
            if (productoId != null) {
                productoId.getVentaList().add(venta);
                productoId = em.merge(productoId);
            }
            if (pedidoId != null) {
                pedidoId.getVentaList().add(venta);
                pedidoId = em.merge(pedidoId);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Venta venta) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Venta persistentVenta = em.find(Venta.class, venta.getIdVentas());
            Producto productoIdOld = persistentVenta.getProductoId();
            Producto productoIdNew = venta.getProductoId();
            Pedido pedidoIdOld = persistentVenta.getPedidoId();
            Pedido pedidoIdNew = venta.getPedidoId();
            if (productoIdNew != null) {
                productoIdNew = em.getReference(productoIdNew.getClass(), productoIdNew.getIdProducto());
                venta.setProductoId(productoIdNew);
            }
            if (pedidoIdNew != null) {
                pedidoIdNew = em.getReference(pedidoIdNew.getClass(), pedidoIdNew.getIdPedido());
                venta.setPedidoId(pedidoIdNew);
            }
            venta = em.merge(venta);
            if (productoIdOld != null && !productoIdOld.equals(productoIdNew)) {
                productoIdOld.getVentaList().remove(venta);
                productoIdOld = em.merge(productoIdOld);
            }
            if (productoIdNew != null && !productoIdNew.equals(productoIdOld)) {
                productoIdNew.getVentaList().add(venta);
                productoIdNew = em.merge(productoIdNew);
            }
            if (pedidoIdOld != null && !pedidoIdOld.equals(pedidoIdNew)) {
                pedidoIdOld.getVentaList().remove(venta);
                pedidoIdOld = em.merge(pedidoIdOld);
            }
            if (pedidoIdNew != null && !pedidoIdNew.equals(pedidoIdOld)) {
                pedidoIdNew.getVentaList().add(venta);
                pedidoIdNew = em.merge(pedidoIdNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = venta.getIdVentas();
                if (findVenta(id) == null) {
                    throw new NonexistentEntityException("The venta with id " + id + " no longer exists.");
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
            Venta venta;
            try {
                venta = em.getReference(Venta.class, id);
                venta.getIdVentas();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The venta with id " + id + " no longer exists.", enfe);
            }
            Producto productoId = venta.getProductoId();
            if (productoId != null) {
                productoId.getVentaList().remove(venta);
                productoId = em.merge(productoId);
            }
            Pedido pedidoId = venta.getPedidoId();
            if (pedidoId != null) {
                pedidoId.getVentaList().remove(venta);
                pedidoId = em.merge(pedidoId);
            }
            em.remove(venta);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Venta> findVentaEntities() {
        return findVentaEntities(true, -1, -1);
    }

    public List<Venta> findVentaEntities(int maxResults, int firstResult) {
        return findVentaEntities(false, maxResults, firstResult);
    }

    private List<Venta> findVentaEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Venta.class));
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

    public Venta findVenta(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Venta.class, id);
        } finally {
            em.close();
        }
    }

    public int getVentaCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Venta> rt = cq.from(Venta.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
