/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entitys;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author aljad
 */
@Entity
@Table(name = "tipo_usuario")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoUsuario.findAll", query = "SELECT t FROM TipoUsuario t")
    , @NamedQuery(name = "TipoUsuario.findByIdTipousuario", query = "SELECT t FROM TipoUsuario t WHERE t.idTipousuario = :idTipousuario")})
public class TipoUsuario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "Id_Tipo_usuario")
    private Integer idTipousuario;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    @Column(name = "tipo_usuario")
    private String tipoUsuario;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idTipousuario")
    private List<Usuario> usuarioList;

    public TipoUsuario() {
    }

    public TipoUsuario(Integer idTipousuario) {
        this.idTipousuario = idTipousuario;
    }

    public TipoUsuario(Integer idTipousuario, String tipoUsuario) {
        this.idTipousuario = idTipousuario;
        this.tipoUsuario = tipoUsuario;
    }

    public Integer getIdTipousuario() {
        return idTipousuario;
    }

    public void setIdTipousuario(Integer idTipousuario) {
        this.idTipousuario = idTipousuario;
    }

    public String getTipoUsuario() {
        return tipoUsuario;
    }

    public void setTipoUsuario(String tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }

    @XmlTransient
    public List<Usuario> getUsuarioList() {
        return usuarioList;
    }

    public void setUsuarioList(List<Usuario> usuarioList) {
        this.usuarioList = usuarioList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTipousuario != null ? idTipousuario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoUsuario)) {
            return false;
        }
        TipoUsuario other = (TipoUsuario) object;
        if ((this.idTipousuario == null && other.idTipousuario != null) || (this.idTipousuario != null && !this.idTipousuario.equals(other.idTipousuario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entitys.TipoUsuario[ idTipousuario=" + idTipousuario + " ]";
    }
    
}
