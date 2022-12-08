package de.alphaomega.it.dmv.database.entities;

import de.alphaomega.it.dmv.database.converter.ListConverter;
import de.alphaomega.it.dmv.utils.BCryptUtil;
import jakarta.persistence.*;
import jakarta.xml.bind.annotation.XmlAttribute;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor()
@AllArgsConstructor
@Table(name = "USER")
@NamedQuery(
        name = "User.findAll",
        query = "SELECT U FROM User U"
)
@NamedQuery(
        name = "User.findByName",
        query = "SELECT U FROM User U WHERE U.username = :username"
)
@NamedQuery(
        name = "User.findByUsernameAndPassword",
        query = "SELECT U FROM User U WHERE U.username = :username AND U.password = :password"
)
@Entity
public class User implements Serializable {
    
    @Id
    @XmlAttribute(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false, unique = true)
    private long id;
    
    @XmlAttribute(name = "username")
    @Column(name = "username", unique = true, nullable = false)
    private String username;
    
    @XmlAttribute(name = "password")
    @Column(name = "password", nullable = false, unique = false)
    private String password;
    
    @Convert(converter = ListConverter.class)
    @Column(name = "permissions", nullable = false)
    private List<String> permissions;
    
    public User(final String username, final String password, final List<String> permissions) {
        this.username = username;
        this.password = BCryptUtil.hash(password);
        this.permissions = permissions;
    }
    
    @Override
    public String toString() {
        
        return "User{" + "id=" + id + ", username='" + username + '\'' + ", password='" + password + '\'' + ", permissions=" + String.join(";", permissions) + '}';
    }
}